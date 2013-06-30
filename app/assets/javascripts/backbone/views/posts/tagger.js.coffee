class Maple.Views.TaggerView extends Backbone.View

  tagName: "div"

  className: "container"

  template: JST["backbone/templates/posts/tagger"]

  initialize: ->
    @render()
    if $("#tagger-image").length
      console.log("yes")
    else
      console.log("no")

    console.log($("#tagger-image"));
    $("#tagger-image").tagger({
      radius: 10
      fill: "#000"
      thumbContainer: "#thumbs"
      thumbSize: 100
    });

  render: ->
    @$el.html @template()
    @

  close: ->
    @$el.html("")
    @unbind()
