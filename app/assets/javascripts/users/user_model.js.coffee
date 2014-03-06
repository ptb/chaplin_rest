define [
  '_base/base_model'
  'js-routes'
  ], (Model, Routes) ->
  'use strict'

  class User extends Model
    urlRoot: ->
      Routes.users_path()
