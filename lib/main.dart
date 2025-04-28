import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:api/models.dart";

void main() async {

  final response = await http.get(Uri.parse('https://dummyjson.com/carts'));
  
  if (response.statusCode == 200) {
    
    final jsonData = json.decode(response.body);
    final cartsResponse = CartsResponse.fromJson(jsonData);
    
    for (var cart in cartsResponse.carts) {
      print('Cart ID: ${cart.id}');
      print('Products in cart:');
      
      for (var product in cart.products) {
        print('  Product ID: ${product.id}');
        print('  Title: ${product.title}');
        print('  Price: \$${product.price}');
        print('  Quantity: ${product.quantity}');
        print('  Total: \$${product.total}');
        print('  Discount: ${product.discountPercentage}%');
        print('  Discounted Total: \$${product.discountedTotal}');
        print('  Thumbnail: ${product.thumbnail}');
        print('  --------------------');
      }
      print('==================================');
    }
  } else {
    print('Failed to load data: ${response.statusCode}');
  }
}