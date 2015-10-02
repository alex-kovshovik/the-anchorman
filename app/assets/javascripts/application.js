//= require angular
//= require angular-ui-router
//= require angular-rails-templates

//= require_tree ./home

//= require_self
//= require home_controller

angular
    .module("theAnchorman", ['ui.router', 'templates'])
    .config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('home', {
              url: '/home',
              templateUrl: 'home/_home.html',
              controller: 'HomeController'
            });

        $urlRouterProvider.otherwise('home');
      }]);

