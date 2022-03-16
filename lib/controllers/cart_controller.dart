import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

import '../models/cart_models.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _cartItems = {};
  Map<int, CartModel> get items => _cartItems;

  void addItem(ProductModel product, int quantity) {
    if (_cartItems.containsKey(product.id!)) {
      _cartItems.update(product.id!, (value) {
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            time: DateTime.now().toString(),
            isExist: true);
      });
    } else {
      _cartItems.putIfAbsent(
        product.id!,
        () {
          print(
              'Adding item in the cart' + 'quantity = ' + quantity.toString());
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              time: DateTime.now().toString(),
              isExist: true);
        },
      );
    }
  }

  bool existInCart(ProductModel product) {
    if (_cartItems.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    int quantity = 0;
    if (_cartItems.containsKey(product.id)) {
      _cartItems.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}