app.config(function($stateProvider, $urlRouterProvider, $locationProvider) {

    $urlRouterProvider.otherwise('/');

    var homeState = {
      name: 'home',
      url: "/",
      templateUrl: "views/home.html",
      controller: 'homeCtrl',
      controllerAs: 'vm'
    }

    var loginState = {
      name: 'login',
      url: '/login',
      templateUrl: '/views/auth/login.html',
      controller: 'loginCtrl',
      controllerAs: 'vm'
    }

    var registerState = {
      name: 'register',
      url: '/register',
      templateUrl: '/views/auth/register.html',
      controller: 'registerCtrl',
      controllerAs: 'vm'
    }

    var createProductState = {
      name: 'createProduct',
      url: '/products/new',
      templateUrl: '/views/products/create.html',
      controller: 'createProductCtrl',
      controllerAs: 'vm'
    }

    $stateProvider.state(loginState)
    $stateProvider.state(registerState)
    $stateProvider.state(homeState)
    $stateProvider.state(createProductState)

})
