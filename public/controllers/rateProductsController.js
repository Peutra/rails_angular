app.controller('rateProductCtrl', ['authService', 'dataService', '$scope', '_', function(authService, dataService, $scope, _) {

  $scope.rateProduct = function(product_id, rate) {
    if (authService.isLoggedIn())
      dataService.ratingProduct(authService.currentUser().id, product_id, rate)
      .then(function(result) {
        dataService.currentRateProduct(product_id).then(function(result) {          
          id = _.findIndex($scope.products, { id: parseInt(result.data.product_id) });
          $scope.products[id].average = result.data.current_rate
        })
        return result
      }, function(reason) {
        return reason
      })
  }

}])
