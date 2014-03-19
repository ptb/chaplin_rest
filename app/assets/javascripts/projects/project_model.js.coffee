define [
  'supermodel'
  '_base/base_model'
  'js-routes'
  ], (Supermodel, Model, Routes) ->
  'use strict'

  class Project extends Supermodel.Model
    _.extend @prototype, Model
    
    require ['developers/developers_collection'], (Developers) =>
      @has().many 'developers',
        collection: Developers
        inverse: 'developers'

    urlRoot: ->
      Routes.projects_path()
