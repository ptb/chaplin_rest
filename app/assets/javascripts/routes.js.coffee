define ['users/users_controller'], ->
  'use strict'

  (match) ->
    match 'users',
      action: 'list'
      controller: 'users/users'
      name: 'users@list'

    match 'users/new',
      action: 'new'
      controller: 'users/users'
      name: 'users@new'

    match 'users/:id',
      action: 'show'
      controller: 'users/users'
      constraints:
        id: /^\d+$/
      name: 'users@show'

    match 'users/:id/edit',
      action: 'edit'
      controller: 'users/users'
      constraints:
        id: /^\d+$/
      name: 'users@edit'
