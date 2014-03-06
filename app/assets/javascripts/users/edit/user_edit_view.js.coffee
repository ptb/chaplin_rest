define [
  'chaplin'
  'users/_base/user_base_view'
  'users/edit/user_edit_template'
  ], (Chaplin, UserView, template) ->
  'use strict'

  class UserEditView extends UserView
    template: template
    container: '#js-main'

    events:
      'submit form': 'save'

    save: (event) ->
      event.preventDefault()

      @model.save()
      @collection.fetch()

      Chaplin.utils.redirectTo 'users@list'
