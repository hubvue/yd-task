const argv = require('yargs-parser')(process.argv.slice(2));
const merge = require('webpack-merge');
const HtmlWebpackPlugin = require('html-webpack-plugin');
//参数变量
const _mode = argv.mode || 'development';
//按照环境require配置
const _mergeConfig = require(`./config/webpack.${_mode}.js`);
//在指定的文件内找到对应的文件
const glob = require("glob");

//找到入口
const files = glob.sync("./src/web/views/**/*.entry.js");
//插件
let _plugins  = [];
//生成entry
let entrys =  files.reduce((target,file) => {
    if((/.+\/([a-zA-Z]+-[a-zA-Z]+)(\.entry\.js$)/).test(file) == true){
        //取到匹配的字符串
        const entryKey = RegExp.$1;
    
        target[entryKey] = file;
        const [ dist , template ] = entryKey.split('-');
        _plugins.push(new HtmlWebpackPlugin({
            filename: `views/${dist}/${template}.html`,
            template : `./src/web/views/${dist}/pages/${template}.html`,
            inject : false,  //禁止插入js和css
        }))

    }
    return target;
},{}) 

//配置文件
const config = {
    entry : entrys,
    plugins : [
        ..._plugins
    ],
}


module.exports = merge([
    _mergeConfig,
    config,
])