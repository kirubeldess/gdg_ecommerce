import 'package:flutter/material.dart';
import 'domain/entities/product.dart';
import 'domain/repos/product_repo.dart';
import 'domain/usecases/usecases.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = ProductRepository();

  final createProductUsecase = CreateProductUsecase(repository);
  createProductUsecase.call(
    Product(
      id: '1', 
      name: 'Shoes',
      description: 'A running shoes',
      imageUrl: 'https://images.app.goo.gl/zXu7VauyoqrnNsrg8',
      price: 3000,
    ),
  );
  createProductUsecase.call(
    Product(
      id: '2',
      name: 'Sprite',
      description: 'A refreshing drink',
      imageUrl: 'https://images.app.goo.gl/UqkkHjHfw1okAErEA',
      price: 35,
    ),
  );

  final viewAllProductsUsecase = ViewAllProductsUsecase(repository);
  final products = viewAllProductsUsecase.call(NoParams());

  runApp(MyApp(products: products));
}

class MyApp extends StatelessWidget {
  final List<Product> products;

  const MyApp({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDG eCommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListScreen(products: products),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products;

  const ProductListScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Catalog')),
      body: products.isEmpty
          ? const Center(child: Text('No products available.'))
          : ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: products.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(product.description),
            const SizedBox(height: 20),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
