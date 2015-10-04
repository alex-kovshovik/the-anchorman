angular.module('theAnchorman')
.directive('toiletBanner', ['$sce', 'ToiletStatus', function($sce, ToiletStatus) {
  return {
    restrict: 'E',
    scope: {
      toilet: '='
    },
    templateUrl: 'html/direct/_toilet-banner.html',
    link: function(scope, element, attrs) {
      scope.toilet.$promise.then(function(toilet) {
        if (toilet) {
          scope.statusText = $sce.trustAsHtml(ToiletStatus.text(toilet));
          scope.iconClass = ToiletStatus.iconClass(toilet);
        }
      });
    }
  };
}]);
