define ['chaplin', 'backbone.stickit'], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View

    autoRender: true

    getTemplateFunction: ->
      return @template

    render: ->
      super
      @stickit()
