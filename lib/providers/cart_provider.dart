// providers/cart_provider.dart (update to support item quantities)
import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<GroceryItem, int> _cartItems = {};

  List<GroceryItem> get cartItems => _cartItems.keys.toList();

  double get totalPrice => _cartItems.entries
      .fold(0.0, (sum, entry) => sum + (entry.key.price * entry.value));

  void addToCart(GroceryItem item) {
    if (_cartItems.containsKey(item)) {
      _cartItems[item] = _cartItems[item]! + 1;
    } else {
      _cartItems[item] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(GroceryItem item) {
    if (_cartItems.containsKey(item) && _cartItems[item]! > 1) {
      _cartItems[item] = _cartItems[item]! - 1;
    } else {
      _cartItems.remove(item);
    }
    notifyListeners();
  }

  void decreaseItemQuantity(GroceryItem item) {
    if (_cartItems.containsKey(item)) {
      if (_cartItems[item]! > 1) {
        _cartItems[item] = _cartItems[item]! - 1;
      } else {
        _cartItems.remove(item);
      }
      notifyListeners();
    }
  }

  int getItemQuantity(GroceryItem item) {
    return _cartItems[item] ?? 0;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
