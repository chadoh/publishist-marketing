idealHeight = -> $('#makers-features > .inner').outerHeight(true) + 75

adjustFeatures = ->
    $('#features').css
        'height': idealHeight()
        'perspective': idealHeight()


adjustFront = ->
    $('#cube .front').css
        '-webkit-transform': "rotateX(  0deg) translateZ(#{idealHeight()/2}px)"
        '-moz-transform':    "rotateX(  0deg) translateZ(#{idealHeight()/2}px)"
        '-o-transform':      "rotateX(  0deg) translateZ(#{idealHeight()/2}px)"
        'transform':         "rotateX(  0deg) translateZ(#{idealHeight()/2}px)"

adjustBottom = ->
    $('#cube .bottom').css
        '-webkit-transform': "rotateX( 90deg) translateZ(#{idealHeight()/2}px)"
        '-moz-transform':    "rotateX( 90deg) translateZ(#{idealHeight()/2}px)"
        '-o-transform':      "rotateX( 90deg) translateZ(#{idealHeight()/2}px)"
        'transform':         "rotateX( 90deg) translateZ(#{idealHeight()/2}px)"

adjustBack = ->
    $('#cube .back').css
        '-webkit-transform': "rotateX(180deg) translateZ(#{idealHeight()/2}px)"
        '-moz-transform':    "rotateX(180deg) translateZ(#{idealHeight()/2}px)"
        '-o-transform':      "rotateX(180deg) translateZ(#{idealHeight()/2}px)"
        'transform':         "rotateX(180deg) translateZ(#{idealHeight()/2}px)"

adjustTop = ->
    $('#cube .top').css
        '-webkit-transform': "rotateX(270deg) translateZ(#{idealHeight()/2}px)"
        '-moz-transform':    "rotateX(270deg) translateZ(#{idealHeight()/2}px)"
        '-o-transform':      "rotateX(270deg) translateZ(#{idealHeight()/2}px)"
        'transform':         "rotateX(270deg) translateZ(#{idealHeight()/2}px)"

adjustCube = ->
    $('#features style').text("""
        #cube { /* show front */
            -webkit-transform: translateZ(-#{idealHeight()/2}px);
            -moz-transform:    translateZ(-#{idealHeight()/2}px);
            -o-transform:      translateZ(-#{idealHeight()/2}px);
            transform:         translateZ(-#{idealHeight()/2}px);
        }
        .for-editors #cube { /* show bottom */
            -webkit-transform: translateZ(-#{idealHeight()/2}px) rotateX( 90deg);
            -moz-transform:    translateZ(-#{idealHeight()/2}px) rotateX( 90deg);
            -o-transform:      translateZ(-#{idealHeight()/2}px) rotateX( 90deg);
            transform:         translateZ(-#{idealHeight()/2}px) rotateX( 90deg);
        }
        .for-organizers #cube { /* show back */
            -webkit-transform: translateZ(-#{idealHeight()/2}px) rotateX(180deg);
            -moz-transform:    translateZ(-#{idealHeight()/2}px) rotateX(180deg);
            -o-transform:      translateZ(-#{idealHeight()/2}px) rotateX(180deg);
            transform:         translateZ(-#{idealHeight()/2}px) rotateX(180deg);
        }
        .for-makers #cube { /* show top */
            -webkit-transform: translateZ(-#{idealHeight()/2}px) rotateX(270deg);
            -moz-transform:    translateZ(-#{idealHeight()/2}px) rotateX(270deg);
            -o-transform:      translateZ(-#{idealHeight()/2}px) rotateX(270deg);
            transform:         translateZ(-#{idealHeight()/2}px) rotateX(270deg);
        }
        """)

adjustHeight = ->
    adjustFeatures()
    adjustFront()
    adjustBottom()
    adjustBack()
    adjustTop()
    adjustCube()

jQuery ->
    $(window).hashchange ->
        $('body').attr 'class', window.location.hash.replace('#', '')
    $(window).hashchange()


    # adjust the height of the cube
    adjustHeight()
    # fire a `resizeEnd` function when window resizing pauses for >=500ms
    # from http://stackoverflow.com/a/2996465/249801
    $(window).resize ->
        clearTimeout(this.resizeto) if this.resizeto
        callback = -> $(this).trigger('resizeEnd')
        this.resizeto = setTimeout callback, 500

    $(window).on 'resizeEnd', ->
        adjustHeight()
