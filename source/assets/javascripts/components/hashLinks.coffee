# *************************************
#
#   Hash Links
#   -> Hide/show clicked elements
#
# *************************************
#
# @param $element    { jQuery object }
# @param $card       { jQuery object }
# @param cardNode    { string }
# @param elementNode { string }
# @param activeClass { string }
# @param hiddenClass { string }
#
# *************************************

Minder.hashLinks = ( options ) ->
  settings = $.extend
    $element    : $( '.js-hashLink' )
    $card       : $( '.card' )
    cardNode    : '.card'
    elementNode : '.js-hashLink'
    activeClass : 'is-active'
    hiddenClass : 'is-hidden'
  , options

  settings.$element.each ->
    $(@).on 'click', ( event ) ->
      event.preventDefault()

      status = $(@).attr( 'href' ).replace( '#', '' )

      $( settings.elementNode )
        .parent()
        .removeClass( settings.activeClass )

      $(@)
        .parent()
        .addClass( settings.activeClass )

      $( settings.cardNode ).removeClass( settings.hiddenClass )
      settings.$card
        .not( "#{ settings.cardNode }--#{ status }" )
        .addClass( settings.hiddenClass )
