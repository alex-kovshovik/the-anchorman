angular.module("theAnchorman")
.controller('HomeController', ['$scope', '$resource', function($scope, $resource) {
  var Toilet = $resource('/toilets/1');
  $scope.defaultToilet = Toilet.get(1);  // Default toilet :)
}]);
