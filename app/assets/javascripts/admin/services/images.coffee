admin.factory 'Images',
  ['$resource', '$upload', ($resource, $upload) ->
    resource = $resource('/api/v1/projects/:project_id/images/:id',
      {
        project_id: '@projectId'
        id: '@id'
      },
      {
        update: 'PATCH'
      }
    )

    {
      create: (projectId) ->
        resource.save(
          projectId: projectId
        ).$promise
      update: (projectId, imageId, image) ->
        resource.update(
          projectId: projectId,
          id: imageId,
          image: image
        ).$promise
      upload: (projectId, imageId, file) ->
        $upload.upload({
          url: "/api/v1/projects/#{projectId}/images/upload/#{imageId}"
          file: file
        })
      destroy: (projectId, imageId) ->
        resource.delete(
          projectId: projectId,
          id: imageId,
        ).$promise
    }
  ]