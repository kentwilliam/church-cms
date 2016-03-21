createComponent = (name, spec) ->
  @Components ||= {}
  @Components[name] = React.createFactory React.createClass spec

# Not currently in use
# capitalizeFirst = (string) ->
#   (string.charAt 0).toUpperCase() + string.slice 1

# Extracts the data for a given section id
sectionContent = (props) ->
  return unless sectionId = props?.section?.id

  props?.data?.pages?.posts
    .filter((page) -> page.slug is sectionId)[0]

CssTransition = React.createFactory React.addons.CSSTransitionGroup

# Complete map of the site
SECTIONS =
  "/":          { id: 'home',      title: "Home" }
  "/new":       { id: 'new',       title: "I'm New",           theme: 'light-gray' }
  "/about":     { id: 'about',     title: "About Us",          theme: 'red' }
  "/community": { id: 'community', title: "Community",         theme: 'dark-gray' }
  "/volunteer": { id: 'volunteer', title: "Volunteer",         theme: 'light-gray' }
  "/calendar":  { id: 'calendar',  title: "What's happening?", theme: 'white' }
  "/follow":    { id: 'follow',    title: "Watch & Listen",    theme: 'dark-gray' }
  "/give":      { id: 'give',      title: "Give",              theme: 'red' }

@Helpers = { createComponent, sectionContent, CssTransition, SECTIONS }
