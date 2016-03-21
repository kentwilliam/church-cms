# The RootContainer component decides which page to render and animates it onto
# the screen.
#
# The benefit of this is that it allows us to create fancy transitions as the
# user navigates -- if we want to, we can even have the transition be customized
# depending on what's going away / coming onto the screen

{ createComponent, CssTransition } = @Helpers
{ div, nav, a, h1, h2, p, em, span, iframe, button } = React.DOM
{ Page, Home, Menu } = @Components

createComponent 'RootContainer',
  getInitialState: ->
    scrolled: window?.pageYOffset > 500
    isJavaScriptEnabled: false

  onScroll: ->
    @setState @getInitialState()

  componentDidMount: ->
    # Since `componentDidMount` only runs in the browser, we use it to tell if JS is on
    @setState isJavaScriptEnabled: true

    unless window?.addEventListener && _
      return

    window.addEventListener 'scroll', _.debounce @onScroll, 50

  render: ->
    if (sectionId = @props.section?.id) and sectionId isnt 'home'
      pageComponent = Page
      pageComponentProps = (_?.assign {}, @props, key: @props.section?.id) || @props

    CssTransition
      className: @className()
      transitionName: 'page-transition'
      transitionEnterTimeout: 400
      transitionLeaveTimeout: 400
      children: [
        @menu()
        if pageComponent
          pageComponent pageComponentProps
        else
          Home()
      ]

  className: ->
    "root-container " +
    "#{'is-javascript-enabled' if @state.isJavaScriptEnabled} " +
    "#{'is-scrolled' if @state.scrolled}"

  menu: ->
    div
      className: 'static-menu'
      children: Menu activeSection: @props.section
      key: 'menu'
