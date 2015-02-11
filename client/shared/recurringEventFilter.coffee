Template._recurringEventMenu.helpers
  allRoute: ->
    Session.get 'sidebar-route-all'

  recurringEvents: ->
    result = MS.RecurringEvents.findByUser Meteor.userId()
    return result

Template._recurringEvent.helpers
  route: ->
    return Session.get('sidebar-route') or 'eventsByRecurringEvent'

Template._recurringEventFilterButton.rendered = ->
  @$('.dropdown-button').dropdown
    constrain_width: false
    hover: false
