const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: "development",
  entry: './src/index.coffee',
  output: {
    path: path.resolve(__dirname, 'docs/assets'),
    publicPath: '/assets/',
    filename: 'bundle.js'
  },
  devServer: {
    inline: true,
    contentBase: './docs',
    port: 3000,
    https: true,
    headers: {
      'Access-Control-Allow-Origin': '*'
    }
  },
  module: {
    rules: [{
      test: /\.pug$/,
      use: ['pug-loader']
    },{
      test: /\.coffee$/,
      use: [
        {
          loader: 'coffee-loader',
          options: {
            transpile: {
              presets: ['@babel/preset-env']
            }
          }
        }
      ]
    },{
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
    }]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, 'src/index.pug'),
      filename: path.resolve(__dirname, 'docs/index.html')
    })
  ]
};
