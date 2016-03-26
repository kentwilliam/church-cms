{ createComponent, MAIN_MENU, contentForSlug } = @Helpers
{ div, a, label, p, h4 } = React.DOM

createComponent 'Footer',
  render: ->
    div
      className: 'home-section footer'
      children: div className: 'content', children: [
        @menu()
        @copyright()
      ]

  menu: ->
    div children: for section in MAIN_MENU
      a
        href: section.path
        children: "#{section.title}"
        className: 'is-active' if @isActive section

  isActive: (section) ->
    if activeSection = @props.activeSection
      activeSection.id is section.id
    else
      section.id is 'home'

  copyright: ->
    div
      children: "© #{YEAR} City Life Church SF"

YEAR = new Date().getFullYear()
