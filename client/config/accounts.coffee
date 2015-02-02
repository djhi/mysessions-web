T9n.setLanguage('fr')

if Meteor.isClient
  Accounts.ui.config
    requestPermissions:
      facebook: ['email', 'user_friends', 'read_friendlists']
      google: ['https://www.google.com/m8/feeds']
    requestOfflineToken: google: true
    passwordSignupFields: 'USERNAME_AND_EMAIL'

AccountsTemplates.configureRoute 'signUp', redirect: '/'
AccountsTemplates.configureRoute 'signIn'
AccountsTemplates.configureRoute 'changePwd'
AccountsTemplates.configureRoute 'enrollAccount'
AccountsTemplates.configureRoute 'forgotPwd'
AccountsTemplates.configureRoute 'resetPwd'
AccountsTemplates.configureRoute 'verifyEmail'

AccountsTemplates.configure
  confirmPassword: true
  enablePasswordChange: true
  sendVerificationEmail: true
  showForgotPasswordLink: true
  continuousValidation: true
  showAddRemoveServices: true
  homeRoutePath: '/'
