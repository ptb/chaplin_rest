define ['_base/base_haml_view'], (HamlView) ->
  'use strict'

  class DeveloperView extends HamlView
    bindings:
      '.name': 'name'
