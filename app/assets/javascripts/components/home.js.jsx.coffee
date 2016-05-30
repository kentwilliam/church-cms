{ createComponent, contentForSlug, DAYS } = @Helpers
{ div, nav, a, h1, h2, p, em, span, iframe, button } = React.DOM

createComponent 'LinkButton',
  render: ->
    a
      className: 'button'
      href: @props.href
      children: @props.children

{ LinkButton, HeroMenu } = @Components

createComponent 'Hero',
  render: ->
    div
      className: 'home-section hero'
      children: [
        Video videoId: '151691020', autoplay: true, loop: true
        div className: 'overlay'
        HeroMenu activeSection: @props.section
      ]

createComponent 'LiveStream',
  #getInitialState: ->
    #timestamp: +new Date()

  #componentDidMount: ->
    #setInterval (=> @setState timestamp: +new Date()), 1000

  render: ->
    unless @shouldShowLive()
      return null

    div
      className: 'home-section live-stream'
      children: div
        className: 'content'
        children: @live() or @countdown()

  shouldShowLive: ->
    # The live section is only shown when we're live, or when we just went off the air
    now = new Date()
    day = now.getDay()
    hour = now.getHours()
    churchIsLive = day is DAYS.Sunday and hour > 10 and hour < 14
    return churchIsLive

  live: ->
    [
      h2 children: "We're Live!"
      p children: "We go on the air every Sunday at 11am Pacific. This way, you can participate even when you can't attend in person!"
      div
        className: 'stream-container'
        children: iframe
          src: 'http://livestream.com/accounts/3544533/events/2011453/player?width=560&height=315&autoPlay=true&mute=false'
          frameborder: 0
          scrolling: 'no'
    ]

  countdown: ->
    'Not live yet!!!'

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
    # Extract numeric ID for the video (temporary)
    unless videoId = (contentForSlug @props, 'home-calendar')?.content.match(/[0-9]+/)?[0]
      return null

    div
      className: 'home-section calendar'
      children: [
        h2 children: 'Trending Now'
        Video {videoId}
      ]

createComponent 'SplashSilentChurch',
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

{ Hero, Video, LiveStream, ImNew, Newsletter, Photos1, About, Photos2, Calendar, SplashSilentChurch, Footer, VimeoVideo } = @Components

createComponent 'Home',
  render: ->
    div
      className: 'home'
      children: [
        Hero section: @props.section
        LiveStream()
        ImNew()
        Newsletter()
        Photos1()
        About()
        Photos2()
        Calendar @props
        SplashSilentChurch()
        # Footer activeSection: @props.section
      ]
