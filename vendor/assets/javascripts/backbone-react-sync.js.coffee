# Source: http://eldar.djafarov.com/2013/11/reactjs-mixing-with-backbone/

((root, factory) ->
  if typeof define is 'function' and define.amd
    define [], factory
  else if typeof exports is 'object'
    module.exports = factory()
  else
    root.BBRsync = factory()
) this, ->
  componentDidMount: ->
    @getBackboneModels().forEach @injectModel, @

  componentWillUnmount: ->
    @__syncedModels.forEach ((model) ->
      model.off null, model.__updater, @
    ), @

  injectModel: (model) ->
    @__syncedModels = []  unless @__syncedModels
    unless ~@__syncedModels.indexOf(model)
      updater = @forceUpdate.bind(@, null)
      model.__updater = updater
      model.on 'add change remove', updater, @
      @__syncedModels.push model

  bindTo: (model, key) ->
    value: model.get(key)
    requestChange: ((value) ->
      model.set key, value
    ).bind(@)
