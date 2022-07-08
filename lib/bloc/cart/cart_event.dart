part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  final EquipmentInfo equipment;

  const CartProductAdded(this.equipment);
  @override
  List<Object> get props => [equipment];
}

class CartProductRemoved extends CartEvent {
  final EquipmentInfo equipment;

  const CartProductRemoved(this.equipment);
  @override
  List<Object> get props => [equipment];
}
