# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "ready page:load", ->
  $('input[type="submit"]').on "click", ->
    validation = true
    if $('input[min_length]').val().length < $('input[min_length]').attr('min_length')
      validation = false
      alert "Passwords length must be 8 or more symbols"
    else
      true
    if !$('input[match]')[0] || $($('input[match]').attr('match')).val() == $('input[match]').val()
      true
    else
      validation = false
      alert "Passwords do not match"

    false unless validation