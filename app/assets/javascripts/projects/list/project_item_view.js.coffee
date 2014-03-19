define [
  'projects/_base/project_base_view'
  'projects/list/project_item_template'
  ], (ProjectView, template) ->
  'use strict'

  class ProjectItemView extends ProjectView
    template: template
    tagName: 'tr'

    events:
      'click .js-destroy': 'destroy'

    destroy: (event) ->
      event.preventDefault()

      @model.destroy()
