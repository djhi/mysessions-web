MS.EventOccurences.setSidebarRoutes = ->
  Session.set 'sidebar-route-all', 'events'
  Session.set 'sidebar-route', 'eventsByRecurringEvent'

Router.route '/events/new',
  name: 'eventsNew'
  waitOn: ->
    MS.SubsManager.subscribe "participants"
  data: ->
    operation: 'insert'
    collection: MS.EventOccurences
  onAfterAction: ->
    Session.set 'title', 'Nouvel évènement'
    MS.EventOccurences.setSidebarRoutes()

Router.route '/events',
  name: 'events'
  waitOn: ->
    MS.SubsManager.subscribe "eventOccurences"
  data: ->
    eventOccurences: MS.EventOccurences.findByUser Meteor.userId()
  onAfterAction: ->
    Session.set 'title', 'Evènements'
    MS.EventOccurences.setSidebarRoutes()

Router.route '/events/:_id',
  name: 'eventsByRecurringEvent'
  template: 'events'
  waitOn: ->
    MS.SubsManager.subscribe "eventOccurences"
  data: ->
    recurringEventId: @params._id
    eventOccurences: MS.EventOccurences.findByRecurringEvent @params._id
  onAfterAction: ->
    recurringEvent = MS.RecurringEvents.findOne @params._id
    if recurringEvent
      Session.set 'title', recurringEvent.name
    MS.EventOccurences.setSidebarRoutes()

Router.route '/events/:_id/edit',
  name: 'eventsEdit'
  waitOn: -> [
      MS.SubsManager.subscribe "eventOccurence", @params._id
      MS.SubsManager.subscribe "participants"
    ]
  data: ->
    data =
      operation: 'update'
      collection: MS.EventOccurences
      eventOccurence: MS.EventOccurences.findOne @params._id

    return data
  onAfterAction: ->
    eventOccurence = MS.EventOccurences.findOne @params._id
    if eventOccurence
      Session.set 'title', eventOccurence.name()
    MS.EventOccurences.setSidebarRoutes()
