define [
  'supermodel'
  '_base/base_model'
  'js-routes'
  ], (Supermodel, Model, Routes) ->
  'use strict'

  class Developer extends Supermodel.Model
    _.extend @prototype, Model

    require ['projects/projects_collection'], (Projects) =>
      @has().many 'projects',
        collection: Projects
        inverse: 'developers'

    urlRoot: ->
      Routes.developers_path()
