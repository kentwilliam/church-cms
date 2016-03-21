{ createComponent } = @Helpers
{ div } = React.DOM

createComponent 'Footer',
  render: ->
    div
      className: 'home-section footer'
