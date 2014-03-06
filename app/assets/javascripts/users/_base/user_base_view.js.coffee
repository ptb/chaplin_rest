define ['_base/base_view'], (View) ->
  'use strict'

  class UserView extends View
    bindings:
      '.first_name': 'first_name'
      '.last_name': 'last_name'
