# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
square = (x) -> x * x
square4 = ->
        alert square(4)
$(->
        $("#click_here_button").click(-> square4())
)

