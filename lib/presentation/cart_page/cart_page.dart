import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madrush_tech_support/bloc/cart/cart_bloc.dart';
import 'package:madrush_tech_support/presentation/custom_app_bar.dart';
import 'widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoadede) {
          double subtotal() => state.cart.product
              .fold(0, (total, current) => total + current.price);
          String subTotalPrice() => subtotal().toStringAsFixed(0);

          return Scaffold(
            appBar: CustomAppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: Colors.amber,
                    )),
                items: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        'Total Price: ${subTotalPrice()}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 75, 60, 16)),
                      ),
                    ),
                  )
                ],
                title: 'Your List'),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 185, 185, 201),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 130, 147, 170)
                          .withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                    itemCount: state.cart.product.length,
                    itemBuilder: (context, index) {
                      return CartItem(equipment: state.cart.product[index]);
                    }),
              ),
            ),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
