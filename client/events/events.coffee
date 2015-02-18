Template._eventsForm.events
  'focus [name="typeaheadRecurringEvent"]': (event, template) ->
    template.$('label[for=typeaheadRecurringEvent]').addClass 'active'
    return

  'blur [name="typeaheadRecurringEvent"]': (event, template) ->
    if !template.$(event.currentTarget).val()
      template.$('label[for=typeaheadRecurringEvent]').removeClass 'active'
    return

  'keyup [name="typeaheadRecurringEvent"]': (event, template) ->
    if event.keyCode == 9 then return
    template.$('[name="recurringEventId"]').val template.$(event.currentTarget).val()
    AutoForm.invalidateFormContext 'eventForm'
    return

  'typeahead:selected [name="typeaheadRecurringEvent"]': (event, template, item) ->
    template.$('[name="recurringEventId"]').val item.value
    AutoForm.invalidateFormContext 'eventForm'
    return

  'typeahead:autocompleted [name="typeaheadRecurringEvent"]': (event, template, item) ->
    template.$('[name="recurringEventId"]').val item.value
    AutoForm.invalidateFormContext 'eventForm'
    return

Template._newParticipantTypeahead.events
  'focus [name="newParticipant"]': (event, template) ->
    template.$('label[for=newParticipant]').addClass 'active'
    return

  'blur [name="newParticipant"]': (event, template) ->
    if !template.$(event.currentTarget).val()
      template.$('label[for=newParticipant]').removeClass 'active'
    return

  'keypress [name="newParticipant"]': (event, template) ->
    if event.keyCode == 9
      return

    # On enter key, create the participant and add it to the recurring event
    if event.keyCode == 13
      event.stopPropagation()
      event.preventDefault()
      name = template.$(event.currentTarget).val()
      recurringEventId = $('[name="recurringEventId"]').val()
      participant = MS.Participants.createFromString name, recurringEventId

  	   if !!participant
         AutoForm.openModal
          collection: "MS.Participants"
          doc: participant
          operation: "insert"
          omitFields: "userId,eventOccurencesIds"
          buttonContent: "Enregistrer"
          title: "Nouveau participant"

    return

  'typeahead:selected [name="newParticipant"]': (event, template, item) ->
    # Add existing participant to recurring event
    return

  'typeahead:autocompleted [name="newParticipant"]': (event, template, item) ->
    # Add existing participant to recurring event
    return
