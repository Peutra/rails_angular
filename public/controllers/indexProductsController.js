app.controller('indexProductsCtrl', ['$scope', 'dataService', function($scope, dataService) {
     dataService.getProducts().then(function(response) {
       console.log(response)
       if (response.data) {
         $scope.products = response.data.products
       } else {
         $scope.products = "Pas encore de produits !"
       }
     }, function(error) {
       console.log(error)
     })
}])
