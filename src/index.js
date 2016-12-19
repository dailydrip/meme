// Load the webcomponentsjs polyfill
require('script!../bower_components/webcomponentsjs/webcomponents.js')

window.Polymer = {
  dom: 'shadow',
  lazyRegister: true,
  useNativeCSSProperties: true,
}

// Require your main webcomponent file (that can be just a file filled with html imports, custom styles or whatever)
require('vulcanize?es6=false&base=./!./imports.html')

require('./main.css');

window.addEventListener('WebComponentsReady', () => {
  let Elm = require('./Main.elm')
  let root = document.getElementById('root')
  let app = Elm.Main.embed(root)
})
