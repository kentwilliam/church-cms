# The Router is responsible for routing the user to view the correct part of
# the site.
#
# Most of the actual routing is handled by the Page.js library--the
# function of the Router component is mainly to set up page to work with react,
# so that every time the user navigates, RootContainer gets updated with new
# props (properties) describing the new routing information, i.e. which section
# and page to show.

{ SECTIONS } = @Helpers
{ RootContainer } = @Components

# The router ensures that we update the page once the user navigates
@Router = React.createClass
  getInitialState: ->
    path: @props.path or "/"

  componentWillMount: ->
    # The router does not run server side
    unless page = window.page
      return

    # Whenever the user clicks on a link, update the section
    for sectionPath, sectionDetails of SECTIONS
      # (do => =>) means `sectionPath` is stored with the closure here
      page sectionPath, do (sectionPath) =>
        =>
          @setState path: sectionPath
          return false

    # 404 not found
    page '*', ->
      # TODO
      console.log "Not found"

    # Start tracking user clicks
    page.start()

  render: ->
    RootContainer
      section: SECTIONS[@state.path]
      data: @props.wordpressResources
