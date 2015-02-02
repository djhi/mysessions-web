Router.route '/events/new',
  name: 'eventsNew'
  data: ->
    operation: 'insert'
    collection: MS.EventOccurences

Router.route '/events',
  name: 'events'
  data: ->
    data =
      recurringEvents: MS.RecurringEvents.find {}, sort: name: 1
      eventOccurences: MS.EventOccurences.find {}, sort: date: 1

    return data

Router.route '/events/:_id',
  name: 'eventsByRecurringEvent'
  template: 'events'
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
  data: ->
    operation: 'update'
    collection: MS.EventOccurences
    participant: MS.EventOccurences.findOne @params._id