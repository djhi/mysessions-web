Router.route '/',
  name: 'home'
  onBeforeAction: ->
    if Meteor.user() then @redirect 'events'
    @next()
    return
  onAfterAction: ->
    Session.set 'title', 'MySessions'
