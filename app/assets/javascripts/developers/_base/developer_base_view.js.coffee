define ['_base/base_view'], (View) ->
  'use strict'

  class DeveloperView extends View
    bindings:
      '.name': 'name'
