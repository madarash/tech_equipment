import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:madrush_tech_support/data/data_sound_equipment.dart';
import 'package:madrush_tech_support/model/equipment_info.dart';

part 'sound_equipment_event.dart';
part 'sound_equipment_state.dart';

class SoundEquipmentBloc
    extends Bloc<SoundEquipmentEvent, SoundEquipmentState> {
  final DataSoundEquipment soundRepository;

  SoundEquipmentBloc({
    required this.soundRepository,
  }) : super(InitialSoundEquipmentState()) {
    on<GetSoundEquipmentData>(_onGetData);
  }

  Future<void> _onGetData(event, emit) async {
    emit(LoadingSoundEquipmentState());
    try {
      final soundEquipments = await soundRepository.getDataSoundEquipment();

      return emit(
        LoadedSoundEquipmentState(
          loadedSoundEquipment: soundEquipments,
        ),
      );
    } catch (error) {
      emit(
        ErrorSoundEquipmentState(error: error.toString()),
      );
    }
  }
}
