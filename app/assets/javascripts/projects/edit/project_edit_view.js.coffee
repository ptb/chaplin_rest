define [
  'chaplin'
  'projects/_base/project_base_view'
  'projects/edit/project_edit_template'
  ], (Chaplin, ProjectView, template) ->
  'use strict'

  class ProjectEditView extends ProjectView
    template: template
    container: '#js-main'

    events:
      'submit form': 'save'

    save: (event) ->
      event.preventDefault()

      @model.save()
      @collection.reset()

      Chaplin.utils.redirectTo 'projects@list'
