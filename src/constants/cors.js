const allowedOrigins = [
  "http://74.50.67.162",
  "http://localhost:5173",
  "https://huotsopheaksakana.site"
];

const allowedHeaders = [
  "Origin",
  "X-Requested-With",
  "Content-Type",
  "Accept",
  "Authorization",
  "X-Access-Token",
];

const exposedHeaders = [
  "Content-Length",
  "Content-Type",
  "ETag",
  "Last-Modified",
];

const methods = ["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD"];

const transports = ["websocket", "polling"];

module.exports = {
  allowedOrigins,
  allowedHeaders,
  methods,
  transports,
  exposedHeaders,
};
