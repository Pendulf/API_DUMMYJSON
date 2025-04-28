// Модель данных для продукта в корзине
class CartProduct {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      total: json['total'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      discountedTotal: json['discountedTotal'].toDouble(),
      thumbnail: json['thumbnail'],
    );
  }
}

// Модель данных для корзины
class Cart {
  final int id;
  final List<CartProduct> products;

  Cart({
    required this.id,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    var productsList = json['products'] as List;
    List<CartProduct> products = productsList
        .map((product) => CartProduct.fromJson(product))
        .toList();

    return Cart(
      id: json['id'],
      products: products,
    );
  }
}

class CartsResponse {
  final List<Cart> carts;

  CartsResponse({
    required this.carts,
  });

  factory CartsResponse.fromJson(Map<String, dynamic> json) {
    var cartsList = json['carts'] as List;
    List<Cart> carts = cartsList.map((cart) => Cart.fromJson(cart)).toList();

    return CartsResponse(carts: carts);
  }
}