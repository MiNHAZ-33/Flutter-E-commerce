import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool get isLoaded => _isLoaded;
  int get getQuantity => _quantity;
  int get getCartItems => _intCartItems + _quantity;
  late CartController _cart;

  bool _isLoaded = false;
  int _quantity = 0;
  int _intCartItems = 0;
  bool _isExist = false;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Got the data');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products!);
      _isLoaded = true;
      update();
    } else {
      print('Error');
    }
  }

  void setQuantity(bool isIncreament) {
    if (isIncreament) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity > 20) {
      return 20;
    }
    if (quantity < 0) {
      return 0;
    } else {
      return quantity;
    }
  }

  void initQuantity() {
    _quantity = 0;
  }

  void initProduct(CartController cart, ProductModel product) {
    _quantity = 0;
    _intCartItems = 0;
    _cart = cart;
    _isExist = _cart.existInCart(product);
    if (_isExist) {
      _intCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        print('The id is :' +
            value.id.toString() +
            'The quantity is :' +
            value.quantity.toString());
      });
    } else {
      Get.snackbar('Cart message', 'You should at least add one item',
          backgroundColor: AppColors.mainColor);
    }
  }
}
