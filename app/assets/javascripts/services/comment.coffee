Comment = ($http, Upload) ->
    {
      create: (form, task_id) ->
        $http.post '/api/comments', comment: title: form.title, task_id: task_id
      delete: (id) ->
        $http.delete '/api/comments/' + id
      update: (id, file) ->
        Upload.upload
          url: '/api/comments/' + id 
          method: 'PUT'
          file: file
          fields: comment: attachment: file
          fileFormDataName: 'comment[attachment]'
          
    }
angular.module('TodoApp').factory 'Comment', ['$http', 'Upload', Comment]