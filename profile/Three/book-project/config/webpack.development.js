const merge = require("webpack-merge");
const path = require("path");
const parts = require("./webpack.parts");

const config = {
    output: {
        path: path.join(__dirname, '..','dist'),
        filename: 'assets/scripts/[name].js',
    },
}

module.exports = merge([
    config,
])