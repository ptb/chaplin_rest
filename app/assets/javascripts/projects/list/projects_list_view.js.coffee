define [
  '_base/base_collection_view'
  'projects/list/project_item_view'
  'projects/list/projects_list_template'
  ], (CollectionView, ProjectItemView, template) ->
  'use strict'

  class ProjectsListView extends CollectionView
    template: template
    container: '#js-main'
    listSelector: 'tbody'

    itemView: ProjectItemView

    animationDuration: 0
