app.factory 'Projects',
  ['$resource', ($resource) ->
    resource = $resource(
      '/api/v1/projects/:id'
      {
        id: '@id'
      }
    )
    {
      all: ->
        resource.query().$promise

      find: (id) ->
        resource.get(
          id: id
        ).$promise
    }
  ]