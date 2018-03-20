angular.module('TodoApp').directive 'projectEdit', () ->
  restrict: 'E'
  templateUrl: 'projects/_edit.html'
  scope:
    project: '='
    projects: '='
    edit: '='
  link: (scope, elem) ->
    scope.disableEdit = () ->
      scope.edit = false
    scope.cancel = () ->  
      scope.project.title = scope.beforeEdit.title
      scope.disableEdit()