app.factory('dataService',  ['$http', 'authService', '$q', function($http, authService, $q) {

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

  var getProducts = function() {
    return $http.get('/api/products')
      .then(function(result) {
        return result;
      }, function(reason) {
        return reason;
      })
    }

  return {
    getProfile : getProfile,
    createProduct : createProduct,
    getProducts : getProducts
  };


}]);
