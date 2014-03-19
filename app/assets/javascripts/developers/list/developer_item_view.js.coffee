define [
  'developers/_base/developer_base_view'
  'developers/list/developer_item_template'
  ], (DeveloperView, template) ->
  'use strict'

  class DeveloperItemView extends DeveloperView
    template: template
    tagName: 'tr'

    events:
      'click .js-destroy': 'destroy'

    destroy: (event) ->
      event.preventDefault()

      @model.destroy()
