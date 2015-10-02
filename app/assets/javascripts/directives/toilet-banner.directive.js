angular.module('theAnchorman')
.directive('toiletBanner', function() {
  return {
    restrict: 'E',
    scope: { toilet: '=' },
    templateUrl: 'html/direct/_toilet-banner.html'
  };
});
