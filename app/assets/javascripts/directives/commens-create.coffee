angular.module('TodoApp').directive 'commentCreate', () ->
  restrict: 'E'
  controller: 'CommentsController'
  controllerAs: 'comments'
  templateUrl: 'comments/_new.html'
  scope:
    project: '=' 
    task: '='