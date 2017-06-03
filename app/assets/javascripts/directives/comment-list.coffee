angular.module('TodoApp').directive 'commentList', () ->
  restrict: 'E'
  controller: 'CommentsController'
  controllerAs: 'comments'
  templateUrl: 'comments/_list.html'
  scope:
    project: '=' 
    task: '='