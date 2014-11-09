admin.factory 'Categories',
  ['$resource', '$upload', ($resource) ->
    resource = $resource('/api/v1/admin/categories/:category_id',
      {
        category_id: '@categoryId'
      }, {}
    )

    {
      all: ->
        resource.query().$promise
      create: (category) ->
        resource.save(
          category: category
        ).$promise
      destroy: (categoryId) ->
        resource.delete(
          categoryId: categoryId
        ).$promise
    }
  ]