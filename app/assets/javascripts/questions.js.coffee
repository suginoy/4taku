# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

keyPressed = (key) ->
  switch key
    when 'a'
      $.post("#{location.href}/answer", 
        answer: '1'
      )
    when 'b'
      $.post("#{location.href}/answer", 
        answer: '2'
      )
    when 'c'
      $.post("#{location.href}/answer", 
        answer: '3'
      )
    when 'd'
      $.post("#{location.href}/answer", 
        answer: '4'
      )

shortcut.add("a", ->
  keyPressed("a")
,
  'type':'keyup',
)

shortcut.add("b", ->
  keyPressed("b")
,
  'type':'keyup',
)
shortcut.add("c", ->
  keyPressed("c")
,
  'type':'keyup',
)
shortcut.add("d", ->
  keyPressed("d")
,
  'type':'keyup',
)
