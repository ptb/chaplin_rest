define [
  'chaplin'
  'developers/_base/developer_base_view'
  'developers/edit/developer_edit_template'
  ], (Chaplin, DeveloperView, template) ->
  'use strict'

  class DeveloperEditView extends DeveloperView
    template: template
    container: '#js-main'

    events:
      'submit form': 'save'

    save: (event) ->
      event.preventDefault()

      @model.save()
      @collection.reset()

      Chaplin.utils.redirectTo 'developers@list'
