admin.factory 'Images',
  ['$resource', '$upload', ($resource, $upload) ->
    resource = $resource('/api/v1/admin/projects/:projectId/images/:id',
      {
        projectId: '@projectId'
        id: '@id'
      },
      {
        update: 'PATCH'
      }
    )

    {
      update: (projectId, image) ->
        resource.update(
          projectId: projectId
          id: image.id
          image: image
        ).$promise
      upload: (projectId, file) ->
        $upload.upload({
          url: "/api/v1/admin/projects/#{projectId}/images"
          method: 'POST'
          file: file
        })
      destroy: (projectId, image) ->
        resource.delete(
          projectId: projectId
          id: image.id
        ).$promise
    }
  ]