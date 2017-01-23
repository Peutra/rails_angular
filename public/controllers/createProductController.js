app.controller('createProductCtrl', [ '$scope', 'authService', 'dataService', '$state', '$rootScope', '$location', function($scope, authService, dataService, $state, $rootScope, $location) {
  var vm = this;

  vm.product = {
    first_name : "",
    last_name : "",
    description : "",
    value : 0,
    for_sale : false,
    user_id : null
  };

  vm.createProduct = function () {
    console.log(vm.product)
    dataService
    .createProduct(vm.product)
    .catch(function(err){
      console.log(err)
    })
    .then(function() {
      $state.go('home')
    });
  };

}]);
