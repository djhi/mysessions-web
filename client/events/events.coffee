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
    return

  'typeahead:selected [name="typeaheadRecurringEvent"]': (event, template, item) ->
    template.$('[name="recurringEventId"]').val item.value
    return

  'typeahead:autocompleted [name="typeaheadRecurringEvent"]': (event, template, item) ->
    template.$('[name="recurringEventId"]').val item.value
    return
