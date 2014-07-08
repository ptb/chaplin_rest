define ['_base/base_view', 'backbone.stickit'], (View) ->
  'use strict'

  class HamlView extends View

    render: ->
      super
      @stickit()
