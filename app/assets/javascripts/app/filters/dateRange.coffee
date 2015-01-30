app.filter 'dateRange', ['$filter', ($filter) ->
  (finishDate, startDate) ->
    dateFilter = $filter('date')
    if finishDate? && finishDate != ""
      formattedFinish = dateFilter(finishDate, 'MMMM yyyy')
      if startDate? && startDate != ""
        dateFilter(startDate, 'MMMM - ') + formattedFinish
      else
        formattedFinish
    else
      ""
]