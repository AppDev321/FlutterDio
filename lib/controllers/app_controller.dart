import 'dart:convert';

import 'package:flutter_dio/api/repository/api_repository.dart';
import 'package:flutter_dio/models/add_product_model.dart';
import 'package:flutter_dio/models/movie_details_model.dart';
import 'package:flutter_dio/models/product_model.dart';
import 'package:flutter_dio/models/res_dispatch.dart';
import 'package:flutter_dio/res/strings.dart';
import 'package:flutter_dio/utils/log_util.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../api/repository/base_repository.dart';
import '../data/common/constants.dart';
import '../models/cart_model.dart';
import '../models/genre_model.dart';
import '../models/res_product.dart';
import '../widgets/progressbutton/progress_button.dart';


class AppController extends GetxController {
  final _selectedTabIndex = 0.obs;
  final _isLoading = false.obs;

  // final RxBool _isLoading = false.obs;
  final _isLoadingIndex = <int, bool>{}.obs;
  final _productsList = <ProductModel>[].obs;
  final _popularMoviesList = <MovieDetailsModel>[].obs;
  final _genresList = <GenreModel>[].obs;

  var _favCount = 0.obs;

  int get selectedTabIndex => _selectedTabIndex.value;

  bool get isLoading => _isLoading.value;

  bool isLoadingIndex(int index, [bool defaultValue = false]) =>
      _isLoadingIndex.value[index] ?? defaultValue;

  List<ProductModel> get productsList => _productsList.value;

  List<MovieDetailsModel> get popularMoviesList => _popularMoviesList.value;

  List<GenreModel> get genresList => _genresList.value;

  int get favCount => _favCount.value;


  final _productList = <Product>[].obs;
  List<Product> get productList => _productList.value;

  final _dispatchList = <Dispatch>[].obs;
  List<Dispatch> get dispatchList => _dispatchList.value;

  final _cartList = <CartItem>[].obs;
  List<CartItem> get cartList => _cartList.value;

  final _grandTotalPrice = 0.0.obs;
  double get grandTotalPrice => _grandTotalPrice.value;


  final _productRequestState = ButtonState.idle.obs;
  ButtonState get getProductButtonState => _productRequestState.value;

  @override
  void onInit() {
    Log.loga(title, "onInit:: >>>>>>> ");
   // getProducts();
    getDispatchedList();
    super.onInit();
  }

  void onTabChanged(int index) {
    _selectedTabIndex.value = index;
  }

  void setLoading(bool show) {
    _isLoading.value = show;
    // _isLoading(true);
  }

  void setLoadingIndex(int key, bool show) {
    _isLoadingIndex.update(key, (dynamic val) => show, ifAbsent: () => show);
  }

  void getProducts() async {
    setLoadingIndex(0, true);
    setLoading(true);
    try {
      final result = await ApiRepo().getProducts();
      setLoading(false);
      setLoadingIndex(0, false);
      if (result != null) {
        if (result.status==200) {
          _productList.value = result.data  ?? [];

        } else {
          constants.showSnackbar(
              "Api Error Response",result.message);
        }
      }
    } catch (e) {
      setLoadingIndex(0, false);
      setLoading(false);
      constants.showSnackbar("Api Error", e.toString());
    }
  }



  void addNewProducts(AddProduct product) async {
   _productRequestState.value = ButtonState.loading;
    setLoading(true);
    try {
      final result = await ApiRepo().addNewProduct(product);
      setLoading(false);
      if (result != null) {
        if (result.status==200) {
          _productRequestState.value = ButtonState.success;
        } else {
          _productRequestState.value = ButtonState.fail;
          constants.showSnackbar(
              "Api Error Response",result.message);
        }

        Future.delayed(Duration(seconds: 2));
        _productRequestState.value = ButtonState.idle;
      }
    } catch (e) {
      _productRequestState.value = ButtonState.fail;
      setLoading(false);
      constants.showSnackbar("Api Error", e.toString());

      Future.delayed(Duration(seconds: 2));
      _productRequestState.value = ButtonState.idle;
    }
   getProducts();

  }




  void getDispatchedList() async {
    setLoading(true);
    setLoadingIndex(1, true);
    try {
      final result = await ApiRepo().getDispatch();
      setLoading(false);
      setLoadingIndex(1, false);
      if (result != null) {
        if (result.status == 200) {
          _dispatchList.value = result.data  ?? [];

        } else {
          constants.showSnackbar(
              "Api Error Response", "error:: ${result.message}");
        }
      }
    } catch (e) {
      setLoadingIndex(1, false);
      setLoading(false);
      constants.showSnackbar("Api Error", "error:: $e");
    }
  }








  // 2nd way to get products list
  void getProducts2() async {
    setLoading(true);
    try {
      String url = Api.baseUrl + "products";

      final result = await BaseRepo().get(apiURL: url);
      Log.loga(title, "getProducts2:: result >>>>> $result");

      setLoading(false);
      if (result != null) {
        List<ProductModel> products = List<ProductModel>.from(
            result.map((x) => ProductModel.fromJson(x)));
        _productsList.value = products;
      }
    } catch (e) {
      Log.loga(title, "getProducts2:: e >>>>> $e");
      setLoading(false);
      constants.showSnackbar("Api Error", "error:: $e");
    }
  }

  void getPopularMovies() async {
    setLoadingIndex(2, true);
    try {
      final result = await ApiRepo().getPopularMovies();
      Log.loga(title, "getPopularMovies:: result >>>>> ${result!.toJson()}");

      setLoadingIndex(2, false);
      if (result != null) {
        if (result.isSuccess()) {
          _popularMoviesList.value = result.results ?? [];
        } else {
          constants.showSnackbar(
              "Api Error Response", "error:: ${result.statusMessage}");
        }
      }
    } catch (e) {
      Log.loga(title, "getPopularMovies:: e >>>>> $e");
      setLoadingIndex(2, false);
      constants.showSnackbar("Api Error", "error:: $e");
    }
  }

  void getGenreList() async {
    try {
      final result = await ApiRepo().getGenreList();
      Log.loga(title, "getGenreList:: result >>>>> ${result!.toJson()}");

      if (result != null) {
        if (result.isSuccess()) {
          _genresList.value = result.genres ?? [];
        }
      }
    } catch (e) {
      Log.loga(title, "getGenreList:: e >>>>> $e");
    }
  }

  String getGenreNames(List<int> ids) {
    List<String> list = [];
    ids.forEach((id) {
      GenreModel genre = _genresList.firstWhere((element) => element.id == id);
      list.add(genre.name ?? "");
      /*_genresList.forEach((genre) {
        if (genre.id == id) {
          list.add(genre.name ?? "");
        }
      });*/
    });
    return list.join(", ");
  }

  void updateQty({required ProductModel product, bool isAdd = true}) {
    int index = _productsList.indexOf(product);
    if (isAdd) {
      product.qty++;
      _productsList[index] = product;
    } else {
      product.qty--;
      _productsList[index] = product;
    }
  }

  void setFavourite({required ProductModel product, required bool fav}) {
    product.isFav = fav;
    _productsList[_productsList.indexOf(product)] = product;
    if (fav) {
      _favCount++;
    } else {
      _favCount--;
    }
  }


  void addToCart({required Product product, required int quantity}) {
    var existingCartItem = cartList.firstWhereOrNull(
          (item) => item.product == product
    );
    if (existingCartItem != null) {
      updateCartQuantity(existingCartItem, quantity);
    } else {
      _cartList.add(CartItem(product: product, numOfItem: quantity));
    }
    setTotalPrice();
  }

  void updateCartQuantity(CartItem cartItem,int quantity,{bool updateQuantity = false}) {
    int index = cartList.indexOf(cartItem);
    updateQuantity == false?  cartItem.numOfItem += quantity :  cartItem.numOfItem =  quantity;
    _cartList[index] = cartItem;
    setTotalPrice();
  }

  setTotalPrice()
  {
    double totalPrice = 0.0;
    for (var cartItem in cartList) {

     var price =   cartItem.product.price;

     price = price.toDouble();
      totalPrice += price * cartItem.numOfItem;
    }
    _grandTotalPrice.value = double.parse(totalPrice.toStringAsFixed(2));

  }


  deleteCartItem(CartItem item)
  {
    _cartList.remove(item);
    setTotalPrice();
  }
}
