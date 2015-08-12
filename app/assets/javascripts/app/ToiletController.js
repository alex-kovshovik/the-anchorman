(function(){

  angular
      .module('toilets')
      .controller('ToiletController', [
        'toiletService', '$mdSidenav', '$mdBottomSheet', '$log', '$scope',
        ToiletController
      ]);

  /**
   * Main Controller for the TDS App
   * @param $scope
   * @param $mdSidenav
   * @param avatarsService
   * @constructor
   */
  function ToiletController( toiletService, $mdSidenav, $mdBottomSheet, $log, $scope ) {
    var self = this;

    self.selected     = null;
    self.toilets      = [ ];
    self.selectToilet = selectToilet;
    self.toggleList   = toggleToiletsList;
    self.share        = share;

    // Load all registered toilets
    toiletService
        .loadAllToilets()
        .then( function( toilets ) {
          self.toilets  = [].concat(toilets);
          self.selected = toilets[0];
        });

    // *********************************
    // Internal methods
    // *********************************

    /**
     * Hide or Show the 'left' sideNav area
     */
    function toggleToiletsList() {
      $mdSidenav('left').toggle();
    }

    /**
     * Select the current avatars
     * @param menuId
     */
    function selectToilet ( toilet ) {
      self.selected = angular.isNumber(toilet) ? $scope.toilets[toilet] : toilet;
      self.toggleList();
    }

    /**
     * Show the bottom sheet
     */
    function share($event) {
      var toilet = self.selected;

      $mdBottomSheet.show({
        parent: angular.element(document.getElementById('content')),
        templateUrl: '/view/contactSheet.html',
        controller: [ '$mdBottomSheet', ToiletSheetController],
        controllerAs: "vm",
        bindToController : true,
        targetEvent: $event
      }).then(function(clickedItem) {
        $log.debug( clickedItem.name + ' clicked!');
      });

      /**
       * Bottom Sheet controller for the Avatar Actions
       */
      function ToiletSheetController( $mdBottomSheet ) {
        this.toilet = toilet;
        this.items = [
          { name: 'Phone'       , icon: 'phone'       , icon_url: 'images/svg/phone.svg'},
          { name: 'Twitter'     , icon: 'twitter'     , icon_url: 'images/svg/twitter.svg'},
          { name: 'Google+'     , icon: 'google_plus' , icon_url: 'images/svg/google_plus.svg'},
          { name: 'Hangout'     , icon: 'hangouts'    , icon_url: 'images/svg/hangouts.svg'}
        ];
        this.performAction = function(action) {
          $mdBottomSheet.hide(action);
        };
      }
    }

  }

})();