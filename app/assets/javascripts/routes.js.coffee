define ['users/users_controller'], ->
  'use strict'

  (match) ->
    match 'developers',
      action: 'list'
      controller: 'developers/developers'
      name: 'developers@list'

    match 'developers/new',
      action: 'new'
      controller: 'developers/developers'
      name: 'developers@new'

    match 'developers/:id',
      action: 'show'
      controller: 'developers/developers'
      constraints:
        id: /^\d+$/
      name: 'developers@show'

    match 'developers/:id/edit',
      action: 'edit'
      controller: 'developers/developers'
      constraints:
        id: /^\d+$/
      name: 'developers@edit'

    match 'projects',
      action: 'list'
      controller: 'projects/projects'
      name: 'projects@list'

    match 'projects/new',
      action: 'new'
      controller: 'projects/projects'
      name: 'projects@new'

    match 'projects/:id',
      action: 'show'
      controller: 'projects/projects'
      constraints:
        id: /^\d+$/
      name: 'projects@show'

    match 'projects/:id/edit',
      action: 'edit'
      controller: 'projects/projects'
      constraints:
        id: /^\d+$/
      name: 'projects@edit'

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
