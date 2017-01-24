app.controller('voteCtrl', ['authService', 'dataService', '$scope', function(authService, dataService, $scope) {

  if ($scope.hasVotted === undefined) {
    if (authService.isLoggedIn())
     dataService.getUserVote(authService.currentUser().id)
     .then(function(result) {
       $scope.hasVotted = result.data.current_vote
       return result
     }, function(reason) {
       return reason
     })
  }

  $scope.vote = function(product_id) {
    if (authService.isLoggedIn())
      dataService.voteFor(authService.currentUser().id, product_id)
      .then(function(result) {
        $scope.hasVotted = product_id
        return result
      }, function(reason) {
        return reason
      })
  }

}])
