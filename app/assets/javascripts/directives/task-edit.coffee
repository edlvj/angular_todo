angular.module('TodoApp').directive 'taskEdit', () ->
  restrict: 'E'
  templateUrl: 'tasks/_edit.html'
  scope:
    project: '='
    task: '='
    tasks: '='
    edit: '='
  link: (scope, elem) ->
    scope.disableEdit = () ->
      scope.edit = false
    scope.cancel = () ->
      scope.editTask.title = scope.beforeEdit.title
      scope.disableEdit()