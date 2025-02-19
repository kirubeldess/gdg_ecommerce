import 'package:gdg_ecommerce/domain/entities/product.dart';

class ProductRepository {
  final List<Product> _products = [];
  int _nextId = 1;

  List<Product> getAllProducts() => List.unmodifiable(_products);

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  void addProduct(Product product) {
    final newProduct = product.copyWith(id: _nextId.toString());
    _products.add(newProduct);
    _nextId++;
  }

  void updateProduct(Product product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
  }
}