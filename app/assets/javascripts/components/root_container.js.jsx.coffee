# The RootContainer component decides which page to render and animates it onto
# the screen.
#
# The benefit of this is that it allows us to create fancy transitions as the
# user navigates -- if we want to, we can even have the transition be customized
# depending on what's going away / coming onto the screen

{ createComponent, CssTransition } = @Helpers
{ div, nav, a, h1, h2, p, em, span, iframe, button } = React.DOM
{ Page, SiteMenu } = @Components

createComponent 'RootContainer',
  getInitialState: ->
    scrolled: false
    isJavaScriptEnabled: false
    onScroll: null

  componentDidMount: ->
    # Since `componentDidMount` only runs in the browser, we use it to tell if JS is on
    @setState
      isJavaScriptEnabled: true
      onScroll: _?.debounce @onScroll, 100

  onScroll: (offset) ->
    # When the user has scrolled down the page, show top menu for core navigation
    scrolled = offset > 500
    @setState Object.assign @state, {scrolled}

  render: ->
    unless sectionId = @props.section?.id
      return span children: "404 Not Found"

    pageComponent = Page
    pageComponentProps = (_?.assign {}, @props, key: @props.section?.id) || @props
    pageComponentProps.onScroll = @state.onScroll

    CssTransition
      className: @className()
      transitionName: 'page-transition'
      transitionEnterTimeout: 400
      transitionLeaveTimeout: 400
      children: [
        @menu()
        pageComponent pageComponentProps
      ]

  className: ->
    "root-container " +
    "#{'is-root-home' if @props.section?.id is 'home'} " +
    "#{'is-javascript-enabled' if @state.isJavaScriptEnabled} " +
    "#{'is-scrolled' if @state.scrolled}"

  menu: ->
    SiteMenu activeSection: @props.section
