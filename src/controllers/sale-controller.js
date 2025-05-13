const prisma = require("@/provider/client");
const path = require("path");
const {
  baseSelect,
  baseCreate,
  baseUpdate,
  basePatch,
  baseDestroy,
} = require("../utils");
const { data } = require("@/middleware/app-logger-middleware");

const model = "sale";

const select = async (req, res) => {
  try {
    const result = await baseSelect(
      model,
      req.params.id,
      req.query,
      `${model}_id`
    );

    if (!result || (Array.isArray(result) && !result.length)) {
      return res.status(404).json({ msg: "No data found" });
    }
    return res.status(200).json(result);
  } catch (err) {
    console.error("Error:", err);
    return res.status(500).json({ error: `Error: ${err.message}` });
  }
};

const create = async (req, res) => {
  await prisma.$transaction(async (tx) => {
    try {
      const picture = req.file ? path.basename(req.file.path) : null;
      const { employeeId, customerId, saleDate, amount, memo, cartItems } = req.body;

      const sale = await tx.sale.create({
        data: {
          employeeId,
          customerId,
          saleDate,
          amount,
          memo,
          picture,
          status: "active"
        }
      });

      for (const item of cartItems) {
        await tx.saledetail.create({
          data: {
            saleId: sale.saleId,
            productId: item.productId,
            quantity: item.quantity,
            amount: item.amount,
            memo: item.memo,
            status: "active"
          }
        });

        await tx.stock.update({
          where: {
            productId: item.productId
          },
          data: {
            quantity: {
              decrement: item.quantity
            },
            memo: "Sale",
            status: "active"
          }
        });

      };


    } catch (err) {
      console.log(err)
    }
  });
}

// const create = async (req, res) => {
//   try {
//     const data = { ...req.body };

//     const result = await baseCreate(model, data);
//     return res.status(201).json(result);
//   } catch (err) {
//     console.error(`Error creating ${model}:`, err);
//     return res.status(500).json({ error: `Error :${err}` });
//   }
// };

const update = async (req, res) => {
  try {
    const result = await baseUpdate(model, req.params.id, req.body);

    return res.status(201).json(result);
  } catch (err) {
    return res.status(500).json({ error: `Error: ${err.message}` });
  }
};

const patch = async (req, res) => {
  try {
    const result = await basePatch(model, req.params.id, req.query.type);

    return res.status(201).json(result);
  } catch (err) {
    return res.status(500).json({ error: `Error :${err}` });
  }
};

const destroy = async (req, res) => {
  try {
    const result = await baseDestroy(model, req.params.id);
    return res.status(201).json(result);
  } catch (err) {
    return res.status(500).json({ error: `Error: ${err.message}` });
  }
};

module.exports = {
  select,
  create,
  update,
  patch,
  destroy,
};
