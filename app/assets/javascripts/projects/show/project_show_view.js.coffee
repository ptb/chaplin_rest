define [
  'projects/_base/project_base_view'
  'projects/show/project_show_template'
  ], (ProjectView, template) ->
  'use strict'

  class ProjectShowView extends ProjectView
    template: template
    container: '#js-main'

    getTemplateData: ->
      data = super
      data.developers = @model.developers()
      return data
