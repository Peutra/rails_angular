app.controller('indexProductsCtrl', ['$scope', 'dataService', function($scope, dataService) {
     dataService.getProducts().then(function(response) {
       console.log(response)
     }, function(error) {
       console.log(error)
     })
}])
