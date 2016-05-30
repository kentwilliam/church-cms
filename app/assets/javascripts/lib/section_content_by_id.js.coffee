@Helpers ?= {}

@Helpers.SECTION_CONTENT_BY_ID =
  home: [
    {
      title: 'Trending Now'
      className: 'calendar'
      subsectionIds: [ 'home-calendar' ]
    }
  ]
  new: [
    {
      title: 'Welcome!'
      className: 'welcome'
      subsectionIds: [ 'new-welcome' ]
    }
    {
      title: 'What to Expect'
      className: 'what-to-expect'
      subsectionIds: [ 'new-what-to-expect', 'new-when-and-where' ]
    }
  ]
  about: [
    {
      title: 'Pastors'
      className: 'pastors'
      subsectionIds: [ 'about-pastors-lead-pastor', 'about-pastors-associate-pastor', 'about-pastors-youth-pastor' ]
      expandible: true
    }
    {
      title: 'Directors'
      className: 'directors'
      subsectionIds: [ 'about-directors' ]
    }
    {
      title: 'What We Believe'
      className: 'platform'
      subsectionIds: [ 'about-platform-values', 'about-platform-vision', 'about-platform-beliefs' ]
      expandible: true
    }
  ]
  community: [
    {
      title: 'Groups'
      className: 'groups'
      subsectionIds: [ 'community-groups-intro', 'community-groups-life-groups', 'community-groups-connect-groups' ]
    }
    {
      title: 'Equipping'
      className: 'equipping'
      subsectionIds: [ 'community-equipping-new-life', 'community-equipping-grow' ]
      # expandible: true
    }
    {
      title: 'Ministries'
      className: 'ministries'
      subsectionIds: [ 'community-ministries' ]
    }
    # {
    #   className: 'full-size-photo'
    #   subsectionIds: [ 'community-equipping-photo' ]
    # }
  ]
  volunteer: [
    {
      title: 'Weekend Ministries'
      className: 'weekend'
      subsectionIds: [ 'volunteer-weekend' ]
    }
    {
      title: 'Local Ministries'
      className: 'local'
      subsectionIds: [
        'volunteer-local-intro'
        'volunteer-local-jail'
        'volunteer-local-bags-of-love'
        'volunteer-local-saturday-clinic'
        'volunteer-local-adopt-a-block'
        'volunteer-local-partners'
      ]
    }
    {
      title: 'Global Ministries'
      className: 'global'
      subsectionIds: [ 'volunteer-global' ]
    }
  ]
  follow: [
    {
      title: 'Latest Sermons'
      className: 'sermons'
      subsectionIds: [
        'watch-and-listen'
      ]
    }
  ]
  give: [
    {
      title: 'Give'
      className: 'give'
      subsectionIds: [ 'give' ]
    }
  ]

