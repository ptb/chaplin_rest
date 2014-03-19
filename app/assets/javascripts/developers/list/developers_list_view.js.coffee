define [
  '_base/base_collection_view'
  'developers/list/developer_item_view'
  'developers/list/developers_list_template'
  ], (CollectionView, DeveloperItemView, template) ->
  'use strict'

  class DevelopersListView extends CollectionView
    template: template
    container: '#js-main'
    listSelector: 'tbody'

    itemView: DeveloperItemView

    animationDuration: 0
