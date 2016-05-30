{ createComponent, contentForSlug, asset, SECTION_CONTENT_BY_ID } = @Helpers
{ div, img, h1, h2, button } = React.DOM
{ Home, Footer } = @Components

createComponent 'Page',
  render: ->
    { section } = @props
    spec = advancedContent @props

    unless spec?.title and spec?.content
      spec =
        title: section.title
        content: 'Content coming soon …'

    props =
      className: "page page-#{section.id}"
      children: [
        div className: "background"
        if section.id is 'home'
          div className: 'page-content', children: Home @props
        else
          [
            div
              className: "page-hero"
              style: backgroundImage: "url('#{asset(section.id)}')"
              children: h1 children: section.title
            div className: "page-content", children: spec.content
          ]
        Footer activeSection: @props.section
      ]

    if typeof window?.onscroll isnt 'undefined'
      props.onScroll = @onScroll
      props.ref = @getRef

    div props

  getRef: (domNode) ->
    @domNode = domNode

  onScroll: ->
    @props.onScroll? @domNode.scrollTop

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
