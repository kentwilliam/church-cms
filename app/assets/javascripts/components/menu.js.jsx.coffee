{ createComponent, MAIN_MENU } = @Helpers
{ div, a, h1, em, span, button } = React.DOM

# The hero menu is big and placed on top of the video on the home page
createComponent 'HeroMenu',
  render: ->
    Menu
      className: 'hero-menu'
      onClick: @onClick
      skipSectionId: 'home'

  onClick: (event) ->
    event.stopPropagation()

# The Site menu normally is shown at the top of the page. If the user
# is on a small-screen device, it will be hidden behind a menu button
# (the menu links are also repeated in the footer of each page.)
createComponent 'SiteMenu',
  getInitialState: ->
    isActive: false

  componentWillReceiveProps: (newProps) ->
    # If the user navigates, hide the menu
    if newProps.activeSection.id isnt @props.activeSection.id
      @setState isActive: false

  render: ->
    div
      className: "site-menu #{'is-active' if @state.isActive}"
      children: [
        Menu useLink: true, activeSection: @props.activeSection
        @toggleButton()
      ]

  toggleButton: ->
    button
      className: 'toggle'
      children: 'menu'
      onClick: @toggleIsActive

  toggleIsActive: ->
    @setState isActive: !@state.isActive

createComponent 'Menu',
  render: ->
    div
      className: "menu #{@props.className}"
      children: [
        @logo()
        div className: 'menu-items', children: @menuItems()
      ]

  logo: ->
    component = if @props.useLink then a else div

    props =
      className: 'logo'
      children: h1 children: [
        em children: "City Life"
        span children: "San Francisco Church"
      ]

    if @props.useLink
      props.href = '/'

    component props

  menuItems: ->
    for section in MAIN_MENU
      continue if section.id is @props.skipSectionId
      a
        href: section.path
        children: "#{section.title}"
        className: 'is-active' if @props.activeSection?.id is section.id

{ Menu, HeroMenu, SiteMenu } = @Components
