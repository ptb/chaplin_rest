define [
  '_base/base_react_view'
  'users/edit/user_edit_component'
  ], (ReactView, UserEditComponent) ->
  'use strict'

  class UserEditView extends ReactView
    component: UserEditComponent
    container: '#js-main'
