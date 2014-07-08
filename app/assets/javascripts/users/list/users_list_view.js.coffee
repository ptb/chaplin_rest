define [
  '_base/base_react_view'
  'users/list/users_list_component'
  ], (ReactView, UsersListComponent) ->
  'use strict'

  class UsersListView extends ReactView
    component: UsersListComponent
    container: '#js-main'
