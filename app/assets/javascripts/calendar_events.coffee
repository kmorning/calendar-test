# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).ready ->

  toggle_repeats_yearly_on = ->
    if $('#event_repeats_yearly_on').is(':checked')
      $('#event_repeats_yearly_on_options').show()
    else
      $('#event_repeats_yearly_on_options').hide()
    return

  toggle_repeats_yearly_on()
  $('#event_repeats_yearly_on').on 'change', ->
    toggle_repeats_yearly_on()
    return

  toggle_event_times = ->
    if $('#calendar_event_is_all_day').is(':checked')
      $('.event_time').hide()
    else
      $('.event_time').show()
    return

  toggle_event_times()
  $('#calendar_event_is_all_day').on 'change', ->
    toggle_event_times()
    return

  toggle_event_options = ->
    $('.event_option').hide()
    switch $('#calendar_event_repeats').val()
      when 'never' then
      when 'daily'
        $('#repeats_options').show()
        $('#repeats_daily_options').show()
      when 'weekly'
        $('#repeats_options').show()
        $('#repeats_weekly_options').show()
      when 'monthly'
        $('#repeats_options').show()
        $('#repeats_monthly_options').show()
      when 'yearly'
        $('#repeats_options').show()
        $('#repeats_yearly_options').show()
    return

  toggle_event_options()
  $('#calendar_event_repeats').on 'change', ->
    toggle_event_options()
    return

  toggle_repeat_ends_on = ->
    switch $('#calendar_event_repeat_ends').val()
      when 'never'
        $('#calendar_event_repeat_ends_on').hide()
      when 'on'
        $('#calendar_event_repeat_ends_on').show()
    return

  toggle_repeat_ends_on()
  $('#calendar_event_repeat_ends').on 'change', ->
    toggle_repeat_ends_on()
    return

  toggle_repeats_monthly = ->
    switch $('#event_repeats_monthly').val()
      when 'each'
        $('#event_repeats_monthly_each').show()
        $('#event_repeats_monthly_on').hide()
      when 'on'
        $('#event_repeats_monthly_each').hide()
        $('#event_repeats_monthly_on').show()
    return

  toggle_repeats_monthly()
  $('#event_repeats_monthly').on 'change', ->
    toggle_repeats_monthly()
    return
  return

