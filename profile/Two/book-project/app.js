const Koa = require("koa");
const static = require("koa-static");
const co = require("co");
const render = require("koa-swig");
const errorHandle = require("./middlewares/errorHandle");
const config = require("./config");
const logHandle = require("./middlewares/logHandle")();
const parser = require("koa-parser");
const app = new Koa();

//body参数
app.use(parser());

//模板渲染
app.context.render = co.wrap(render({
    root : config.viewDir,
    autoescape : true,
    cache : config.cacheMemory,
    ext : 'html',
    writeBody :false
}))
//静态资源
app.use(static(config.staticDir));

//404 500容错机制
errorHandle.error(app,logHandle);
//路由管理
require("./routes/route")(app);

app.listen(config.port,()=>{
    console.log("Server is runnind...");
})