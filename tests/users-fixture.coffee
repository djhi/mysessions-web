if Meteor.isServer
  # create a predictable set of players and score to test with
  _resetUsers = ->
    Meteor.users.remove {}

    users = [
      email: "test1@test.com", password: "test14"
    ,
      email: "test2@test.com", password: "test14"
    ,
      email: "test3@test.com", password: "test14"
    ,
      email: "test4@test.com", password: "test14"
    ,
    ]

    _.each users, (user) ->
      Accounts.createUser user
      return

    return

  Meteor.methods
    "/fixtures/resetUsers": ->
      _resetUsers()
      return

return
