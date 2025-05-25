const express = require("express");
const {
  RequestQR,
  refresh,
  select,
  create,
  update,
} = require("@/controllers/khqr-controller");
const router = express.Router();

router.get("/", select);
router.get("/re", refresh);
router.post("/", create);
router.post("/re", RequestQR);
router.put("/:id", update);

module.exports = router;
