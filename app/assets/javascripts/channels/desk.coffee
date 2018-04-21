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

  $(document).on 'dragstart', (event)    ->
     event.originalEvent.dataTransfer.setData("image", event.target.id)

  $(document).on 'touchstart', (event)    ->
     event.originalEvent.dataTransfer.setData("image", event.target.id)   

  $(document).on 'drop', (event)    ->
     event.preventDefault();
     elFrom = event.originalEvent.dataTransfer.getData("image")
     elTo = event.target.id

     if elTo && elFrom && (elTo != elFrom)
       App.desk.movement(elTo, elFrom)
       elT = document.getElementById(elTo)
       elF = document.getElementById(elFrom)
       if (elT.nodeName == 'DIV')
         App.desk.speak("#{elF.parentElement.id} - #{elT.id}")
       else
         App.desk.speak("#{elF.parentElement.id} - #{elT.parentElement.id}")
  
  $(document).on 'touchend', (event)    ->
     event.preventDefault();
     elFrom = event.originalEvent.dataTransfer.getData("image")
     elTo = event.target.id

     if elTo && elFrom && (elTo != elFrom)
       App.desk.movement(elTo, elFrom)
       elT = document.getElementById(elTo)
       elF = document.getElementById(elFrom)
       if (elT.nodeName == 'DIV')
         App.desk.speak("#{elF.parentElement.id} - #{elT.id}")
       else
         App.desk.speak("#{elF.parentElement.id} - #{elT.parentElement.id}")

createDeskChannel = (deskId) ->
  App.desk = App.cable.subscriptions.create {channel: "DeskChannel", deskId: deskId},
    connected: ->
      console.log('Connected to DeskChannel')

    disconnected: ->
      console.log('Disconnected to DeskChannel')

    received: (data) ->
      console.log('Received message ' + data['message'])
      console.log('Received elFrom ' + data['elFrom'] + ' elTo ' + data['elTo'])
      if data['message']
        $('#messages').append data['message']
        $("#messages").scrollTop($("#messages")[0].scrollHeight)
      
      if data['elTo'] && data['elFrom']
        elTo = document.getElementById(data['elTo'])
        elFrom = document.getElementById(data['elFrom'])

        if elFrom.width != "90" 
          elFrom.width = "90"
          elFrom.height = "90"

        if (elTo.nodeName == 'DIV') 
          elTo.appendChild(elFrom)
        else 
          elToDiv = elTo.parentElement

          elBeaten = document.getElementById('beaten')
          elTo.width = "30"
          elTo.height = "30"
          elBeaten.appendChild(elTo)

          while elToDiv.hasChildNodes()  
            elToDiv.removeChild(elToDiv.firstChild)

          elToDiv.appendChild(elFrom);

    speak: (message) ->
      @perform 'speak', message: message

    movement: (elTo, elFrom) ->
      console.log('in coffe movement elFrom ' + elFrom + ' elTo ' + elTo)
      @perform 'movement', elTo: elTo, elFrom: elFrom
  
