part of 'sound_equipment_bloc.dart';

abstract class SoundEquipmentState extends Equatable {}

class InitialSoundEquipmentState extends SoundEquipmentState {
  @override
  List<Object?> get props => [];
}

class LoadingSoundEquipmentState extends SoundEquipmentState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class LoadedSoundEquipmentState extends SoundEquipmentState {
  List loadedSoundEquipment;

  LoadedSoundEquipmentState({
    required this.loadedSoundEquipment,
  });

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ErrorSoundEquipmentState extends SoundEquipmentState {
  String error;
  ErrorSoundEquipmentState({required this.error});

  @override
  List<Object?> get props => [error];
}
