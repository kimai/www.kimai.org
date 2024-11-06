const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const RtlCssPlugin = require("rtlcss-webpack-plugin");
const CompressionPlugin = require("compression-webpack-plugin");

module.exports = {
    plugins: [
        new MiniCssExtractPlugin(),
        new RtlCssPlugin('main.rtl.css'),
        new CompressionPlugin({
            algorithm: 'gzip',
            filename: '[path][base].gz',
            test: /\.js$|\.css$|\.html$|\.svg$|\.eot$|\.woff$|\.woff2$|\.ttf$|\.txt$/,
            threshold: 10240,
            minRatio: 0.8
        }),
    ],
    entry: {
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
