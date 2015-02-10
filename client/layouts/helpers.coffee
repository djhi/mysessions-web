Template.header.helpers
  title: -> Session.get('title') or 'MySessions'

Template.sidebar.helpers
  allRoute: ->
    Session.get 'sidebar-route-all'
    
  recurringEvents: ->
    result = MS.RecurringEvents.findByUser Meteor.userId()
    return result

Template._recurringEvent.helpers
  route: ->
    return Session.get('sidebar-route') or 'eventsByRecurringEvent'
