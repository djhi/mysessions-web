Router.route '/events/new',
  name: 'eventsNew'
  data: ->
    operation: 'insert'
    collection: MS.EventOccurences
  onAfterAction: ->
    Session.set 'returnUrl', '/events'
    Session.set 'title', 'Nouveau'

Router.route '/events',
  name: 'events'
  waitOn: ->
    MS.SubsManager.subscribe "eventOccurences"
  data: ->
    eventOccurences: MS.EventOccurences.findByUser Meteor.userId()
    title:'Tous'
  onAfterAction: ->
    Session.set 'returnUrl', undefined
    Session.set 'title', 'Evènements'

Router.route '/events/:_id',
  name: 'eventsByRecurringEvent'
  template: 'events'
  waitOn: ->
    MS.SubsManager.subscribe "eventOccurences"
  data: ->
    recurringEvent = MS.RecurringEvents.findOne @params._id
    if recurringEvent
      title = recurringEvent.name

    recurringEventId: @params._id
    eventOccurences: MS.EventOccurences.findByRecurringEvent @params._id
    title: title
  onAfterAction: ->
    Session.set 'returnUrl', undefined
    Session.set 'title', 'Evènements'

Router.route '/events/:_id/edit',
  name: 'eventsEdit'
  yieldTemplates:
    header:
      to: 'header'
    footer:
      to: 'footer'
    eventActions:
      to: 'header-actions'

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
    Session.set 'returnUrl', '/events'
    eventOccurence = MS.EventOccurences.findOne @params._id
    if eventOccurence
      Session.set 'title', undefined
