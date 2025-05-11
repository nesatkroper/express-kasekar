const allowedOrigins = [
  "http://localhost:5173",
  "http://74.50.67.162",
  "http://74.50.67.162:3100",
  "https://74.50.67.162:3100",
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
