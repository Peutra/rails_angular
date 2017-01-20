app.controller('registerCtrl', ['$scope', 'authService', '$location', function($scope, authService, $location) {
    var vm = this;
    vm.credentials = {
      pseudonym : "",
      email : "",
      password : ""
    };
    vm.onSubmit = function () {
      authService
        .register(vm.credentials)
        .catch(function(err){
          
        })
        .then(function(){
          $location.path('home')
        });
    };
}])