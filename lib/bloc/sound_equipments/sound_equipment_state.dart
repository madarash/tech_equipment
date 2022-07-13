part of 'sound_equipment_bloc.dart';

abstract class EquipmentState extends Equatable {}

class InitialEquipmentState extends EquipmentState {
  @override
  List<Object?> get props => [];
}

class LoadingEquipmentState extends EquipmentState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class LoadedEquipmentState extends EquipmentState {
  List loadedSoundEquipment;
  List loadedLightEquipment;

  LoadedEquipmentState({
    required this.loadedLightEquipment,
    required this.loadedSoundEquipment,
  });

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ErrorEquipmentState extends EquipmentState {
  String error;
  ErrorEquipmentState({required this.error});

  @override
  List<Object?> get props => [error];
}
