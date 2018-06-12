---
---

$ ->
  clearIncidents = ->
    $('#sp-incidents').innerHTML = ''

  updateIncidents = (incidents) ->
    if $(incidents).length
      for incident in incidents
        li = $('<li class="' + incident.status + '"></li>').html('<strong>' + incident.status + '</strong> ' + incident.name + '. <a target="_blank" href="' + incident.shortlink + '">View details</a>' )
        $('#sp-incidents').append(li)
    else
      clearIncidents()

  setStatus = (status) ->
    p = $('<p></p>').addClass(status.indicator).text(status.description)
    $('#sp-status').append(p)

  updateStatusPageBlock = ->
    sp.incidents
      filter : 'unresolved',
      success: (data) ->
        updateIncidents(data.incidents)
    sp.status
      success: (data) ->
        setStatus(data.status)

  sp = new StatusPage.page({ page : 't4s7kx6qh253' })
  updateStatusPageBlock()

  # Scroll page to correct element

  getAnchorSelector = (hash) ->
    anchor = hash.substring(1)
    if !anchor.match(/^algolia:/)
      false
    decodeURI anchor.replace(/^algolia:/, '')

  scrollPageToSelector = (selector) ->
    target = $('.page,.post').find(selector)
    targetOffset = target[0].getBoundingClientRect().top + window.pageYOffset - 20
    window.setTimeout (->
      window.scroll 0, targetOffset
    ), 100

  onLinkClick = (event) ->
    selector = getAnchorSelector(event.target.hash)
    # Normal link, going to another page
    if event.target.pathname != window.location.pathname or !selector
      true
    # Scrolling to a result on the same page
    hideResults()
    scrollPageToSelector selector
    event.preventDefault()
    false

  'use strict'

  # Algolia

  # Handle typing query
  showResults = ->
    window.scroll 0, 0
    $initialContent.addClass 'algolia__initial-content--hidden'
    $searchContent.addClass 'algolia__search-content--active'
    return

  hideResults = ->
    $initialContent.removeClass 'algolia__initial-content--hidden'
    $searchContent.removeClass 'algolia__search-content--active'
    return

  onQueryChange = (e) ->
    lastQuery = $(e.target).val()
    if lastQuery.length == 0
      hideResults()
      return false
    showResults()

  search = instantsearch(
    appId: 'KFSVJ5X7PP'
    indexName: 'articles'
    apiKey: 'f9991e202b3921d0cc363451afc76645')

  search.addWidget instantsearch.widgets.searchBox(
    container: '#search-searchbar'
    placeholder: 'Search help docs')

  search.addWidget instantsearch.widgets.hits(
    container: '#search-hits'
    templates: {
      item: document.getElementById('hit-template').innerHTML
    })

  # Content to hide/show when searching
  $initialContent = $('.js-algolia__initial-content')
  $searchContent = $('.js-algolia__search-content')
  $searchContentResults = $searchContent.find('#search-hits')
  $searchContentResults.on 'click', 'a', onLinkClick

  # Starting the search
  $(document).ready ->
    search.start()

    # Input listening for queries
    $searchInput = $('.ais-search-box--input')
    $searchInput.on 'keyup', onQueryChange

  window.setTimeout (->
    selector = getAnchorSelector(window.location.hash)
    if selector
      scrollPageToSelector selector
  ), 100

  #Responsive Header
  $('.nav-menu-toggle').on 'click', (e) ->
    e.preventDefault()
    textcont = $('.nav-menu-toggle').text().trim()
    if textcont == 'Menu'
      $('#menu-marketing-navbar-right').slideDown()
      $('.nav-menu-toggle a').text 'Close'
    else if textcont == 'Close'
      $('#menu-marketing-navbar-right').slideUp()
      $('.nav-menu-toggle a').text 'Menu'
      $('#menu-marketing-navbar-right').addClass 'slid'

  $(window).resize ->
    if $('.nav-menu-toggle a').text() == 'Menu'
      $('#menu-marketing-navbar-right').removeAttr 'style'