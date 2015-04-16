#= require jquery
#= require_self

resizeWelcome = ->
  e = $('#welcome')
  e.height(e.width() * 1/3)

$ ->
  resizeWelcome()
  $(window).resize ->
    resizeWelcome()
