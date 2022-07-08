import 'package:equatable/equatable.dart';
import 'package:madrush_tech_support/model/equipment_info.dart';

class Cart extends Equatable {
  final List<EquipmentInfo> product;
  const Cart({this.product = const <EquipmentInfo>[]});
  @override
  List<Object?> get props => [product];
}
