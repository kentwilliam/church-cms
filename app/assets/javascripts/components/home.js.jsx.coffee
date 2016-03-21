{ createComponent } = @Helpers
{ div, nav, a, h1, h2, p, em, span, iframe, button } = React.DOM

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

{ Hero, Video, ImNew, Newsletter, Photos1, About, Photos2, Calendar, Splash, Footer } = @Components

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
