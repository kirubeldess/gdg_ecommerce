import 'package:gdg_ecommerce/domain/repos/product_repo.dart';

import '../entities/product.dart';

//Base
abstract class UseCase<ReturnType, Params> {
  ReturnType call(Params params);
}

class NoParams {}

class ViewAllProductsUsecase extends UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  @override
  List<Product> call(NoParams params) {
    return repository.getAllProducts();
  }
}

class ViewProductUsecase extends UseCase<Product?, String> {
  final ProductRepository repository;

  ViewProductUsecase(this.repository);

  @override
  Product? call(String params) {
    return repository.getProductById(params);
  }
}

class CreateProductUsecase extends UseCase<void, Product> {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  @override
  void call(Product params) {
    repository.addProduct(params);
  }
}

class UpdateProductUsecase extends UseCase<void, Product> {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  @override
  void call(Product params) {
    repository.updateProduct(params);
  }
}

class DeleteProductUsecase extends UseCase<void, String> {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  @override
  void call(String params) {
    repository.deleteProduct(params);
  }
}
