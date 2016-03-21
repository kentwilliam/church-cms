{ createComponent, sectionContent } = @Helpers
{ div, img } = React.DOM

createComponent 'Page',
  render: ->
    spec = sectionContent @props

    unless spec?.title and spec?.content
      spec =
        title: @props.section.title
        content: 'Content coming soon …'

    console.log @props.section.id

    div
      className: "page theme-#{@props.section.theme}"
      children: [
        div className: "background"
        div className: "page-content", dangerouslySetInnerHTML: { __html: spec.content }
      ]
