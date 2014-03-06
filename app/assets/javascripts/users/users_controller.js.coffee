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

      collection = @reuse('users')
      collection.fetch() if collection.length is 0

    list: (params) ->
      collection = @reuse('users')
      @view = new UsersListView
        collection: collection

    show: (params) ->
      collection = @reuse('users')
      model = collection.get(params.id)
      @view = new UserShowView
        collection: collection
        model: model

    new: (params) ->
      collection = @reuse('users')
      model = new User()
      @view = new UserEditView
        collection: collection
        model: model

    edit: (params) ->
      collection = @reuse('users')
      model = collection.get(params.id)
      @view = new UserEditView
        collection: collection
        model: model
