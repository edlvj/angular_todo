angular.module('TodoApp').config((FlashProvider) ->
  FlashProvider.setTimeout(0)
  FlashProvider.setTemplate('<div class="{{flash.type}}"><i class="fa fa-exclamation-circle" ng-if=\'flash.type=="warning"\'></i><p ng-bind-html="flash.text"></p></div>');
)