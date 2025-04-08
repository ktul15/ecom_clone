import 'package:client/core/theme/app_pallette.dart';
import 'package:client/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        ProductModel product = products[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              SizedBox(height: 4),
              Text(product.name, overflow: TextOverflow.ellipsis),
              ProductPriceSection(product: product),
            ],
          ),
        );
      }, childCount: products.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 0.95,
      ),
    );
  }
}

class ProductPriceSection extends StatelessWidget {
  const ProductPriceSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(0, -6), // Adjust the vertical position
                  child: Text(
                    '\u20B9', // Superscript text
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              TextSpan(
                text: product.sellingPrice, // Normal text
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        SizedBox(width: 4),
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(0, 0), // Adjust the vertical position
                  child: Text(
                    '\u20B9${product.realPrice}', // Superscript text
                    style: TextStyle(
                      fontSize: 12,
                      color: Pallete.greyColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 4),
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(0, 0), // Adjust the vertical position
                  child: Text(
                    "-${product.discountPercentage}", // Superscript text
                    style: TextStyle(fontSize: 12, color: Pallete.errorColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
