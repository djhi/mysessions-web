Template._participantsForm.helpers
  getRecurringEvents: ->
    cursor = MS.RecurringEvents.findByUser Meteor.userId()

    result = cursor.map (item) ->
      return label: item.name, value: item._id

    return result
