app.factory('dataService',  ['$http', 'authService', function($http, authService) {

  var getProfile = function () {
      return $http.get('/api/profile', {
        headers: {
          Authorization: 'Bearer '+ authService.getToken()
      }
    })
  }

  var createProduct = function(product) {
    return $http.post('/api/products', product, {
      headers: {
        Authorization: authService.getToken()
      }
    }).then(function(response) {
      console.log(response)
    })
  }

  return {
    getProfile : getProfile,
    createProduct : createProduct
  };


}]);
