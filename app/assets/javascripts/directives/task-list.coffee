angular.module('TodoApp').directive 'taskList', () ->
  restrict: 'E'
  controller: 'TasksController'
  controllerAs: 'tasks'
  templateUrl: 'tasks/_list.html'
  scope:
    project: '='
  link: (scope, elem) ->
    scope.showComments = ($event) ->
      elem = $($event.target).parent().parent().parent()
      elem.find('.row.well').toggleClass 'hidden'
      return
    scope.$watch 'task.done', ((newValue, oldValue) ->
      return
    ), true  
      
    return  