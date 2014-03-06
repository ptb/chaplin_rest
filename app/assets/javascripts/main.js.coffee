requirejs.config
  urlArgs: 'bust=' + (new Date()).getTime()

require ['_base/base_application', 'routes'], (Application, routes) ->
  'use strict'

  new Application
    controllerPath: ''
    # pushState: false
    routes: routes
    title: ''
