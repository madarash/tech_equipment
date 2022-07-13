import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madrush_tech_support/model/equipment_cart.dart';
import 'package:madrush_tech_support/model/equipment_info.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartStarted>(_cartStarted);
    on<CartProductAdded>(_cartEquipmentAdded);
    on<CartProductRemoved>(_cartEquipmentRemoved);
  }

  void _cartStarted(event, emit) {
    emit(CartLoading());
    try {
      emit(const CartLoadede());
    } catch (error) {
      Text('$error');
    }
  }

  void _cartEquipmentAdded(CartProductAdded event, emit) {
    final state = this.state;
    if (state is CartLoadede) {
      emit(
        CartLoadede(
          cart: Cart(
            product: List.from(state.cart.product)..add(event.equipment),
          ),
        ),
      );
    }
  }

  void _cartEquipmentRemoved(CartProductRemoved event, emit) {
    final state = this.state;
    if (state is CartLoadede) {
      emit(
        CartLoadede(
          cart: Cart(
            product: List.from(state.cart.product)..remove(event.equipment),
          ),
        ),
      );
    }
  }
}
