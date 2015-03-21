app.controller 'AboutMeCtrl',
  ['$animate', ($animate) ->
    $animate.removeClass('#animation-overlay', 'fade-out')
  ]