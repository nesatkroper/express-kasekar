const express = require("express");
const router = express.Router();

const {
  select,
  create,
  update,
  patch,
  destroy,
  refresh,
  qrgenerator,
} = require("@/controllers/attendance-controller");

router.get("/re", refresh);
router.get("/gen", qrgenerator);
router.get("/:id?", select);
router.post("/", create);
router.put("/:id", update);
router.patch("/:id", patch);
router.delete("/:id", destroy);

module.exports = router;
