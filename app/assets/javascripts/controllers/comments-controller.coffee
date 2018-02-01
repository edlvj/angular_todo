CommentsController = (Comment, $state, $scope, $filter, Flash) ->
  ctrl = @
  
  ctrl.create = (form, task) ->
    Comment.create(form, task.id)
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
        
  ctrl.update = (task, comment, file) ->
    Comment.update(comment.id, file)
      .success (resp) ->
        index = task.comments.indexOf($filter('filter')(task.comments, id: comment.id)[0])
        task.comments[index] = resp
      .error (resp) ->
        Flash.create 'warning', resp.error
    
  return

angular.module('TodoApp').controller 'CommentsController', [
  'Comment',
  '$state',
  '$scope',
  '$filter',
  'Flash',
  CommentsController
]