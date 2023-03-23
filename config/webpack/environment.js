const { environment } = require('@rails/webpacker')

module.exports = environment

/*以下は自分で追記した箇所*/
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)