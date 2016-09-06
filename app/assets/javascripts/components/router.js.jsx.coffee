# The Router is responsible for routing the user to view the correct part of
# the site.
#
# Page.js itself takes care of handling route changes and making links not
# refresh the page when clicked. The Router component's only job is to
# initialize page, and make it update the React app whenever something changed.
#
# The result is that every time the user clicks an internal link (i.e. to
# another page on the site), RootContainer gets updated with new props
# describing which section is now the active section
#
# The sections themselves live in @Helpers.SECTIONS since they are also
# referenced by other components.

{ SECTIONS } = @Helpers
{ RootContainer } = @Components

# The router ensures that we update the page once the user navigates
@Router = React.createClass
  # If the app is rendered server-side, we will be given the current path in
  # props.path
  getInitialState: ->
    path: @props.path or "/"

  componentWillMount: ->
    # The router is only needed when the app is running in client-side mode
    unless page = window.page
      return

    # Whenever the user clicks on a link, update the section
    for sectionPath, sectionDetails of SECTIONS
      page sectionPath, @createRouteHandlerForPath sectionPath

    page '/westcampus', '/'
    page '*', @on404NotFound

    # Start tracking user clicks
    page.start()

  render: ->
    RootContainer
      section: SECTIONS[@state.path]
      data: @props.wordpressResources

  createRouteHandlerForPath: (path) ->
    # We return a handler that is set up to set the state to the given path
    =>
      @setState { path }
      # Return false to cancel propagation and default event handling
      return false

  on404NotFound: ->
    # TODO
    console.log "Not found"
