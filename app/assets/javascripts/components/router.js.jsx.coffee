# The Router is responsible for routing the user to view the correct part of
# the site

{div, nav, a, h1, h2, p, em, span, iframe, button} = React.DOM

SECTIONS = {
  "/": { id: 'home', title: "Home" }
  "/new": { id: 'new', title: "I'm New" }
  "/about": { id: 'about', title: "About Us" }
  "/community": { id: 'community', title: "Community" }
  "/volunteer": { id: 'volunteer', title: "Volunteer" }
  # "/calendar": { title: "What's happening?" }
  "/follow": { id: 'follow', title: "Watch & Listen" }
  "/give": { id: 'give', title: "Give" }
}

# $ = require("../vendor/lodash.js")
# console.log "----"
# # console.log typeof $
# console.log typeof _
# console.log typeof window._
# MENU_SECTIONS =

createComponent = (name, spec) ->
  window.Components ||= {}
  window.Components[name] = React.createFactory React.createClass spec

capitalizeFirst = (string) ->
  (string.charAt 0).toUpperCase() + string.slice 1

# Responsible for the main navigation and showing/hiding of main sections
createComponent 'Main',
  getInitialState: ->
    scrolled: window?.pageYOffset > 500

  onScroll: ->
    @setState @getInitialState()

  componentDidMount: ->
    unless window?.addEventListener && _
      return

    window.addEventListener 'scroll', _.debounce @onScroll, 50

  render: ->
    console.log 'rendering main', @props.section?.id
    if sectionId = @props.section?.id
      if sectionId isnt 'home'
        pageComponent = window.Components.PageFollow
      # pageComponent = window.Components['Page' + capitalizeFirst sectionId]

    div
      className: "main #{'is-scrolled' if @state.scrolled}"
      children: if pageComponent
        [
          div
            className: 'static-menu'
            children: Menu()
          pageComponent @props
        ]
      else
        home()

# pp = -> console.log.apply null, arguments

home = ->
  [
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


createComponent 'Hero',
  getInitialState: ->
    disableScreen: false

  render: ->
    div
      className: "section hero #{'disable-screen' if @state.disableScreen}"
      children: [
        Video()
        Menu()
        ScrolledMenu()
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
      className: 'section im-new'
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
      className: 'section newsletter'
      children: [
        "Newsletter sign-up"
      ]

createComponent 'Photos1',
  render: ->
    div className: 'section photos-1'

createComponent 'Photos2',
  render: ->
    div className: 'section photos-2'

createComponent 'About',
  render: ->
    div
      className: 'section about'
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
      className: 'section calendar'
      children: [
        "Calendar section"
      ]

createComponent 'Splash',
  render: ->
    div
      className: 'section splash'

createComponent 'Video',
  render: ->
    div
      className: 'video'
      children: iframe
        src: 'https://player.vimeo.com/video/151691020?' +
          'loop=1&' +
          'color=000000&' +
          'title=0&' +
          'byline=0&' +
          'portrait=0&' +
          'autoplay=1'
        width: '100%'
        height: '100%'
        frameBorder: 0
        allowFullScreen: true

createComponent 'Menu',
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

        for path, section of SECTIONS
          if section.id == 'home'
            continue
          a
            href: path
            children: "#{section.title}"
      ]
      onClick: (event) -> event.stopPropagation()

createComponent 'Footer',
  render: ->
    div
      className: 'section footer'

createComponent 'PageFollow',
  getInitialState: ->
    enter: false

  componentDidMount: ->
    console.log "mount"
    setTimeout =>
      @setState enter: true
    , 100

  render: ->
    div
      className: "page page-follow #{'enter' if @state.enter}"
      children: [
        h1 children: @props.section.title#'Watch & Listen'
        p children: 'content coming here ...'
      ]

{
  Main,
  Hero,
  Video,
  Menu,
  ScrolledMenu,
  ImNew,
  Newsletter,
  About,
  Calendar,
  Splash,
  Photos1,
  Photos2,
  Footer,
  # pages
  PageFollow
} = window.Components

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
          @setState path: sectionPath
          return false

    # 404 not found
    page '*', ->
      console.log "Not found"

    # Start tracking user clicks
    page.start()

  render: ->
    Main section: SECTIONS[@state.path]
