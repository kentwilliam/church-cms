{ createComponent } = @Helpers
{ div, nav, a, h1, h2, p, em, span, iframe, button } = React.DOM

createComponent 'LinkButton',
  render: ->
    a
      className: 'button link-button'
      href: @props.href
      children: @props.children

{ LinkButton, SiteMenu, HeroMenu } = @Components

createComponent 'Hero',
  getInitialState: ->
    disableScreen: false

  render: ->
    div
      className: "home-section hero #{'disable-screen' if @state.disableScreen}"
      children: [
        Video videoId: '151691020', autoplay: true, loop: true
        HeroMenu activeSection: @props.section
      ]
      onClick: => @setState disableScreen: !@state.disableScreen

createComponent 'ImNew',
  render: ->
    div
      className: 'home-section im-new'
      children: div className: 'content', children: [
        div
          className: 'segment'
          children: [
            h2 children: 'Welcome!'
            p children: 'Did you know that you were created by a loving God who\'s got nothing but great things for you? Join us at City Life, where church is relevant, exciting, presence-driven, and fun.'
            LinkButton
              href: '/about'
              children: 'Who are we? »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'What to Expect'
            p children: 'What should I wear? Where do I park? Where do my kids go? Visiting a new church brings up questions, but luckily, we got them all covered.'
            LinkButton
              href: '/new'
              children: 'Find out more »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'When & Where?'
            p children: [
              'We\'d love to see you at 11am, this Sunday! Our main service is at '
              a
                href: 'https://goo.gl/maps/pnCxcZ8EV2F2'
                children: '363 6th Street, San Francisco, California'
              '.'
            ]
            LinkButton
              href: '/new'
              children: 'Directions + Parking »'
          ]
      ]

createComponent 'Newsletter',
  render: ->
    div
      className: 'home-section newsletter'
      children: div className: 'content', children: [
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
      children: div className: 'content', children: [
        div
          className: 'screen'
        div
          className: 'segment'
          children: [
            h2 children: 'Team'
            p children: 'Did you know that you were created by a loving God? Join us at City Life, where church is relevant, exciting, presence-driven, and fun.'
            LinkButton
              href: '/about'
              children: 'Meet the team »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'Values'
            p children: 'We are striving to fulfill the vision God has placed in our hearts. Our call is clear, our theology is firm and our methodologies are fluid.'
            LinkButton
              href: '/about'
              children: 'More on values »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'Vision'
            p children: 'We exist so that people far from God will encounter the presence of God and experience the life that only Jesus offers. This is our foundation.'
            LinkButton
              href: '/about'
              children: 'More on vision »'
          ]
        div
          className: 'segment'
          children: [
            h2 children: 'Beliefs'
            p children: 'When it comes to the major issues of life, God provides clear answers. The Bible doesn’t just “contain” the Word of God, it is the Word of God.'
            LinkButton
              href: '/about'
              children: 'More on beliefs »'
          ]
      ]

createComponent 'Calendar',
  render: ->
    div
      className: 'home-section calendar'
      children: [
        h2 children: 'Trending Now'
        Video videoId: '158974899'
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
        src: "https://player.vimeo.com/video/#{@props.videoId}?" +
          'color=000000&' +
          'title=0&' +
          'byline=0&' +
          'portrait=0&' +
          (if @props.loop then 'loop=1&' else '') +
          (if @props.autoplay then 'autoplay=1' else '')
        width: '100%'
        height: '100%'
        frameBorder: 0
        allowFullScreen: true


{ Hero, Video, ImNew, Newsletter, Photos1, About, Photos2, Calendar, Splash, Footer, VimeoVideo } = @Components

createComponent 'Home',
  render: ->
    div
      className: 'home'
      children: [
        Hero section: @props.section
        ImNew()
        # Newsletter()
        Photos1()
        About()
        Photos2()
        Calendar()
        Splash()
        # Footer activeSection: @props.section
      ]
