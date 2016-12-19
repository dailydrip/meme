const pathExists = require('path-exists');
const chalk = require('chalk');
const webpack = require('webpack');
const config = require('../config/webpack.config.prod');

if (pathExists.sync('elm-package.json') === false) {
  console.log('Please, run the build script from project root directory');
  process.exit(1);
}

console.log('\nStarting production build...\n');

// Initialize webpack, using the long way: http://webpack.github.io/docs/node.js-api.html#the-long-way
webpack(config).run(function (err, stats) {

  if (err !== null) {
    console.log(chalk.red(err));
    process.exit(1);
  } else {
    var statsFormatted = stats.toString({
      chunks: false,
      colors: true
    });

    console.log(chalk.green('\n' + statsFormatted));
    console.log(chalk.green('\n' + 'Production build is ready in `dist/` folder'));
  }
});
