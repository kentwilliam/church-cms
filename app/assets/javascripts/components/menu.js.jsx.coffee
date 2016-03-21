{ createComponent, SECTIONS } = @Helpers
{ div, a, h1, em, span } = React.DOM

createComponent 'Menu',
  MAIN_MENU: [
    "/new",
    "/about",
    "/community",
    "/volunteer",
    "/follow",
    "/give"
  ]

  render: ->
    div
      className: 'menu'
      children: [
        h1
          className: 'logo'
          children: [
            em children: "City Life"
            span children: "San Francisco Church"
          ]
          onClick: -> page '/'

        for path in @MAIN_MENU
          continue unless section = SECTIONS[path]
          a
            href: path
            children: "#{section.title}"
            className: 'is-active' if @props.activeSection.id is section.id
      ]
      onClick: (event) -> event.stopPropagation()

{ Menu } = @Components

createComponent 'ScrolledMenu',
  render: ->
    div
      className: 'scrolled-menu'
      children: Menu()
