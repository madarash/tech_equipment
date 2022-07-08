import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madrush_tech_support/bloc/cart/cart_bloc.dart';
import 'package:madrush_tech_support/model/equipment_info.dart';

class CartItem extends StatelessWidget {
  final EquipmentInfo equipment;
  const CartItem({Key? key, required this.equipment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                equipment.image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  equipment.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  equipment.type,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Price: ${equipment.price}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(CartProductRemoved(equipment));
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.red,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
