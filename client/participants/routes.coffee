MS.Participants.setSidebarRoutes = ->
  Session.set 'sidebar-route-all', 'participants'
  Session.set 'sidebar-route', 'participantsByEvent'

Router.route '/participants',
  name: 'participants'
  waitOn: ->
    MS.SubsManager.subscribe "participants"
  data: ->
    participants: MS.Participants.findByUser Meteor.userId()
  onAfterAction: ->
    Session.set 'title', 'Participants'
    MS.Participants.setSidebarRoutes()

Router.route '/events/:_id/participants',
  name: 'participantsByEvent'
  template: 'participants'
  waitOn: ->
    MS.SubsManager.subscribe "participants"
  data: ->
    eventId: @params._id
    participants: MS.Participants.findByRecurringEvent @params._id
  onAfterAction: ->
    recurringEvent = MS.RecurringEvents.findOne @params._id
    if recurringEvent
      Session.set 'title', recurringEvent.name
    MS.Participants.setSidebarRoutes()

Router.route '/participants/new',
  name: 'participantsNew'
  data: ->
    operation: 'insert'
    collection: MS.Participants
  onAfterAction: ->
    Session.set 'title', 'Nouveau participant'
    MS.Participants.setSidebarRoutes()

Router.route '/participants/:_id',
  name: 'participantsEdit'
  data: ->
    operation: 'update'
    collection: MS.Participants
    participant: MS.Participants.findOne @params._id
  onAfterAction: ->
    participant = MS.Participants.findOne @params._id
    if participant
      Session.set 'title', participant.name()
    MS.Participants.setSidebarRoutes()
