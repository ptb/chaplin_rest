define [
  'developers/_base/developer_base_view'
  'developers/show/developer_show_template'
  ], (DeveloperView, template) ->
  'use strict'

  class DeveloperShowView extends DeveloperView
    template: template
    container: '#js-main'

    getTemplateData: ->
      data = super
      data.projects = @model.projects()
      return data
