{ createComponent } = @Helpers
{ div, h2, form, label, input, a, p } = React.DOM

createComponent 'Newsletter',
  render: ->
    div
      className: 'home-section newsletter'
      children: div className: 'content', children: [
        h2 children: 'Yes, I want to stay up-to-date!'
        @form()
        @followUs()
      ]

  form: ->
    form
      action: '//citylifesf.us3.list-manage.com/subscribe/post?u=12be4da703d28ef426711f8d6&amp;id=9ed98fa311'
      method: 'post'
      id: 'mc-embedded-subscribe-form'
      name: 'mc-embedded-subscribe-form'
      className: 'validate'
      children: @fields()

  fields: ->
    [
      label htmlFor: 'mce-EMAIL', children: 'Email Address'
      input type: 'email', name: 'EMAIL', className: 'required email', id: 'mce-EMAIL', placeholder: 'name@email.com'
      div
        style: position: 'absolute', left: '-5000px'
        ariaHidden: true
        children: input type: 'text', name: 'b_12be4da703d28ef426711f8d6_9ed98fa311', tabIndex: '-1', value: ''
      input
        type: 'submit'
        value: 'Send Me Updates!'
        name: 'subscribe'
        id: 'mc-embedded-subscribe'
      #a
        #className: 'view-previous-newsletters'
        #href: 'http://us3.campaign-archive1.com/home/?u=12be4da703d28ef426711f8d6&id=9ed98fa311'
        #title: 'View previous newsletters'
        #children: 'View previous newsletters'
    ]

  followUs: ->
    p children: [
      'You can also follow us on '
      a children: 'Facebook', href: 'https://www.facebook.com/citylifeSF/'
      ', '
      a children: 'Twitter', href: 'https://twitter.com/citylifesf'
      ', and '
      a children: 'Instagram', href: 'https://www.instagram.com/citylifesf/'
      ', or you can '
      a children: 'email', href: 'mailto:jonathan@citylifesf.com'
      ' us directly.'
    ]
