MS.SubsManager = new SubsManager()

#Router.plugin 'loading', loadingTemplate: 'loading'

Router.configure
  progress : true
  progressDebug: false
  progressTick : false
  progressSpinner : true
  progressDelay : 100

  layoutTemplate: 'layout'
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

Meteor.startup ->
  TAPi18n.setLanguage('fr').fail (error) ->
    console.log error
