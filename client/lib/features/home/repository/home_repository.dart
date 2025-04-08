import 'package:client/features/home/models/category_model.dart';
import 'package:client/features/home/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@riverpod
class HomeRepository extends _$HomeRepository {
  @override
  AsyncValue? build() {
    return null;
  }

  Future<List<CategoryModel>> getCategories() async {
    return [
      CategoryModel(
        id: '1',
        name: 'Bazaar',
        image: 'assets/images/category_images/bazaar.jpg',
        description: 'Bazaar items',
        order: 1,
      ),
      CategoryModel(
        id: '2',
        name: 'Mobiles',
        image: 'assets/images/category_images/mobiles.jpg',
        description: 'Mobile phones',
        order: 2,
      ),
      CategoryModel(
        id: '3',
        name: 'Fashion',
        image: 'assets/images/category_images/fashion.jpg',
        description: 'Clothing and accessories',
        order: 3,
      ),
      CategoryModel(
        id: '4',
        name: 'Groceries',
        image: 'assets/images/category_images/groceries.jpg',
        description: 'Daily groceries',
        order: 4,
      ),
      CategoryModel(
        id: '5',
        name: 'MX Player',
        image: 'assets/images/category_images/mxplayer.png',
        description: 'MX Player content',
        order: 5,
      ),
      CategoryModel(
        id: '6',
        name: 'Everyday',
        image: 'assets/images/category_images/everyday.jpg',
        description: 'Everyday essentials',
        order: 6,
      ),
      CategoryModel(
        id: '7',
        name: 'Deals',
        image: 'assets/images/category_images/deals.jpg',
        description: 'Best deals',
        order: 7,
      ),
      CategoryModel(
        id: '8',
        name: 'Home',
        image: 'assets/images/category_images/home.jpg',
        description: 'Furniture and decor',
        order: 8,
      ),
      CategoryModel(
        id: '9',
        name: 'Books',
        image: 'assets/images/category_images/books.jpg',
        description: 'Books and literature',
        order: 9,
      ),
      CategoryModel(
        id: '10',
        name: 'Toys',
        image: 'assets/images/category_images/toys.jpg',
        description: 'Toys and games',
        order: 10,
      ),
      CategoryModel(
        id: '11',
        name: 'Electronics',
        image: 'assets/images/category_images/electronics.jpg',
        description: 'Devices and gadgets',
        order: 11,
      ),
      CategoryModel(
        id: '12',
        name: 'Beauty',
        image: 'assets/images/category_images/beauty.jpg',
        description: 'Beauty products',
        order: 12,
      ),
      CategoryModel(
        id: '13',
        name: 'Rewards',
        image: 'assets/images/category_images/rewards.jpg',
        description: 'Rewards and offers',
        order: 13,
      ),
    ];
  }

  Future<List<ProductModel>> getProducts() async {
    return [
      ProductModel(
        imageUrl: 'assets/images/products/product_1.webp',
        name: 'Product 1',
        realPrice: '100',
        sellingPrice: '80',
        discountPercentage: '20%',
      ),
      ProductModel(
        imageUrl: 'assets/images/products/product_2.webp',
        name: 'Product 2',
        realPrice: '200',
        sellingPrice: '150',
        discountPercentage: '25%',
      ),
      ProductModel(
        imageUrl: 'assets/images/products/product_3.jpeg',
        name: 'Product 3',
        realPrice: '300',
        sellingPrice: '250',
        discountPercentage: '17%',
      ),
      ProductModel(
        imageUrl: 'assets/images/products/product_4.webp',
        name: 'Product 4',
        realPrice: '400',
        sellingPrice: '300',
        discountPercentage: '25%',
      ),
      ProductModel(
        imageUrl: 'assets/images/products/product_5.jpeg',
        name: 'Product 5',
        realPrice: '500',
        sellingPrice: '450',
        discountPercentage: '10%',
      ),
      ProductModel(
        imageUrl: 'assets/images/products/product_6.webp',
        name: 'Product 6',
        realPrice: '500',
        sellingPrice: '450',
        discountPercentage: '10%',
      ),
      ProductModel(
        imageUrl: 'assets/images/products/product_7.jpg',
        name: 'Product 7',
        realPrice: '500',
        sellingPrice: '450',
        discountPercentage: '10%',
      ),
    ];
  }
}
