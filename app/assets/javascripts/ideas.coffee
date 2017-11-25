# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ajax:error", "form", (evt, xhr, status, error) ->
   
   detail = evt.detail
  # errors = JSON.parse detail[2].responseText.error
   json = JSON.parse detail[2].responseText;
   errors = json.error
   console.log(errors)
   $('#error_explanation').append errors
 

$(document).on 'ajax:success', 'a.vote', (status,data,xhr)->
  # update counter
     buttons = $('a.vote')
     array = JSON.parse status.detail[2].responseText
     toggle = array[2]
     if toggle is 1
       $(this).removeClass('active')
     else if toggle is 2
       buttons.not(this).removeClass('active')
       $(this).addClass('active')
     else 
       $(this).addClass('active')
