admin.factory 'Projects',
  ['$resource', ($resource) ->
    resource = $resource(
      '/api/v1/admin/projects/:id'
      {
        id: '@id'
      },
      {
        update: {method: 'PATCH'}
      }
    )

    {
      all: ->
        resource.query().$promise

      find: (id) ->
        resource.get(
          id: id
        ).$promise

      create: (project) ->
        resource.save(
          project: project
        ).$promise

      update: (id, project) ->
        resource.update(
          id: id
          project: project
        ).$promise

      destroy: (id) ->
        resource.delete(
          id: id
        ).$promise
    }
  ]
