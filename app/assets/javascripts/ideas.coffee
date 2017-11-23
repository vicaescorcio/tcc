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
     console.log(status.detail[2].responseText)
  
  
 