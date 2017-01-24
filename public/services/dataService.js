app.factory('dataService',  ['$http', 'authService', '$q', function($http, authService, $q) {

  var getProfile = function () {
      return $http.get('/api/profile', {
        headers: {
          Authorization: 'Bearer '+ authService.getToken()
      }
    })
  }

  var createProduct = function(product) {
    var fd = new FormData
    for(var key in product)
      fd.append(key, product[key])

    return $http.post('/api/products', fd, {
      transformRequest: angular.identity,
      headers: {
        'Content-Type': undefined,
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
  }


}]);
