define [
  '_base/base_react_view'
  'users/show/user_show_component'
  ], (ReactView, UserShowComponent) ->
  'use strict'

  class UserShowView extends ReactView
    component: UserShowComponent
    container: '#js-main'
