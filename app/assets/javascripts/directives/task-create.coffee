angular.module('TodoApp').directive 'taskCreate', () ->
  restrict: 'E'
  controller: 'TasksController'
  controllerAs: 'tasks'
  templateUrl: 'tasks/_new.html'
  scope:
    project: '='