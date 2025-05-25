const { BakongKHQR, khqrData, IndividualInfo } = require("bakong-khqr");
const { invalidate } = require("@/utils/base-redis");
const { baseSelect, baseCreate, baseUpdate } = require("@/utils");

const model = "khqr";

const RequestQR = async (req, res) => {
  const info = await baseSelect(model, req.params.id, req.query, "createdAt");
  const qrinfo = await info.data[0];
  const { amount, currency } = req.body;

  const currencyValue = currency === "usd" ? "usd" : "khr";

  try {
    const optionalData = {
      currency: khqrData.currency[currencyValue],
      amount: amount,
    };

    const individualInfo = new IndividualInfo(
      qrinfo.account,
      qrinfo.name,
      qrinfo.city,
      optionalData
    );
    const KHQR = new BakongKHQR();
    const individual = await KHQR.generateIndividual(individualInfo);

    res.status(200).json({
      md5: individual.data.md5,
      qr: individual.data.qr,
    });
  } catch (error) {
    console.error("Failed to generate KHQR:", error);
    res.status(500).json({ error: "Failed to generate KHQR" });
  }
};

const renew = async (req, res) => {
  try {
    const email = process.env.BAKONG_EMAIL || "phanunboy007@gmail.com";
    const response = await fetch(
      "https://api-bakong.nbc.gov.kh/v1/renew_token",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email }),
      }
    );
    if (!response.ok) throw new Error("Failed to renew token");
    else await res.status(200).json(response);
  } catch (error) {
    console.error("Failed to renew token:", error);
    res.status(500).json({ error: "Failed to renew token" });
  }
};

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

const create = async (req, res) => {
  try {
    const result = await baseCreate(model, req.data);

    await invalidate(`${model}:*`);
    return res.status(201).json(result);
  } catch (err) {
    console.error(`Error creating ${model}:`, err);
    return res.status(500).json({ error: `Error :${err}` });
  }
};

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

module.exports = { RequestQR, refresh, select, create, update, renew };
