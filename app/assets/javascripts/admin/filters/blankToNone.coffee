admin.filter 'blankToNone', ->
  (input) ->
    if input? && input != ""
      input
    else
      "none"