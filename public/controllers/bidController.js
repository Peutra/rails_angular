app.controller('bidCtrl', [ '$scope', 'authService', 'dataService', '$state', '$location', function($scope, authService, dataService, $state, $location) {

  var end_auto_date = new Date();
  var date = new Date();
  $scope.date = date
  $scope.end_auto_date = end_auto_date;
  $scope.month = ['Januar', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  $scope.monthShort = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  $scope.weekdaysFull = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  $scope.weekdaysLetter = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  $scope.today = 'Today';
  $scope.clear = 'Clear';
  $scope.close = 'Close';
  var days = 15;
  $scope.timeLeft = (new Date($scope.$parent.product.end_bid_date) - date) / (1000 * 60 * 60 * 24)
  $scope.minDate = (new Date($scope.date)).toISOString()

  $scope.bid = {

  }

  $scope.createBid = function(product_id, bid) {
    if (authService.isLoggedIn())
      dataService.placeBid(product_id, bid, authService.currentUser().id)
      .catch(function(err){
        console.log(err)
      })
      .then(function() {
        $state.go('products')
      })
  }

}])
