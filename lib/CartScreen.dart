// import 'package:flutter/material.dart';

// class CartScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> cartItems;

//   const CartScreen({required this.cartItems});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           final item = cartItems[index];
//           return ListTile(
//             leading: Image.network(item['imageUrl']),
//             title: Text(item['name']),
//             subtitle: Text('Brand: ${item['brand']}\nPrice: ${item['price']}'),
//           );
//         },
//       ),
//     );
//   }
// }
//-------------------------
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(item['imageUrl']),
                  title: Text(item['name']),
                  subtitle: Text(
                      'Brand: ${item['brand']}\nPrice: \$${item['price']}'),
                );
              },
            ),
    );
  }
}
