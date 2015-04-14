(function() {

  var app = angular.module('gemStore', ['templates', 'ngRoute','store-directives']);

  app.config(function ($routeProvider, $locationProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'index.html',
            controller: 'StoreController'
        }),
    $locationProvider.html5Mode(true);
  });

  app.controller('StoreController', ['$http', function($http){
    var store = this;
    store.products = [];

    $http.get('/store-products.json').success(function(data){
      store.products = data;
    });
  }]);

  app.controller('ReviewController', function() {
    this.review = {};

    this.addReview = function(product) {
      product.reviews.push(this.review);

      this.review = {};
    };
  });
})();
