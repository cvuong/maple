class Maple.Views.TaggerView extends Backbone.View

  tagName: "div"

  className: "container"

  template: JST["backbone/templates/posts/tagger"]

  initialize: ->
    @render()

    @tagger = $("#tagger-image").tagger({
      radius: 10
      fill: "#000"
      thumbContainer: "#thumbs"
      thumbSize: 100
      onTag: @renderTaggerForm
    });

  renderTaggerForm: =>
    $("#tagger-form-container").html JST["backbone/templates/posts/tagger-form"]()
    console.log($("#tagger-tag").length)
    $("#tagger-tag").click (e) ->
      e.preventDefault()
      $("#tagger-form-container").html("")
    $("#tagger-cancel").click (e) ->
      e.preventDefault()
      $("#tagger-form-container").html("")

  render: ->
    @$el.html @template()
    @

  close: ->
    @$el.html("")
    @unbind()
