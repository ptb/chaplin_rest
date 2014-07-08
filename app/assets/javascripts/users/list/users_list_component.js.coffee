define [
  'react'
  'bbrsync'
  'users/list/user_item_component'
  ], (React, BBRsync, UserItemComponent) ->
  'use strict'

  return React.createClass
    mixins: [BBRsync]

    getBackboneModels: ->
      [@props.collection]

    render: ->
      {div, h1, table, thead, tbody, tr, th, br, a} = React.DOM

      return div {},
        h1 {}, 'Listing users'
        table {},
          thead {},
            tr {},
              th {}, 'First name'
              th {}, 'Last name'
              th {}
              th {}
              th {}
          tbody {},
            @props.collection.map (user) =>
              UserItemComponent model: user
        br {}
        a {href: '/users/new'}, 'New User'
