MS.SubsManager = new SubsManager()

#Router.plugin 'loading', loadingTemplate: 'loading'

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: '_loading'
  yieldTemplates:
    header:
      to: 'header'
    footer:
      to: 'footer'
  onBeforeAction: ->
    @next()
    return
  onAfterAction: ->
    return
  unload: ->
    return
  waitOn: ->
    MS.SubsManager.subscribe "recurringEvents"

Router.onBeforeAction AccountsTemplates.ensureSignedIn, except: [
  'atSignIn'
  'atSignUp'
  'atForgotPwd'
  'atResetPwd'
  'home'
]

Router.route '/loading',
  name: 'loading'
  template: '_loading'

Router.route '/sign-out',
  name: 'signout'
  action: ->
    Meteor.logout =>
      @redirect 'home'

Meteor.startup ->
  TAPi18n.setLanguage('fr').fail (error) ->
    console.log error
