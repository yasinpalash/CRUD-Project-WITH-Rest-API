import 'package:flutter/material.dart';
import 'package:moduel/screens/add_new_product_screen.dart';

import '../screens/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.onPressDelete});

  final Function(String) onPressDelete;

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(

            context: context,
            builder: (context) {
              return ProductActionDialog(context);
            });
      },
      leading: Image.network(
        product.image,
        width: 80,
      ),
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.productCode),
          Row(children: [
            Text('Total Price:${product.totalPrice}'),
            const SizedBox(width: 2,),
            Text('Quantity:${product.quantity}'),
          ],),

        ],
      ),
      trailing: Text('\$${product.unitPrice}'),
    );
  }

  AlertDialog ProductActionDialog(BuildContext context) {
    return AlertDialog(

      title: const Text('Select Action  '),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Edit'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddNewProductScreen(
                          product: product,
                        )),
              );
            },
            leading: const Icon(Icons.edit),
          ),
          ListTile(
            title: const Text('Delete'),
            onTap: () {
              Navigator.pop(context);
              onPressDelete(product.id);
            },
            leading: const Icon(Icons.delete_outlined),
          )
        ],
      ),
    );
  }
}
