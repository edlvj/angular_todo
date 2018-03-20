angular.module('TodoApp').directive 'projectList', () ->
  restrict: 'E'
  templateUrl: 'projects/_list.html'
  scope:
    projects: '='