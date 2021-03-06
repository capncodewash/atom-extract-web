{ScrollView} = require 'atom-space-pen-views'

module.exports =
  class LoadingView extends ScrollView
    @content: ->
      @div class: "padded", =>
        @div class: "inset-panel", =>
          @div class: "panel-heading", "Extract Web"
          @div class: "panel-body padded", =>
            @span class: "loading loading-spinner-small inline-block"
            @span class: "message", "..."


    initialize: ->
      super
      @panel ?= atom.workspace.addBottomPanel(item: this)

    updateMessage: (message) ->
      @find(".message").text(message)


    finish: ({delay}={delay: 5 * 1000})->
      setTimeout =>
        @destroy()
      , delay

    destroy: ->
      @panel?.destroy()
