app.factory('dataService',  ['$http', 'authService', function($http, authService) {

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
        return result
      }, function(reason) {
        return reason
      })
  }

  var getUserVote = function(user_id) {
    return $http.get('/api/vote', {
        params: { user_id: user_id }
      })
      .then(function(result) {
        return result
      }, function(reason) {
        return reason
      })
  }

  var voteFor = function(user_id, product_id) {
    var vote = {user_id: user_id, product_id: product_id}
    console.log(vote)
    return $http.post('/api/vote', vote)
      .then(function(result) {
          return result
        }, function(reason) {
          return reason
      })
  }

  return {
    getProfile : getProfile,
    createProduct : createProduct,
    getProducts : getProducts,
    voteFor : voteFor,
    getUserVote : getUserVote
  }


}]);
