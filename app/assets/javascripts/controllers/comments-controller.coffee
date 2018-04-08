CommentsController = (Comment, $state, $scope, $filter, Flash, Upload) ->
  ctrl = @
  ctrl.withAttachment = false
  
  ctrl.create = (form, task) ->
    if form.$valid
      comment = if ctrl.withAttachment
        ctrl.upload(form, task)
      else  
        Comment.create({ title: form.title.$modelValue, task_id: task.id})
      
      comment    
        .success (resp) ->
          task.comments.push(resp)
        .error (resp) ->
          Flash.create 'warning', resp.error
        
  ctrl.delete = (task, comment) ->
    Comment.delete(comment.id)
      .success (resp) ->
        index = task.comments.indexOf($filter('filter')(task.comments, id: comment.id)[0])
        task.comments.splice(index, 1)
      .error (resp) ->
        Flash.create 'warning', resp.error

  ctrl.setAttachment = (file) ->
    ctrl.withAttachment = true

  ctrl.upload = (form, task) ->  
    Upload.upload
      url: '/api/comments' 
      method: 'POST'
      file: form.attachment.$modelValue
      fields: 
        comment: 
         attachment: form.attachment.$modelValue, 
         title: form.title.$modelValue,
         task_id: task.id 
      fileFormDataName: 'comment[attachment]'

angular.module('TodoApp').controller 'CommentsController', [
  'Comment',
  '$state',
  '$scope',
  '$filter',
  'Flash',
  'Upload'
  CommentsController
]