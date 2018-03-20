angular.module('TodoApp').directive 'taskEdit', () ->
  restrict: 'E'
  templateUrl: 'tasks/_edit.html'
  scope:
    task: '='
    tasks: '='
    edit: '='
  link: (scope, elem) ->
    scope.disableEdit = () ->
      scope.edit = false