# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#calendar").fullCalendar
    events: '/events.json'
    dayClick: (date, jsEvent, view) ->
      alert('Clicked on: ' + date.format())
      alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY)
      alert('Current view: ' + view.name)
      $(this).css('background-color', 'red')
