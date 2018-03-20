angular.module('TodoApp').directive 'projectNew', () ->
  restrict: 'E'
  templateUrl: 'projects/_new.html'
  scope:
    project: '='
    projects: '='
  link: (scope, elem) ->
    scope.cancel = () ->  
      scope.project = {}