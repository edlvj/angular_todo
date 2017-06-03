angular.module('TodoApp').directive 'projectShow', () ->
  restrict: 'E'
  controller: 'ProjectsController'
  controllerAs: 'projects'
  templateUrl: 'projects/show.html'
  bindToController: true