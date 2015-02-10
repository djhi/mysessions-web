Meteor.startup ->
  moment.locale 'fr'
  momentLocale.changed()

momentLocale = new Deps.Dependency()

Template.registerHelper 'dateFormat', (context, block) ->
  momentLocale.depend()

  if window.moment
    f = block.hash.format || "MMM DD, YYYY hh:mm:ss A"
    return moment(context).format(f)
  else
    return context
