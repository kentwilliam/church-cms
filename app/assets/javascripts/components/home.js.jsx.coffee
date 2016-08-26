{ createComponent, contentForSlug, DAYS } = @Helpers
{ div, nav, a, h1, h2, h3, p, em, span, img, b, br, iframe, button } = React.DOM
MAPS_API_KEY = 'AIzaSyCGkmMW-pjuwyqlIkozcEFi0jpRcIRsrTg'

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
    churchIsLive = day is DAYS.Sunday and hour > 9 and hour < 13
    return churchIsLive

  live: ->
    [
      h2 children: "We're Live!"
      p children: "We go on the air every Sunday at 10am Pacific. This way, you can participate even when you can't attend in person!"
      div
        className: 'stream-container'
        children: iframe
          src: 'http://livestream.com/accounts/3544533/events/2011453/player?width=560&height=315&autoPlay=true&mute=false'
          frameBorder: 0
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
              'We\'d love to see you at 10am, this Sunday! Our main service is at '
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

{asset} = @Helpers

LOCATIONS =
  location_6thstreet: 'ChIJ_ZZUtIGAhYARiCCXT4MgFIY' #, '37.7781498,-122.3967934']
  location_sfstate: 'ChIJD8sx2LN9j4ARrkbwuA-vRo4' #, '37.7781498,-122.3967934']

LOCATION_DETAILS =
  location_6thstreet: [
    b children: 'Main Service'
    'Sundays at 10am'
    br()
    b children: 'City Life Youth'
    '1st & 3rd Fridays of the month at 7pm'
  ]
  location_sfstate: [
    b children: 'Fall Services'
    br()
    'September 11th'
    'September 25th'
    'October 9th'
    'October 23rd'
    'November 13th'
    'November 27th'
    'December 11th'
    br()
    'Time: 5pm'
  ]

createComponent 'Locations',
  getInitialState: ->
    activeLocation: null

  render: ->
    place = LOCATIONS[@state.activeLocation]
    # [place, center] = location if location
    src = "https://www.google.com/maps/embed/v1/place?" +
      "q=place_id:#{place}&" +
      # "center=#{center}&" +
      "key=#{MAPS_API_KEY}"
    div
      className: "home-section locations active-#{@state.activeLocation}"
      children: [
        div
          className: "map #{'active' if @state.activeLocation}"
          children: [
            iframe
              width: '67%'
              height: '100%'
              frameBorder: 0
              style: border: 0
              src: src
              allowFullScreen: true
            div
              className: 'details'
              children: [
                LOCATION_DETAILS[@state.activeLocation]
                button
                  className: 'close-button'
                  children: '×'
                  onClick: => @setState activeLocation: null
              ]
          ]
        div
          className: 'content'
          children: [
            h2 children: 'Locations'
            div
              className: "segment location_6thstreet"
              children: [
                img src: asset 'location_6thstreet'
                h3 children: 'SoMa Campus'
                p children: '363 6th Street'
              ]
              onClick: => @setState activeLocation: 'location_6thstreet'
            div
              className: "segment location_sfstate"
              children: [
                img src: asset 'location_sfstate'
                h3 children: 'West Campus'
                p children: [
                  'Jack Adams Hall,'
                  br()
                  'Cesar Chavez Student Center,'
                  br()
                  'SF State University'
                ]
              ]
              onClick: => @setState activeLocation: 'location_sfstate'
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

{
  Hero,
  Video,
  LiveStream,
  ImNew,
  Locations,
  Newsletter,
  Photos1,
  About,
  Photos2,
  Calendar,
  SplashSilentChurch,
  Footer,
  VimeoVideo
} = @Components

createComponent 'Home',
  render: ->
    div
      className: 'home'
      children: [
        Hero section: @props.section
        LiveStream()
        ImNew()
        Locations()
        Newsletter()
        Photos1()
        About()
        Photos2()
        Calendar @props
        SplashSilentChurch()
        # Footer activeSection: @props.section
      ]
