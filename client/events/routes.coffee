Router.route '/events/new',
  name: 'eventsNew'
  waitOn: ->  [
      MS.SubsManager.subscribe "recurringEvents"
    ]
  data: ->
    operation: 'insert'
    collection: MS.EventOccurences

Router.route '/events',
  name: 'events'
  waitOn: ->  [
      MS.SubsManager.subscribe "eventOccurences"
      MS.SubsManager.subscribe "recurringEvents"
    ]
  data: ->
    data =
      recurringEvents: MS.RecurringEvents.find {}, sort: name: 1
      eventOccurences: MS.EventOccurences.find {}, sort: date: 1

    return data

Router.route '/events/:_id',
  name: 'eventsByRecurringEvent'
  template: 'events'
  waitOn: ->  [
      MS.SubsManager.subscribe "eventOccurences"
      MS.SubsManager.subscribe "recurringEvents"
    ]
  data: ->
    data =
      recurringEventId: @params._id
      recurringEvents: MS.RecurringEvents.find {}, sort: name: 1
      eventOccurences: MS.EventOccurences.find
        recurringEventId: @params._id
      ,
        sort: date: 1

Router.route '/events/:_id/edit',
  name: 'eventsEdit'
  waitOn: ->  [
      MS.SubsManager.subscribe "eventOccurence", @params._id
      MS.SubsManager.subscribe "recurringEvents"
    ]
  data: ->
    result =
      operation: 'update'
      collection: MS.EventOccurences
      eventOccurence: MS.EventOccurences.findOne @params._id

    result
