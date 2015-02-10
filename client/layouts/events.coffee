Template.header.events
  'click #sidebar-toggle': (event, template) ->
    event.preventDefault();
    $("#wrapper").toggleClass("toggled")
