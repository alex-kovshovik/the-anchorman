//= require angular
//= require angular-resource
//= require angular-ui-router
//= require angular-rails-templates

//= require_tree ./html

//= require_self

//= require_tree ./directives
//= require_tree ./services

//= require home.controller

angular
    .module("theAnchorman", ['ui.router', 'templates', 'ngResource'])
    .config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('home', {
              url: '/home',
              templateUrl: 'html/_home.html',
              controller: 'HomeController'
            });

        $urlRouterProvider.otherwise('home');
      }]);
