define [
  '_base/base_collection'
  'projects/project_model'
  'js-routes'
  ], (Collection, Project, Routes) ->
  'use strict'

  class Projects extends Collection
    model: (attrs, options) ->
      Project.create(attrs, options)

    url: ->
      Routes.projects_path()
