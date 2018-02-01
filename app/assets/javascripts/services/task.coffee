Task = ($http) ->
    {
      all: ->
        $http.get '/api/tasks'
      create: (form) ->
        $http.post '/api/tasks', task: form
      update: (id, form) ->
        $http.put '/api/tasks/' + id, task: form
      delete: (id) ->
        $http.delete '/api/tasks/' + id
      sort: (id) ->
        $http.post '/api/tasks/sort'
    }
angular.module('TodoApp').factory 'Task', ['$http', Task]