app.controller('rateProductCtrl', ['authService', 'dataService', '$scope', function(authService, dataService, $scope) {

  $scope.rateProduct = function(product_id, rate) {
    if (authService.isLoggedIn())
      dataService.ratingProduct(authService.currentUser().id, product_id, rate)
      .then(function(result) {
        return result
      }, function(reason) {
        return reason
      })
  }

}])
