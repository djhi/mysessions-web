###
describe "mysessions:web-participants", ->
  describe "List", ->
    beforeAll (test) ->
      spies.restoreAll()
      stubs.restoreAll()
      return

    afterAll (test) ->
      spies.restoreAll()
      stubs.restoreAll()
      return

    beforeEach (test) ->
      test.router = new Iron.Router()
      test.router.configure autoStart: false, autoRender: false
      MS.registerRoutes MS.Participants.routes, test.router

      spies.create 'participantsFind', MS.Participants, 'find'
      spies.create 'eventOccurencesFind', MS.EventOccurences, 'find'
      spies.create 'recurringEventsFind', MS.RecurringEvents, 'find'
      return

    afterEach (test) ->
      spies.restoreAll()
      return

    it 'Route participants should call MS.Participants.find with sort on lastname then firstname', (test)->
      data = test.router.routes['participants'].options.data()
      expect(spies.participantsFind).to.have.been.calledWith {}, sort: lastName: 1, firstName: 1
      return

    it 'Route participants should call MS.RecurringEvents.find with sort on name', (test)->
      data = test.router.routes['participants'].options.data()
      expect(spies.recurringEventsFind).to.have.been.calledWith {}, sort: name: 1
      return

    it 'participants should display a list of clickable recurring event if available', (test)->
      div = renderToDiv Template.participants, recurringEvents: [{ _id: "toto" }, { _id: "titi" }]
      expect($(div).find('a.list-group-item.recurring-event').length).to.equal(2)
      return

    it 'participants should display a list of clickable participants if available', (test)->
      div = renderToDiv Template.participants, participants: [{ _id: "toto" }, { _id: "titi" }]
      expect($(div).find('a.list-group-item.participant').length).to.equal(2)
      return
  return
return
###
