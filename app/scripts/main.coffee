jQuery ->
    $(window).hashchange ->
        $('body').attr 'class', window.location.hash.replace('#', '')

    $(window).hashchange()
