Template._eventsForm.helpers
  getRecurringEvents: ->
    result = MS.RecurringEvents.find({}, {sort: name: 1}).map (item) ->
      return label: item.name, value: item._id

    return result

  selectizeOptions: ->
    create: true
