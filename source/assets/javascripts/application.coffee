Minder = {}

# -------------------------------------
#   Hash Link
# -------------------------------------

Minder.hashLink = (options) ->
  options.el.on 'click', (e) ->
    status = options.el.attr('href').replace('#', '')

    $(options.selector).parent().removeClass('is-active')
    $(@).parent().addClass('is-active')

    options.card.removeClass('is-hidden')
    options.card.addClass('is-hidden').filter(".card--#{status}").removeClass('is-hidden')

#-------------------------------------
#  Document Ready
#-------------------------------------

jQuery ($) ->

  $('.js-hashLink').each ->
    Minder.hashLink({
      el: $(@)
      selector: '.js-hashLink'
      card: $('.card')
    })

