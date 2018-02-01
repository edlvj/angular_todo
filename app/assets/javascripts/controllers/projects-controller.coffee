ProjectsController = (Project, $stateParams, $state, $scope, $uibModal, $filter, Flash) ->
  ctrl = @
  ctrl.all = []

  ctrl.index = () ->
    Project.all()
      .success (resp) ->
        ctrl.all = resp
      .error (resp) ->
        Flash.create 'warning', resp
        
  ctrl.new = () ->
    ctrl.new_modal = $uibModal.open
      templateUrl: 'project_form.html'
      size: 'md'
      controller: ($scope) ->
        $scope.projectForm = {}
        $scope.submitForm = (form) ->
          ctrl.create(form)
          ctrl.new_modal.close()
    
  ctrl.create = (form) ->
    Project.create(form)
      .success (resp) ->
        ctrl.all.push(resp)
      .error (resp) ->
        Flash.create 'warning', resp.data.error
   
  ctrl.edit = (project) ->
    ctrl.edit_modal = $uibModal.open
      templateUrl: 'project_form.html'
      size: 'md'
      controller: ($scope) ->
        $scope.projectForm = project
        $scope.submitForm = (form) ->
          ctrl.update(project.id, form)
          ctrl.edit_modal.close()
   
  ctrl.update = (project_id, form) ->
    Project.update(project_id, form)
      .success (resp) ->
        index = ctrl.all.indexOf($filter('filter')(ctrl.all, id: project_id)[0]) 
        ctrl.all[index].title = form.title
      .error (resp) ->
        Flash.create 'warning', resp.data.error
        
  ctrl.delete = (project_id) ->
    Project.delete(project_id)
      .success (resp) ->
        index = ctrl.all.indexOf($filter('filter')(ctrl.all, id: project_id)[0])
        ctrl.all.splice(index, 1)
      .error (resp) ->
        Flash.create 'warning', resp.data.error
  
  ctrl.index()
  
  return

angular.module('TodoApp').controller 'ProjectsController', [
  'Project',
  '$stateParams',
  '$state',
  '$scope',
  '$uibModal',
  '$filter',
  'Flash',
  ProjectsController
]