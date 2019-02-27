const merge = require("webpack-merge");
const path = require("path");
const parts = require("./webpack.parts");

const config = {
    output: {
        path: path.join(__dirname, '..','dist'),
        filename: 'assets/scripts/[name]-[hash:5].js',
    },
}

module.exports = merge([
    config,
])