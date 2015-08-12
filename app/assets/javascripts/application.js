//= require 'app/Toilets'
//= require 'app/ToiletController'
//= require 'app/ToiletService'
//
//= require_self

angular
    .module('starterApp', ['ngMaterial', 'ngResource', 'toilets'])
    .config(function( $mdIconProvider, $mdThemingProvider ) {
      // Configure the app to use "shitty" theme.
      $mdThemingProvider.theme('default')
          .primaryPalette('deep-orange')
          .accentPalette('red');

      // Register the toilet `avatar` icons
      $mdIconProvider
          .defaultIconSet("./images/svg/avatars.svg", 128)
          .icon("menu", "./images/svg/menu.svg", 24)
          .icon("share", "./images/svg/share.svg", 24)
          .icon("google_plus", "./images/svg/google_plus.svg" , 512)
          .icon("hangouts"   , "./images/svg/hangouts.svg"    , 512)
          .icon("twitter"    , "./images/svg/twitter.svg"     , 512)
          .icon("phone"      , "./images/svg/phone.svg"       , 512);
    })
    .run(function($log){
      //$log.debug("starterApp + ngMaterial running...");
    });
