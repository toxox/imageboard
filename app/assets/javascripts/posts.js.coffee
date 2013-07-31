# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".post_id").click ->
    $("#post_comment").val $("#post_comment").val() + ">>#{$(this).text()}\n"