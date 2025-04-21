const express = require("express");
const path = require("path");

module.exports = function protectedStatic(dirPath, options = {}) {
  const staticHandler = express.static(dirPath);
  const { authMiddleware, requireAuth = true } = options;

  return function (req, res, next) {
    // If auth is not required or no auth middleware provided, serve static files directly
    if (!requireAuth || !authMiddleware) {
      return staticHandler(req, res, next);
    }

    // Otherwise, use the auth middleware
    authMiddleware(req, res, (err) => {
      if (err) return next(err);
      staticHandler(req, res, next);
    });
  };
};
