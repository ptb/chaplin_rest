define ['_base/base_haml_view'], (HamlView) ->
  'use strict'

  class ProjectView extends HamlView
    bindings:
      '.name': 'name'
