Template._eventsForm.helpers
  getRecurringEvents: ->
    cursor = MS.RecurringEvents.findByUser Meteor.userId()

    result = cursor.map (item) ->
      return label: item.name, value: item._id

    return result

  getParticipants: ->
    cursor = MS.Participants.findByUser Meteor.userId()

    result = cursor.map (item) ->
      return label: item.name(), value: item._id

    return result

  selectizeOptions: ->
    create: true
    persist: false
    closeAfterSelect: true

  firstOption: ->
    TAPi18n.__ 'select-or-create-category'

  addParticipantButton: ->
    TAPi18n.__ 'add'

  switchOptions: ->
    onText: TAPi18n.__ 'present'
    offText: TAPi18n.__ 'missing'
