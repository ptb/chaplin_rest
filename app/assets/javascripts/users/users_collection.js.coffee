define [
  '_base/base_collection'
  'users/user_model'
  'js-routes'
  ], (Collection, User, Routes) ->
  'use strict'

  class Users extends Collection
    model: User
    url: ->
      Routes.users_path()
