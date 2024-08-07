import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/data/products.dart';
import 'package:gorouter/models/product_model.dart';
import 'package:gorouter/router/route_name.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsList = ProductData().productsList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product"),
      ),
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          final Product product = productsList[index];
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(
                  RouteNameClass.singleProduct,
                  extra: product,
                );
              },
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(product.title),
                trailing: Text(product.price.toString()),
                leading: Image.network(
                  product.imageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
