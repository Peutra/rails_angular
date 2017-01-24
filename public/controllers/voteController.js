app.controller('voteCtrl', ['authService', 'dataService', '$scope', function(authService, dataService, $scope) {

  $scope.vote = function(product_id) {
    console.log(authService.currentUser())
    if (authService.isLoggedIn())
      dataService.voteFor(authService.currentUser().id, product_id)
      .then(function(result) {
        return result
      }, function(reason) {
        return reason
      })
  }

}])
