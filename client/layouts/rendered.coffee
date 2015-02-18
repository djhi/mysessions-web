Template.sideNavToggle.rendered = ->
  $(".button-collapse").sideNav menuWidth: 240, activationWidth: 70
  return

Template.userMenu.rendered = ->
  @$(".dropdown-button").dropdown hover: false, constrain_width: false
  return
