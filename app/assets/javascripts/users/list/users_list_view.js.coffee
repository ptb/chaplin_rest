define [
  '_base/base_collection_view'
  'users/list/user_item_view'
  'users/list/users_list_template'
  ], (CollectionView, UserItemView, template) ->
  'use strict'

  class UsersListView extends CollectionView
    template: template
    container: '#js-main'
    listSelector: 'tbody'

    itemView: UserItemView

    animationDuration: 0
