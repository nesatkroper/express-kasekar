const prisma = require("@/provider/client");
const { invalidate } = require("@/utils/base-redis");
const { baseCreate } = require("@/utils");

const model = "cart";

const refresh = async (req, res) => {
  await invalidate(`${model}:*`);
  return res.status(203).json({ msg: "Cache invalidated" });
};

const select = async (req, res) => {
  try {
    const result = await prisma.Cart.findMany({
      where: {
        authId: req.params.id,
      },
      include: {
        product: true,
      },
    });

    if (!result || (Array.isArray(result) && !result.length))
      return res.status(400).json({ msg: "no data" });
    return res.status(200).json(result);
  } catch (err) {
    return res.status(500).json({ error: `Error :${err}` });
  }
};

const create = async (req, res) => {
  try {
    const data = { ...req.body, quantity: 1 };

    const result = await baseCreate(model, data);

    await invalidate(`${model}:*`);
    return res.status(201).json(result);
  } catch (err) {
    return res.status(500).json({ error: `Error :${err}` });
  }
};

const qtyIncrease = async (req, res) => {
  try {
    const { cartId } = req.params;

    const findCart = await prisma.cart.findUnique({
      where: {
        cartId: parseInt(cartId, 10),
      },
    });

    const update = await prisma.cart.update({
      where: {
        cartId: parseInt(cartId, 10),
      },
      data: {
        quantity: (findCart.quantity, 10) + 1,
      },
    });

    await invalidate(`${model}:*`);
    return res.status(201).json(update);
  } catch (err) {
    console.log(err);
    return res.status(500).json({ error: `Error :${err}` });
  }
};
const qtyDecrease = async (req, res) => {
  try {
    const { cartId } = req.params;

    const findCart = await prisma.cart.findUnique({
      where: {
        cartId: parseInt(cartId, 10),
      },
    });

    if (findCart.quantity === 1) {
      const destroy = await prisma.cart.delete({
        where: { cartId: parseInt(cartId) },
      });

      await invalidate(`${model}:*`);
      return res.status(201).json(destroy);
    } else {
      const update = await prisma.cart.update({
        where: {
          cartId: parseInt(cartId, 10),
        },
        data: {
          quantity: (findCart.quantity, 10) - 1,
        },
      });

      await invalidate(`${model}:*`);
      return res.status(201).json(update);
    }
  } catch (err) {
    console.log(err);
    return res.status(500).json({ error: `Error :${err}` });
  }
};

const destroy = async (req, res) => {
  try {
    const { cartId } = req.params;

    const destroy = await prisma.cart.delete({
      where: { cartId: parseInt(cartId) },
    });

    await invalidate(`${model}:*`);
    return res.status(201).json(destroy);
  } catch (err) {
    return res.status(500).json({ error: `Error :${err}` });
  }
};

module.exports = { select, create, qtyIncrease, qtyDecrease, destroy, refresh };
