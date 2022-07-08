import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madrush_tech_support/app_observe.dart';
import 'package:madrush_tech_support/bloc/cart/cart_bloc.dart';

import 'package:madrush_tech_support/bloc/sound_equipments/sound_equipment_bloc.dart';
import 'package:madrush_tech_support/core/servise_locator.dart';
import 'package:madrush_tech_support/presentation/home_page/home_page.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      initServiceLocator();
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  injector<SoundEquipmentBloc>()..add(GetSoundEquipmentData()),
            ),
            BlocProvider(
              create: (context) => injector<CartBloc>()..add(CartStarted()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 243, 245, 252),
            ),
            home: const HomePage(),
          ),
        ),
      );
    },
    blocObserver: AppObserver(),
  );
}
