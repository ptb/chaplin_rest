define [
  '_base/base_controller'
  'projects/project_model'
  'projects/projects_collection'
  'projects/list/projects_list_view'
  'projects/show/project_show_view'
  'projects/edit/project_edit_view'
  ], (Controller, Project, Projects, ProjectsListView, ProjectShowView, ProjectEditView) ->
  'use strict'

  class ProjectsController extends Controller
    beforeAction: (params, route) ->
      projects = @reuse('projects', Projects)
      projects.fetch() if projects.length is 0

    list: (params) ->
      projects = @reuse('projects')
      @view = new ProjectsListView
        collection: projects

    show: (params) ->
      projects = @reuse('projects')
      project = projects.get(params.id)
      @view = new ProjectShowView
        collection: projects
        model: project

    new: (params) ->
      projects = @reuse('projects')
      project = new Project()
      @view = new ProjectEditView
        collection: projects
        model: project

    edit: (params) ->
      projects = @reuse('projects')
      project = projects.get(params.id)
      @view = new ProjectEditView
        collection: projects
        model: project
