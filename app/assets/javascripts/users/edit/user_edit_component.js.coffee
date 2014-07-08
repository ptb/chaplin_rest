define ['chaplin', 'react', 'bbrsync'], (Chaplin, React, BBRsync) ->
  'use strict'

  return React.createClass
    mixins: [BBRsync]

    getBackboneModels: ->
      [@props.model]

    onSubmit: (e) ->
      e.preventDefault()

      @props.model.save()
      @props.collection.reset()

      Chaplin.utils.redirectTo 'users@list'

    render: ->
      {div, h1, form, label, input, a, span} = React.DOM

      return div {},
        h1 {}, 'Editing user'
        form {className: 'edit_user', onSubmit: @onSubmit},
          div {className: 'field'},
            label {htmlFor: 'user_first_name'}, 'First name '
            input
              className: 'first_name'
              id: 'user_first_name'
              name: 'user[first_name]'
              type: 'text'
              valueLink: @bindTo(@props.model, 'first_name')
          div {className: 'field'},
            label {htmlFor: 'user_last_name'}, 'Last name '
            input
              className: 'last_name'
              id: 'user_last_name'
              name: 'user[last_name]'
              type: 'text'
              valueLink: @bindTo(@props.model, 'last_name')
          div {className: 'actions'},
            input
              name: 'commit'
              type: 'submit'
              value: 'Save'
          a {href: "/users/#{@props.model.id}"}, 'Show'
          span {}, ' | '
          a {href: '/users'}, 'Back'
