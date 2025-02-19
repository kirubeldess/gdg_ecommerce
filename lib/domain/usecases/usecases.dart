import 'package:gdg_ecommerce/domain/repos/product_repo.dart';

import '../entities/product.dart';
// import '../repositories/product_repository.dart';

/// Base UseCase interface that all use cases will extend.
abstract class UseCase<ReturnType, Params> {
  ReturnType call(Params params);
}

/// A helper class for cases where no parameters are needed.
class NoParams {}

/// Use case for viewing all products.
class ViewAllProductsUsecase extends UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  @override
  List<Product> call(NoParams params) {
    return repository.getAllProducts();
  }
}

/// Use case for viewing a specific product by its id.
class ViewProductUsecase extends UseCase<Product?, String> {
  final ProductRepository repository;

  ViewProductUsecase(this.repository);

  @override
  Product? call(String params) {
    return repository.getProductById(params);
  }
}

/// Use case for creating a new product.
class CreateProductUsecase extends UseCase<void, Product> {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  @override
  void call(Product params) {
    repository.addProduct(params);
  }
}

/// Use case for updating an existing product.
class UpdateProductUsecase extends UseCase<void, Product> {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  @override
  void call(Product params) {
    repository.updateProduct(params);
  }
}

/// Use case for deleting a product by its id.
class DeleteProductUsecase extends UseCase<void, String> {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  @override
  void call(String params) {
    repository.deleteProduct(params);
  }
}
