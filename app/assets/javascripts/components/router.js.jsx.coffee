# The Router is responsible for routing the user to view the correct part of
# the site

{div, nav, a, h1, h2, p, em, span, iframe, button} = React.DOM

# Complete map of the site
SECTIONS =
  "/":          { id: 'home',      title: "Home" }
  "/new":       { id: 'new',       title: "I'm New",           theme: 'light-gray' }
  "/about":     { id: 'about',     title: "About Us",          theme: 'red' }
  "/community": { id: 'community', title: "Community",         theme: 'dark-gray' }
  "/volunteer": { id: 'volunteer', title: "Volunteer",         theme: 'light-gray' }
  "/calendar":  { id: 'calendar',  title: "What's happening?", theme: 'white' }
  "/follow":    { id: 'follow',    title: "Watch & Listen",    theme: 'dark-gray' }
  "/give":      { id: 'give',      title: "Give",              theme: 'red' }

# What will be shown in the main menu
MENU = [
  "/new",
  "/about",
  "/community",
  "/volunteer",
  "/follow",
  "/give"
]

createComponent = (name, spec) ->
  window.Components ||= {}
  window.Components[name] = React.createFactory React.createClass spec

capitalizeFirst = (string) ->
  (string.charAt 0).toUpperCase() + string.slice 1

CssTransition = React.createFactory React.addons.CSSTransitionGroup


# The RootContainer component decides which page to render and animates it onto the screen.
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
      pageComponent = window.Components.Page
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

createComponent 'Home',
  render: ->
    div
      className: 'home'
      key: 'home'
      children: [
        Hero()
        ImNew()
        Newsletter()
        Photos1()
        About()
        Photos2()
        Calendar()
        Splash()
        Footer()
      ]
      #]

#createComponent 'AnimateChildrenChanges',
#getInitialState: ->
#enteringKeys: {}
#exitingKeys: {}

#componentWillReceiveProps: ->
#console.log "receiving props", arguments[0]?.children

#componentDidReceiveProps: ->
#console.log 'here'

##component

#render: ->
##(console.log 'rendering', @props)
##if window.location
##console.log 'rendering'
##console.log(@props.children)

#div
#children: @props.children

# Extracts the data for a given section id
sectionContent = (props) ->
  return unless sectionId = props?.section?.id

  props?.data?.pages?.posts
    .filter((page) -> page.slug is sectionId)[0]

#home = ->

createComponent 'Hero',
  getInitialState: ->
    disableScreen: false

  render: ->
    div
      className: "home-section hero #{'disable-screen' if @state.disableScreen}"
      children: [
        Video()
        #Menu()
        #ScrolledMenu()
      ]
      onClick: => @setState disableScreen: !@state.disableScreen

createComponent 'ScrolledMenu',
  render: ->
    div
      className: 'scrolled-menu'
      children: Menu()

createComponent 'ImNew',
  render: ->
    div
      className: 'home-section im-new'
      children: [
        div
          className: 'segment'
          children: [
            h2 children: 'Welcome!'
            p children: 'Did you know that you were created by a loving God who\'s got nothing but great things for you? Join us at City Life, where church is relevant, exciting, presence-driven, and fun.'
            button children: 'Who are we? »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'What to Expect'
            p children: 'What should I wear? Where do I park? Where do my kids go? Visiting a new church brings up questions, but luckily, we got them all covered.'
            button children: 'Find out more »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'When & Where?'
            p children: 'We\'d love to see you at 11am, this Sunday! Our main service is at 363 6th Street, San Francisco, California.'
            button children: 'Directions + Parking »'
          ]
      ]

createComponent 'Newsletter',
  render: ->
    div
      className: 'home-section newsletter'
      children: [
        "Newsletter sign-up"
      ]

createComponent 'Photos1',
  render: ->
    div className: 'home-section photos-1'

createComponent 'Photos2',
  render: ->
    div className: 'home-section photos-2'

createComponent 'About',
  render: ->
    div
      className: 'home-section about'
      children: [
        div
          className: 'screen'
        div
          className: 'segment'
          children: [
            h2 children: 'Team'
            p children: 'Did you know that you were created by a loving God? Join us at City Life, where church is relevant, exciting, presence-driven, and fun.'
            button children: 'Meet the team »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'Values'
            p children: 'Did you know that you were created by a loving God? Join us at City Life, where church is relevant, exciting, presence-driven, and fun.'
            button children: 'More on values »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'Vision'
            p children: 'Did you know that you were created by a loving God? Join us at City Life, where church is relevant, exciting, presence-driven, and fun.'
            button children: 'More on vision »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'Beliefs'
            p children: 'Did you know that you were created by a loving God? Join us at City Life, where church is relevant, exciting, presence-driven, and fun.'
            button children: 'More on beliefs »'
          ]
      ]

createComponent 'Calendar',
  render: ->
    div
      className: 'home-section calendar'
      children: [
        "Calendar section"
      ]

createComponent 'Splash',
  render: ->
    div
      className: 'home-section splash'

createComponent 'Video',
  render: ->
    div
      className: 'video'
      children: iframe
        #src: 'https://player.vimeo.com/video/151691020?' +
        #'loop=1&' +
        #'color=000000&' +
        #'title=0&' +
        #'byline=0&' +
        #'portrait=0&' +
        #'autoplay=1'
        #width: '100%'
        #height: '100%'
        #frameBorder: 0
        #allowFullScreen: true

createComponent 'Menu',
  render: ->
    console.log 'printing menu', @props
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

        for path in MENU
          continue unless section = SECTIONS[path]
          a
            href: path
            children: "#{section.title}"
            className: 'is-active' if @props.activeSection.id is section.id
      ]
      onClick: (event) -> event.stopPropagation()

createComponent 'Footer',
  render: ->
    div
      className: 'home-section footer'

createComponent 'Page',
  render: ->
    spec = sectionContent(@props)

    unless spec?.title and spec?.content
      spec =
        title: @props.section.title
        content: 'Content coming soon …'

    div
      className: "page theme-#{@props.section.theme}"
      children: [
        div className: "background"
        div className: "page-content", dangerouslySetInnerHTML: { __html: spec.content }
      ]

{
  # Core
  RootContainer
  Menu
  ScrolledMenu
  AnimateChildrenChanges

  # Home page components
  Hero
  Video
  Footer

  # Home page sections
  ImNew
  Newsletter
  About
  Calendar
  Splash
  Photos1
  Photos2

  # Pages
  Home
  Page
} = window.Components

# The router ensures that we update the page once the user navigates
@Router = React.createClass
  getInitialState: ->
    path: @props.path or "/"

  componentWillMount: ->
    # The router does not run server side
    unless page = window.page
      return

    # Whenever the user clicks on a link, update the section
    for sectionPath, sectionDetails of SECTIONS
      page sectionPath, do (sectionPath) =>
        =>
          console.log 'route change!', arguments
          @setState path: sectionPath
          return false

    # 404 not found
    page '*', ->
      console.log "Not found"

    # Start tracking user clicks
    page.start()

  render: ->
    RootContainer
      section: SECTIONS[@state.path]
      data: @props.wordpressResources
