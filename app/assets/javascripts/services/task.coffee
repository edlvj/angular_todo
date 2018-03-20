Task = ($http) ->
    {
      create: (form) ->
        $http.post '/api/tasks', task: form
      update: (id, form) ->
        $http.put '/api/tasks/' + id, task: form
      delete: (id) ->
        $http.delete '/api/tasks/' + id
    }
angular.module('TodoApp').factory 'Task', ['$http', Task]