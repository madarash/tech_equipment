import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madrush_tech_support/bloc/cart/cart_bloc.dart';

import 'package:madrush_tech_support/model/equipment_info.dart';

class EquipmentItem extends StatelessWidget {
  final EquipmentInfo equipment;

  const EquipmentItem({Key? key, required this.equipment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 130, 147, 170).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  equipment.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                equipment.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                equipment.type,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Price: ${equipment.price}',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: (() => context.read<CartBloc>().add(
                    CartProductAdded(equipment),
                  )),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: Center(
                  child: Text(
                    'add'.toUpperCase(),
                    style: const TextStyle(
                        letterSpacing: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
