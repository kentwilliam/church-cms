{ createComponent, contentForSlug, asset } = @Helpers
{ div, img, h1, h2, button } = React.DOM
{ Footer } = @Components

createComponent 'Page',
  render: ->
    { section } = @props
    spec = advancedContent @props

    unless spec?.title and spec?.content
      spec =
        title: section.title
        content: 'Content coming soon …'

    div
      className: "page page-#{section.id} theme-#{section.theme}"
      children: [
        div className: "background"
        div
          className: "page-hero"
          style:
            backgroundImage: "url('#{asset(section.id)}')"
          children: h1 children: section.title
        div className: "page-content", children: spec.content
        Footer activeSection: @props.section
      ]

advancedContent = (props) ->
  return unless sectionContents = SECTION_CONTENT_BY_ID[props?.section?.id]

  title: 'About Us'
  content: for sectionContent in sectionContents
    React.DOM.section
      className: sectionContent.className
      children: div children: [
        h2 children: sectionContent.title
        for subsectionIds in sectionContent.subsectionIds
          componentProps = _.extend {}, @props, html: (contentForSlug props, subsectionIds)?.content or ''

          if sectionContent.expandible
            ExpandiblePageSubsection componentProps
          else
            PageSubsection componentProps
      ]

SECTION_CONTENT_BY_ID =
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

createComponent 'PageSubsection',
  render: ->
    React.DOM.section
      dangerouslySetInnerHTML: { __html: @props.html }

createComponent 'ExpandiblePageSubsection',
  getInitialState: ->
    isExpanded: false

  render: ->
    React.DOM.section
      className: 'expandible-page-subsection ' + ('is-expanded' if @state.isExpanded)
      children: [
        div
          className: 'content'
          dangerouslySetInnerHTML: { __html: @props.html }
        div className: 'expand-shade'
        button
          onClick: => @setState isExpanded: not @state.isExpanded
          children: if @state.isExpanded then 'Less' else 'More'
      ]

{ PageSubsection, ExpandiblePageSubsection } = @Components



# Extracts the data for a given section id
# @Helpers.sectionContent = (props) ->
#   return unless sectionId = props?.section?.id

#   props?.data?.pages?.posts
#     .filter((page) -> page.slug is sectionId)[0]
