define ['_base/base_view'], (View) ->
  'use strict'

  class ProjectView extends View
    bindings:
      '.name': 'name'
