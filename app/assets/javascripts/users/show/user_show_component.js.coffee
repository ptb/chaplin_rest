define ['react'], (React) ->
  'use strict'

  return React.createClass
    render: ->
      {div, p, strong, span, a} = React.DOM

      return div {},
        p {id: 'notice'}
        p {},
          strong {}, 'First name: '
          span {className: 'first_name'}, @props.model.get('first_name')
        p {},
          strong {}, 'Last name: '
          span {className: 'last_name'}, @props.model.get('last_name')
        a {href: "/users/#{@props.model.id}/edit"}, 'Edit'
        span {}, ' | '
        a {href: '/users'}, 'Back'
