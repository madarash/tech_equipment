import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madrush_tech_support/bloc/sound_equipments/sound_equipment_bloc.dart';
import 'package:madrush_tech_support/presentation/cart_page/cart_page.dart';
import 'package:madrush_tech_support/presentation/custom_app_bar.dart';
import 'package:madrush_tech_support/presentation/home_page/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home Page',
        items: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const MainSlideItem(),
          BlocBuilder<EquipmentBloc, EquipmentState>(
            builder: ((context, state) {
              if (state is LoadingEquipmentState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadedEquipmentState) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const SubTitle(
                        subTitle: 'Sound Equipment',
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.loadedSoundEquipment.length,
                          itemBuilder: (context, index) {
                            return EquipmentItem(
                              equipment: state.loadedSoundEquipment[index],
                            );
                          },
                        ),
                      ),
                      const SubTitle(
                        subTitle: 'Light Equipment',
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.loadedLightEquipment.length,
                          itemBuilder: (context, index) {
                            return EquipmentItem(
                              equipment: state.loadedLightEquipment[index],
                            );
                          },
                        ),
                      ),
                    ]);
              }
              if (state is ErrorEquipmentState) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Oops: ${state.error}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }
              return const Center(child: Text('Something went wrong'));
            }),
          ),
        ],
      ),
    );
  }
}
