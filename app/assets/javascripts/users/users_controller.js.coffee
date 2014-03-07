define [
  '_base/base_controller'
  'users/user_model'
  'users/users_collection'
  'users/list/users_list_view'
  'users/show/user_show_view'
  'users/edit/user_edit_view'
  ], (Controller, User, Users, UsersListView, UserShowView, UserEditView) ->
  'use strict'

  class UsersController extends Controller
    beforeAction: (params, route) ->
      @reuse('users', Users)
      @reuse('users').fetch() if @reuse('users').length is 0

    list: (params) ->
      @view = new UsersListView
        collection: @reuse('users')

    show: (params) ->
      @view = new UserShowView
        collection: @reuse('users')
        model: @reuse('users').get(params.id)

    new: (params) ->
      @view = new UserEditView
        collection: @reuse('users')
        model: new User()

    edit: (params) ->
      @view = new UserEditView
        collection: @reuse('users')
        model: @reuse('users').get(params.id)
