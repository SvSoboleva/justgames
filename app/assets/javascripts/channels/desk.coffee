jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')

  if messages.length > 0
    createDeskChannel messages.data('desk-id')

  $(document).on 'keypress', '#message_body', (event) ->
    message = event.target.value
    if event.keyCode is 13 && message != ''
      App.desk.speak(message)
      event.target.value = ""
      event.preventDefault()

createDeskChannel = (deskId) ->
  App.desk = App.cable.subscriptions.create {channel: "DeskChannel", deskId: deskId},
    connected: ->
      console.log('Connected to DeskChannel')

    disconnected: ->
      console.log('Disconnected to DeskChannel')

    received: (data) ->
      console.log('Received message ' + data['message'])
      $('#messages').append data['message']

    speak: (message) ->
      @perform 'speak', message: message
