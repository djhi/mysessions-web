Router.route '/events/new',
  name: 'eventsNew'
  waitOn: ->
    MS.SubsManager.subscribe "participants"
  data: ->
    operation: 'insert'
    collection: MS.EventOccurences
  onAfterAction: ->
    Session.set 'returnUrl', '/events'
    Session.set 'title', 'Nouvel évènement'

Router.route '/events',
  name: 'events'
  waitOn: ->
    MS.SubsManager.subscribe "eventOccurences"
  data: ->
    eventOccurences: MS.EventOccurences.findByUser Meteor.userId()
  onAfterAction: ->
    Session.set 'returnUrl', undefined
    Session.set 'title', 'Tous'

Router.route '/events/:_id',
  name: 'eventsByRecurringEvent'
  template: 'events'
  waitOn: ->
    MS.SubsManager.subscribe "eventOccurences"
  data: ->
    recurringEventId: @params._id
    eventOccurences: MS.EventOccurences.findByRecurringEvent @params._id
  onAfterAction: ->
    Session.set 'returnUrl', '/events'
    recurringEvent = MS.RecurringEvents.findOne @params._id
    if recurringEvent
      Session.set 'title', recurringEvent.name

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
    Session.set 'returnUrl', '/events'
    eventOccurence = MS.EventOccurences.findOne @params._id
    if eventOccurence
      Session.set 'title', eventOccurence.name()
