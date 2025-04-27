const express = require("express");
const path = require("path");
const fs = require("fs");

module.exports = function protectedStatic(dirPath, options = {}) {
  const {
    authMiddleware,
    requireAuth = true,
    defaultImage = "default.png",
  } = options;

  return function (req, res, next) {
    const filePath = path.join(dirPath, req.path);

    fs.access(filePath, fs.constants.F_OK, (err) => {
      if (err) {
        if (defaultImage && fs.existsSync(path.join(dirPath, defaultImage)))
          req.url = `/${defaultImage}`;
        else return res.status(204).end();
      }

      if (requireAuth && authMiddleware) {
        return authMiddleware(req, res, (err) => {
          if (err) return next(err);
          express.static(dirPath)(req, res, next);
        });
      }

      express.static(dirPath)(req, res, next);
    });
  };
};
