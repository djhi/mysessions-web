Router.plugin 'loading', loadingTemplate: 'loading'

Router.configure
  progressDebug: false
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

Router.onBeforeAction AccountsTemplates.ensureSignedIn, except: [
  'atSignIn'
  'atSignUp'
  'atForgotPwd'
  'atResetPwd'
  'home'
]
