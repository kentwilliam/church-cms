{ createComponent, sectionContent, asset } = @Helpers
{ div, img, h1 } = React.DOM

createComponent 'Page',
  render: ->
    { section } = @props
    spec = sectionContent @props

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
        div className: "page-content", dangerouslySetInnerHTML: { __html: spec.content }
      ]
