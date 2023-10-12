const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const RtlCssPlugin = require("rtlcss-webpack-plugin");

module.exports = {
    plugins: [
        new MiniCssExtractPlugin(),
        new RtlCssPlugin('main.rtl.css')
    ],
    entry: {
        'theme': __dirname + "/src/theme.js",
        'main': __dirname + "/src/bundle.js",
    },
    output: {
        path: path.resolve(__dirname, 'assets/build'),
        clean: true,
    },
    module: {
        rules: [
            {
                test: /\.scss$/i,
                use: [
                    MiniCssExtractPlugin.loader,
                    "css-loader",
                    "sass-loader",
                ],
            },
        ],
    }
};
