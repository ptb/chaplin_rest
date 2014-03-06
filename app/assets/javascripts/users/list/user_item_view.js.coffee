define [
  'users/_base/user_base_view'
  'users/list/user_item_template'
  ], (UserView, template) ->
  'use strict'

  class UserItemView extends UserView
    template: template
    tagName: 'tr'

    events:
      'click .js-destroy': 'destroy'

    destroy: (event) ->
      event.preventDefault()

      @model.destroy()
