import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:madrush_tech_support/data/data_equipment.dart';
import 'package:madrush_tech_support/model/equipment_info.dart';

part 'sound_equipment_event.dart';
part 'sound_equipment_state.dart';

class EquipmentBloc extends Bloc<EquipmentEvent, EquipmentState> {
  final DataEquipment soundRepository;
  final DataEquipment lightRepository;

  EquipmentBloc({
    required this.lightRepository,
    required this.soundRepository,
  }) : super(InitialEquipmentState()) {
    on<GetEquipmentData>(_onGetData);
  }

  Future<void> _onGetData(event, emit) async {
    emit(LoadingEquipmentState());
    try {
      final soundEquipments = await soundRepository.getDataSoundEquipment();
      final lightEquipments = await lightRepository.getDataLightEquipment();

      return emit(
        LoadedEquipmentState(
          loadedLightEquipment: lightEquipments,
          loadedSoundEquipment: soundEquipments,
        ),
      );
    } catch (error) {
      emit(
        ErrorEquipmentState(error: error.toString()),
      );
    }
  }
}
