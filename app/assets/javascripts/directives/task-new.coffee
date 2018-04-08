angular.module('TodoApp').directive 'taskNew', () ->
  restrict: 'E'
  controller: 'TasksController'
  controllerAs: 'tasks'
  templateUrl: 'tasks/_new.html'
  scope:
    project: '='
    task: '='
  link: (scope, elem) ->
    scope.cancel = () ->  
      scope.task = {}  