Comment = ($http) ->
    {
      create: (form) ->
        $http.post '/api/comments', comment: form
      delete: (id) ->
        $http.delete '/api/comments/' + id
    }
angular.module('TodoApp').factory 'Comment', ['$http', Comment]