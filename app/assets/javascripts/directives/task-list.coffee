angular.module('TodoApp').directive 'taskList', () ->
  restrict: 'E'
  controller: 'TasksController'
  controllerAs: 'tasks'
  templateUrl: 'tasks/_list.html'
  scope:
    project: '='
  link: (scope, elem) ->
    scope.activeDate = (task) ->
      new Date(task.deadline) > new Date()