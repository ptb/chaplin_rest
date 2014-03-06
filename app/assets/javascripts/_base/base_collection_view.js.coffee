define ['chaplin'], (Chaplin) ->
  'use strict'

  class CollectionView extends Chaplin.CollectionView

    getTemplateFunction: ->
      return @template
