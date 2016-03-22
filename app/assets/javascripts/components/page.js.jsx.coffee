{ createComponent, sectionContent, asset } = @Helpers
{ div, img, h1, h2, button } = React.DOM

createComponent 'Page',
  render: ->
    { section } = @props
    spec = advancedContent @props #) or sectionContent @props

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
        div className: "page-content", children: spec.content #dangerouslySetInnerHTML: { __html: spec.content }
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
      title: 'Platform'
      className: 'platform'
      subsectionIds: [ 'about-platform-values', 'about-platform-vision', 'about-platform-beliefs' ]
      expandible: true
    }
  ]

contentForSlug = (props, slug) ->
  props?.data?.pages?.posts
    .filter((page) -> page.slug is slug)[0]

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
