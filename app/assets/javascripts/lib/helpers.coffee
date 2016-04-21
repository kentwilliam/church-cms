@Helpers ?= {}

@Helpers.createComponent = (name, spec) ->
  @Components ||= {}
  @Components[name] = React.createFactory React.createClass spec

# Extracts the data for a given section id

@Helpers.contentForSlug = (props, slug) ->
  props?.data?.pages?.posts
    .filter((page) -> page.slug is slug)[0]

@Helpers.CssTransition = React.createFactory React.addons.CSSTransitionGroup

@Helpers.DAYS =
  Sunday: 0
  Monday: 1
  Tuesday: 2
  Wednesday: 3
  Thursday: 4
  Friday: 5
  Saturday: 6

# Complete map of the site
@Helpers.SECTIONS =
  "/":
    id: 'home'
    title: "Home"
  "/new":
    id: 'new'
    title: "I'm New"
    theme: 'light-gray'
  "/about":
    id: 'about'
    title: "About Us"
    theme: 'red'
  "/community":
    id: 'community'
    title: "Community"
    theme: 'dark-gray'
  "/volunteer":
    id: 'volunteer'
    title: "Volunteer"
    theme: 'light-gray'
  "/calendar":
    id: 'calendar'
    title: "What's happening?"
    theme: 'white'
  "/follow":
    id: 'follow'
    title: "Watch & Listen"
    theme: 'dark-gray'
  "/give":
    id: 'give'
    title: "Give"
    theme: 'red'

MAIN_MENU = [
  "/",
  "/new",
  "/about",
  "/community",
  "/volunteer",
  "/follow",
  "/give"
]

@Helpers.MAIN_MENU = _.map MAIN_MENU, (path) => _.extend {}, @Helpers.SECTIONS[path], { path }
