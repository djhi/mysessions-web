Selectize.defaults.render.option_create = (data, escape) ->
  label = TAPi18n.__ 'add'
  input = escape(data.input)
  return "<div class=\"create\">#{label} <strong>#{input}</strong>&hellip;</div>"
