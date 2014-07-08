define ['_base/base_haml_view'], (HamlView) ->
  'use strict'

  class UserView extends HamlView
    bindings:
      '.first_name': 'first_name'
      '.last_name': 'last_name'
