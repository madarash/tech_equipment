import 'package:get_it/get_it.dart';
import 'package:madrush_tech_support/bloc/cart/cart_bloc.dart';
import 'package:madrush_tech_support/bloc/sound_equipments/sound_equipment_bloc.dart';
import 'package:madrush_tech_support/data/data_equipment.dart';

final injector = GetIt.instance;

initServiceLocator() {
  // Bloc
  injector.registerFactory(() =>
      EquipmentBloc(soundRepository: injector(), lightRepository: injector()));
  injector.registerFactory(() => CartBloc());

  /// Repository
  injector.registerFactory<DataEquipment>(() => DataEquipmentImpl());
}
