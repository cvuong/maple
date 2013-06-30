(function($) {
  $.fn.tagger = function (options) {
    var settings = $.extend({
      radius: 10,
      fill: "#000",
      thumbSize: 100
    }, options);

    var pinCoords = [];

    // Add pins and thumbs to photo
    // when clicked
    this.live("click", function(e) {
      var offset = $(this).offset(),
          coords = {
            x: e.clientX - offset.left + document.body.scrollLeft,
            y: e.clientY - offset.top + document.body.scrollTop
          },
          absX, absY, src;

      pinCoords.push(coords);
      absX = (offset.left + coords.x);
      absY = (offset.top + coords.y);

      // Add the circles to the image
      $("body").append('<div class="tagger-circle" style="position: absolute; top: ' + (offset.top + coords.y - settings.radius) + 'px; left: ' + (offset.left + coords.x - settings.radius) + 'px; border-radius: 50%; width: ' + (settings.radius * 2) + 'px; height: ' + (settings.radius * 2) + 'px; background: ' + settings.fill  + '"></div>')

      // Add the thumbnails to the thumbnail
      // container
      src = $(this).attr("src");
      $(settings.thumbContainer).append("sup");
      console.log(src);

    });

    return this;

  };
}(jQuery));