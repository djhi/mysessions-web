Template._eventsForm.helpers
  recurringEventId: ->
    recurringEventId = AutoForm.getFieldValue 'eventForm', 'recurringEventId'

    if !!recurringEventId
      MS.SubsManager.subscribe 'participants', recurringEventId

    return recurringEventId

  getParticipants: ->
    recurringEventId = AutoForm.getFieldValue 'eventForm', 'recurringEventId'

    if !!recurringEventId
      cursor = MS.Participants.findByRecurringEvent recurringEventId

      result = cursor.map (item) ->
        return label: item.name(), value: item._id

      return result
    else
      return []

  firstOption: ->
    TAPi18n.__ 'select-or-create-category'

  addParticipantButton: ->
    TAPi18n.__ 'add'

  switchOptions: ->
    onText: TAPi18n.__ 'present'
    offText: TAPi18n.__ 'missing'
