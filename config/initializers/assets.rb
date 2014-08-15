# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#
# nvd3 Packages
Rails.application.config.assets.precompile += %w( nv.d3.css )
#
Rails.application.config.assets.precompile += %w(  d3.v3.js )
Rails.application.config.assets.precompile += %w(  nv.d3.js )
Rails.application.config.assets.precompile += %w(  tooltip.js )
Rails.application.config.assets.precompile += %w(  utils.js )
Rails.application.config.assets.precompile += %w(  interactiveLayer.js )
Rails.application.config.assets.precompile += %w(  legend.js )
Rails.application.config.assets.precompile += %w(  axis.js )
Rails.application.config.assets.precompile += %w(  scatter.js )
Rails.application.config.assets.precompile += %w(  line.js )
Rails.application.config.assets.precompile += %w(  lineChart.js )
#
Rails.application.config.assets.precompile += %w( orders.js )
