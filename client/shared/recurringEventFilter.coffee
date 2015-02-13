Template._recurringEventMenu.helpers
  recurringEvents: ->
    result = MS.RecurringEvents.findByUser Meteor.userId()
    return result

Template._recurringEventFilterButton.rendered = ->
  @$('.dropdown-button').dropdown
    constrain_width: false
    hover: false
