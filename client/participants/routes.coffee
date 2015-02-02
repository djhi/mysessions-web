Router.route '/participants',
  name: 'participants'
  data: ->
    data =
      participants: MS.Participants.find {}, sort: lastName: 1, firstName: 1
      recurringEvents: MS.RecurringEvents.find {}, sort: name: 1

    return data

Router.route '/events/:_id/participants',
  name: 'participantsByEvent'
  template: 'participants'
  data: ->
    data =
      eventId: @params._id
      participants: MS.Participants.find
        recurringEventsIds: @params._id
      ,
        sort: lastName: 1, firstName: 1
      recurringEvents: MS.RecurringEvents.find {}, sort: name: 1

    return data

Router.route '/participants/new',
  name: 'participantsNew'
  data: ->
    operation: 'insert'
    collection: MS.Participants

Router.route '/participants/:_id/participants/:_id',
  name: 'participantsEdit'
  data: ->
    operation: 'update'
    collection: MS.Participants
    participant: MS.Participants.findOne @params._id
