define ['chaplin', 'jquery'], (Chaplin, jquery) ->
  'use strict'

  jquery(document).ajaxSend (event, jqXHR, options) ->
    token = jquery('meta[name="csrf-token"]').attr('content')
    jqXHR.setRequestHeader 'X-CSRF-Token', token

  class Application extends Chaplin.Application
