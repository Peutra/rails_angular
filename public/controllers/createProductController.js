app.controller('createProductCtrl', [ '$scope', 'authService', 'dataService', '$state', '$location', function($scope, authService, dataService, $state, $location) {
  var vm = this;

  vm.product = {
    first_name : "",
    last_name : "",
    description : "",
    start_value : 0,
    for_sale : false,
    picture: []
  }

  vm.createProduct = function () {
    if (authService.isLoggedIn())
    dataService
    .createProduct(vm.product)
    .catch(function(err){
      console.log(err)
    })
    .then(function() {
      $state.go('products')
    })
  }

}])
