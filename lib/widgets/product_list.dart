import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Shoes Shopers',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: _buildProductList()),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1080) {
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.75,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsPage(product: product);
                      },
                    ),
                  );
                },
                child: ProductCard(
                  title: product['title'] as String,
                  price: product['price'] as int,
                  image: product['imageUrl'] as String,
                  backgroundColor: index.isEven
                      ? const Color.fromRGBO(216, 240, 253, 1)
                      : const Color.fromRGBO(245, 247, 249, 1),
                ),
              );
            },
          );
        } else {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsPage(product: product);
                      },
                    ),
                  );
                },
                child: ProductCard(
                  title: product['title'] as String,
                  price: product['price'] as int,
                  image: product['imageUrl'] as String,
                  backgroundColor: index.isEven
                      ? const Color.fromRGBO(216, 240, 253, 1)
                      : const Color.fromRGBO(245, 247, 249, 1),
                ),
              );
            },
          );
        }
      },
    );
  }
}