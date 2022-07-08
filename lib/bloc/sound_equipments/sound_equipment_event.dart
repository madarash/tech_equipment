part of 'sound_equipment_bloc.dart';

abstract class SoundEquipmentEvent extends Equatable {}

class EmptyList extends SoundEquipmentEvent {
  @override
  List<Object?> get props => [];
}

class GetSoundEquipmentData extends SoundEquipmentEvent {
  final List<EquipmentInfo> equipmentInfo;

  GetSoundEquipmentData({this.equipmentInfo = const <EquipmentInfo>[]});

  @override
  List<Object?> get props => [equipmentInfo];
}

class AddSoundEquipmentItem extends SoundEquipmentEvent {
  final EquipmentInfo equipmentInfoItem;
  AddSoundEquipmentItem({required this.equipmentInfoItem});

  @override
  List<Object?> get props => [];
}

class DeleteSoundEquipmentItem extends SoundEquipmentEvent {
  final EquipmentInfo equipmentInfo;
  DeleteSoundEquipmentItem({required this.equipmentInfo});
  @override
  List<Object?> get props => [];
}
