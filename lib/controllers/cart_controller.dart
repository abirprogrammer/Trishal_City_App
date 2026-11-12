import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../data/mock_data.dart';

class CartController extends ChangeNotifier {
  final Map<String, int> _quantities = {};

  int quantityFor(Product product) => _quantities[product.id] ?? 0;
  int get itemCount => _quantities.values.fold(0, (sum, qty) => sum + qty);

  int get total => _quantities.entries.fold(0, (sum, entry) {
        final product = productsById[entry.key];
        return sum + (product == null ? 0 : product.price * entry.value);
      });

  List<MapEntry<Product, int>> get items => _quantities.entries
      .where((entry) => entry.value > 0 && productsById[entry.key] != null)
      .map((entry) => MapEntry(productsById[entry.key]!, entry.value))
      .toList();

  void add(Product product) {
    _quantities[product.id] = quantityFor(product) + 1;
    notifyListeners();
  }

  void removeOne(Product product) {
    final qty = quantityFor(product);
    if (qty <= 1) {
      _quantities.remove(product.id);
    } else {
      _quantities[product.id] = qty - 1;
    }
    notifyListeners();
  }

  void delete(Product product) {
    _quantities.remove(product.id);
    notifyListeners();
  }

  void clear() {
    _quantities.clear();
    notifyListeners();
  }
}

final Map<String, Product> productsById = {for (final product in products) product.id: product};
final cartController = CartController();
