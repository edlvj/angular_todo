Project = ($http) ->
    {
      all: ->
        $http.get '/api/projects'
      create: (form) ->
        $http.post '/api/projects', project: form
      update: (id, form) ->
        $http.put '/api/projects/' + id, project: form
      delete: (id) ->
        $http.delete '/api/projects/' + id
    }
angular.module('TodoApp').factory 'Project', ['$http', Project]