Router.route '/participants',
  name: 'participants'
  waitOn: ->
    MS.SubsManager.subscribe "participants"
  data: ->
    participants: MS.Participants.findByUser Meteor.userId()
    title:'Tous'
  onAfterAction: ->
    Session.set 'returnUrl', undefined
    Session.set 'title', 'Participants'

Router.route '/events/:_id/participants',
  name: 'participantsByEvent'
  template: 'participants'
  waitOn: ->
    MS.SubsManager.subscribe "participants"
  data: ->
    recurringEvent = MS.RecurringEvents.findOne @params._id
    if recurringEvent
      title = recurringEvent.name

    eventId: @params._id
    participants: MS.Participants.findByRecurringEvent @params._id
    title: title
  onAfterAction: ->
    Session.set 'returnUrl', '/participants'

Router.route '/participants/new',
  name: 'participantsNew'
  data: ->
    operation: 'insert'
    collection: MS.Participants
  onAfterAction: ->
    Session.set 'returnUrl', '/participants'
    Session.set 'title', 'Nouveau participant'

Router.route '/participants/:_id',
  name: 'participantsEdit'
  data: ->
    operation: 'update'
    collection: MS.Participants
    participant: MS.Participants.findOne @params._id
  onAfterAction: ->
    Session.set 'returnUrl', '/participants'
    participant = MS.Participants.findOne @params._id
    if participant
      Session.set 'title', participant.name()
