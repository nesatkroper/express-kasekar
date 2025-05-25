const axios = require("axios");
const prisma = require("@/lib/prisma");
const { DateTime } = require("luxon");
const { invalidate } = require("@/utils/base-redis");
const { baseSelect, baseUpdate, basePatch, baseDestroy } = require("@/utils");

const model = "attendance";

const refresh = async (req, res) => {
  await invalidate(`${model}:*`);
  return res.status(203).json({ msg: "Cache invalidated" });
};

const select = async (req, res) => {
  try {
    const result = await baseSelect(
      model,
      req.params.id,
      req.query,
      "createdAt"
    );

    if (!result || (Array.isArray(result) && !result.length))
      return res.status(404).json({ msg: "No data found" });

    return res.status(200).json(result);
  } catch (err) {
    console.error("Error:", err);
    return res.status(500).json({ error: `Error: ${err.message}` });
  }
};

const qrgenerator = async (req, res) => {
  const key = process.env.QR_KEY;
  try {
    if (!key) return res.status(400).json({ error: "QR key is not set." });
    else {
      return res.status(200).json({
        success: true,
        data: key,
      });
    }
  } catch (error) {
    console.error("Error generating QR code:", error);
    return res.status(500).json({ error: "Internal Server Error" });
  }
};

const create = async (req, res) => {
  const { employeeId, note, eventId, key } = req.body;
  const token = process.env.BOT2_TOKEN;
  const channel = process.env.CHANNEL_ATTENDANCE;

  if (key !== process.env.QR_KEY) {
    return res.status(403).json({
      success: false,
      error: "Invalid QR key.",
    });
  }

  if (!employeeId || !eventId) {
    return res.status(400).json({
      success: false,
      error: "employeeId and eventId are required.",
    });
  }

  try {
    const emp = await prisma.employee.findUnique({
      where: { employeeId },
    });

    if (!emp) {
      return res.status(404).json({
        success: false,
        error: "Employee not found",
      });
    }

    const message = `
      *New Attendance Received!*
      --------------------------
      *Employee ID:* ${employeeId}
      *Name:* ${emp.firstName} ${emp.lastName}
      *Code:* ${emp.employeeCode}
      *Event ID:* ${eventId}
      *Time:* ${new Date().toLocaleString()}
      ${note ? `*Note:* ${note}` : ""}
    `;

    const result = await prisma.$transaction(async (tx) => {
      const attendance = await tx.attendance.create({
        data: {
          employeeId,
          note: note || null,
          eventId,
        },
      });

      const url = `https://api.telegram.org/bot${token}/sendMessage`;
      const telegramResponse = await axios.post(url, {
        chat_id: channel,
        text: message,
        parse_mode: "Markdown",
      });

      if (telegramResponse.status !== 200) {
        throw new Error("Failed to send Telegram notification");
      }

      return {
        attendanceId: attendance.attendanceId,
        telegramStatus: "sent",
      };
    });

    return res.status(200).json({
      success: true,
      data: {
        employeeId,
        ...result,
      },
    });
  } catch (error) {
    console.error("Error:", error.message);

    if (error.code === "P2002") {
      return res.status(400).json({
        success: false,
        error: "Attendance record already exists",
      });
    }

    return res.status(500).json({
      success: false,
      error: "Attendance creation failed",
      ...(process.env.NODE_ENV === "development" && {
        details: error.message,
      }),
    });
  }
};

// const create = async (req, res) => {
//   const { employeeId, address, note, eventId } = req.body;
//   const token = process.env.BOT2_TOKEN;
//   const channel = process.env.CHANNEL_ATTENDANCE;

//   if (!employeeId || !address) {
//     return res
//       .status(400)
//       .json({ success: false, error: "All field are required." });
//   }

//   const emp = await prisma.employee.findUnique({
//     where: {
//       employeeId,
//     },
//   });

//   if (!emp) {
//     return res
//       .status(404)
//       .json({ success: false, error: "Employee not found." });
//   }

//   try {
//     const message = `
//       *New Attendance Received!*
//       ---------------------------------------------------------
//         -*Employee ID:* *${employeeId}*
//         -*Employee Name:* *${emp.firstName} ${emp.lastName}*
//         -*Employee Code:* *${emp.employeeCode}*
//         -*From Address:* ${address}
//       ---------------------------------------------------------
//       📅 *Register Date:* ${new Date().toLocaleString()}
//       `;

//     const url = `https://api.telegram.org/bot${token}/sendMessage`;

//     const telegramResponse = await axios.post(url, {
//       chat_id: channel,
//       text: message,
//       parse_mode: "Markdown",
//     });

//     if (telegramResponse.status === 200) {
//       await prisma[model].create({
//         data: {
//           employeeId: emp.employeeId,
//           datetime: DateTime.now().setZone("Asia/Phnom_Penh").toISO(),
//           note,
//           address,
//           eventId,
//         },
//       });

//       return res.status(200).json({
//         success: true,
//         telegramResponse: telegramResponse.data,
//         employee: emp,
//       });
//     } else {
//       return res.status(400).json({
//         success: false,
//         error: telegramResponse.data,
//         data: telegramResponse,
//       });
//     }
//   } catch (error) {
//     console.error("Error sending attendance notification:", error);
//     return res
//       .status(500)
//       .json({ success: false, error: "Internal Server Error: ", error });
//   }
// };

const update = async (req, res) => {
  try {
    const result = await baseUpdate(model, req.params.id, req.body);

    await invalidate(`${model}:*`);
    return res.status(201).json(result);
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: `Error: ${err.message}` });
  }
};

const patch = async (req, res) => {
  try {
    const result = await basePatch(model, req.params.id, req.query.type);

    await invalidate(`${model}:*`);
    return res.status(201).json(result);
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: `Error :${err}` });
  }
};

const destroy = async (req, res) => {
  try {
    const result = await baseDestroy(model, req.params.id);

    await invalidate(`${model}:*`);
    return res.status(201).json(result);
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: `Error: ${err.message}` });
  }
};

module.exports = {
  qrgenerator,
  select,
  create,
  update,
  patch,
  destroy,
  refresh,
};
