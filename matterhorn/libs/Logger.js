var winston = require('winston');

var logger = new (winston.Logger)({
  transports: [
    new (winston.transports.Console)({ json: true, timestamp: true }),
    new (winston.transports.File)({ filename: __dirname + '/../logs/debug.log', json: false })
  ],
  exitOnError: false
});

module.exports = logger;