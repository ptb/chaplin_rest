define ['react'], (React) ->
  'use strict'

  return React.createClass
    destroy: (e) ->
      e.preventDefault()
      @props.model.destroy()

    render: ->
      {tr, td, a} = React.DOM

      return tr {key: @props.model.cid},
        td {className: 'first_name'}, @props.model.get('first_name')
        td {className: 'last_name'}, @props.model.get('last_name')
        td {},
          a {href: "/users/#{@props.model.id}"}, 'Show'
        td {},
          a {href: "/users/#{@props.model.id}/edit"}, 'Edit'
        td {},
          a {href: '#', onClick: @destroy}, 'Destroy'
