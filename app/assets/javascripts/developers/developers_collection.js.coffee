define [
  '_base/base_collection'
  'developers/developer_model'
  'js-routes'
  ], (Collection, Developer, Routes) ->
  'use strict'

  class Developers extends Collection
    model: (attrs, options) ->
      Developer.create(attrs, options)

    url: ->
      Routes.developers_path()
