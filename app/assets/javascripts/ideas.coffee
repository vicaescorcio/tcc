# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ajax:error", "form", (evt, xhr, status, error) ->
   
   detail = evt.detail
   
  # errors = JSON.parse detail[2].responseText.error
   json = JSON.parse detail[2].responseText;
   errors = json.error
   console.log(errors)
   $('#error_explanation').show();
   $('#error_explanation').append errors
 

$(document).on 'ajax:success', 'a.vote', (status,data,xhr)->
  # update counter

     
     buttons = $('a.vote')
     array = JSON.parse status.detail[2].responseText
     toggle = array[2]
     
     idea_id = '#idea_'+array[3]+' a.vote'
     ot = $(idea_id).not(this)

     other = $('img',ot)
     main = $('img', this)

     src_main = main.attr("src")
     name_main = main.attr("name")
     src_other = other.attr("src")
     name_other = other.attr("name")
       
     console.log(other)
     if toggle is 1
       #$(this).removeClass('activel')
       main.attr("src",name_main)
       main.attr("name", src_main)
     else if toggle is 2
       #buttons.not(this).removeClass('activel')
       #$(this).addClass('activel')
       

       other.attr("src",name_other)
       other.attr("name", src_other)
       main.attr("src",name_main)
       main.attr("name", src_main)
     else 
       main.attr("src",name_main)
       main.attr("name", src_main)
      # $(this).addClass('activel')
