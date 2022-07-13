part of 'sound_equipment_bloc.dart';

abstract class EquipmentEvent extends Equatable {}

class EmptyList extends EquipmentEvent {
  @override
  List<Object?> get props => [];
}

class GetEquipmentData extends EquipmentEvent {
  final List<EquipmentInfo> equipmentInfo;

  GetEquipmentData({this.equipmentInfo = const <EquipmentInfo>[]});

  @override
  List<Object?> get props => [equipmentInfo];
}

class AddEquipmentItem extends EquipmentEvent {
  final EquipmentInfo equipmentInfoItem;
  AddEquipmentItem({required this.equipmentInfoItem});

  @override
  List<Object?> get props => [];
}

class DeleteEquipmentItem extends EquipmentEvent {
  final EquipmentInfo equipmentInfo;
  DeleteEquipmentItem({required this.equipmentInfo});
  @override
  List<Object?> get props => [];
}
