define [
  'chaplin'
  '_base/base_controller'
  'developers/developer_model'
  'developers/developers_collection'
  'developers/list/developers_list_view'
  'developers/show/developer_show_view'
  'developers/edit/developer_edit_view'
  ], (Chaplin, Controller, Developer, Developers, DevelopersListView, DeveloperShowView, DeveloperEditView) ->
  'use strict'

  class DevelopersController extends Controller
    beforeAction: (params, route) ->
      @reuse('developers', Developers)
      @reuse('developers').fetch() if @reuse('developers').length is 0

    list: (params) ->
      @view = new DevelopersListView
        collection: @reuse('developers')

    show: (params) ->
      @view = new DeveloperShowView
        collection: @reuse('developers')
        model: @reuse('developers').get(params.id)

    new: (params) ->
      @view = new DeveloperEditView
        collection: @reuse('developers')
        model: new Developer()

    edit: (params) ->
      @view = new DeveloperEditView
        collection: @reuse('developers')
        model: @reuse('developers').get(params.id)
