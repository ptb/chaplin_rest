define ['_base/base_view', 'react'], (View, React) ->
  'use strict'

  class ReactView extends View

    render: ->
      React.renderComponent @component(
        collection: @collection
        model: @model
      ), @el
