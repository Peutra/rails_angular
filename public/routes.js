app.config(function($stateProvider, $urlRouterProvider, $locationProvider, $urlMatcherFactoryProvider) {

    $urlRouterProvider.otherwise("/404")

    var errorState = {
      name: 'error',
      url: '/404',
      templateUrl: "views/error.html"
    }

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

    var indexProductsState = {
      name: 'products',
      url: '/products',
      templateUrl: '/views/products/index.html',
      controller: 'indexProductsCtrl',
      controllerAs: 'vm'
    }

    $stateProvider.state(loginState)
    $stateProvider.state(registerState)
    $stateProvider.state(homeState)
    $stateProvider.state(createProductState)
    $stateProvider.state(indexProductsState)
    $stateProvider.state(errorState)

    $locationProvider.html5Mode(true)
    // $locationProvider.html5Mode({
    //   enabled: true,
    //   requireBase: true
    // })
    //
    // $urlMatcherFactoryProvider.strictMode(false);

})
