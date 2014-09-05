# collapse navbar https://github.com/twbs/bootstrap/issues/9013
$(document).on 'click.nav', '.navbar-collapse.in', (e) ->
  if $(e.target).is('a') || $(e.target).is('button')
    $(this).collapse('hide')