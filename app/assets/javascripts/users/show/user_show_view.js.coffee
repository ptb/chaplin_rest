define [
  'users/_base/user_base_view'
  'users/show/user_show_template'
  ], (UserView, template) ->
  'use strict'

  class UserShowView extends UserView
    template: template
    container: '#js-main'
