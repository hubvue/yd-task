const { join } = require("path");
const _ = require("lodash");
let config = {
    "viewDir": join(__dirname, "..", 'views'),
    'staticDir': join(__dirname, "..", "assets"),
    'logsDir' : join(__dirname ,'..',"logs/log.log"),
}
if (process.env.NODE_ENV == 'development') {
    let devConfig = {
        port : 8081,
        baseUrl : "http://127.0.0.1/bookadmin/web/index.php?r=book",
        cacheMemory : false,
    }
    config = _.extend(config,devConfig);
}
if (process.env.NODE_ENV == 'production') {
    let prodConfig = {
        port : 8081,
        cacheMemory : " memory",
    }
    config = _.extend(config,prodConfig);
}

module.exports = config;