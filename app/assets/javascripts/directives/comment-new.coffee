angular.module('TodoApp').directive 'commentNew', () ->
  restrict: 'E'
  controller: 'CommentsController'
  controllerAs: 'comments'
  templateUrl: 'comments/_new.html'
  scope:
    project: '='
    task: '='
    modal: '='
  link: (scope, elem) ->
    scope.cancel = () ->
      scope.comment = {}
      scope.modal.close()  