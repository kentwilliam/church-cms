# The Router is responsible for routing the user to view the correct part of
# the site

{div, nav, a, h1, h2, p, em, span, iframe, button} = React.DOM

SECTIONS = {
  # "/": { title: "Home" }
  "/new": { title: "I'm New" }
  "/about": { title: "About Us" }
  "/community": { title: "Community" }
  "/volunteer": { title: "Volunteer" }
  # "/calendar": { title: "What's happening?" }
  "/follow": { title: "Watch & Listen" }
  "/give": { title: "Give" }
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

# Responsible for the main navigation and showing/hiding of main sections
createComponent 'Main',
  render: ->
    div
      className: 'main'
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

createComponent 'Hero',
  getInitialState: ->
    disableScreen: false

  render: ->
    div
      className: "section hero #{'disable-screen' if @state.disableScreen}"
      children: [
        Video()
        Menu()
      ]
      onClick: => @setState disableScreen: !@state.disableScreen

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
      # children:
      #   img src: window.image_path("panel-quiet-church.jpg")

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

        for path, section of SECTIONS
          a
            href: path
            children: "#{section.title} »"
      ]

createComponent 'Footer',
  render: ->
    div
      className: 'section footer'

{
  Main,
  Hero,
  Video,
  Menu,
  ImNew,
  Newsletter,
  About,
  Calendar,
  Splash,
  Photos1,
  Photos2,
  Footer
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
