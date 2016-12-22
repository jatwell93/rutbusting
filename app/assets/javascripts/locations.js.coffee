$ ->
    $('#locations').imagesLoaded ->
        $('#locations').masonry
        itemSelector: '.box'
        isFitWidth: true