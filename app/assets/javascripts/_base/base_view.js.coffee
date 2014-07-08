define ['chaplin'], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View

    autoRender: true

    getTemplateFunction: ->
      return @template
