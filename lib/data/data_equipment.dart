import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:madrush_tech_support/model/equipment_info.dart';

abstract class DataEquipment {
  Future getDataSoundEquipment();
  Future getDataLightEquipment();
}

class DataEquipmentImpl implements DataEquipment {
  @override
  Future getDataSoundEquipment() => getData('assets/equipment_sound.json');
  @override
  Future getDataLightEquipment() => getData('assets/equipment_light.json');

  Future getData(String path) async {
    final String response = await rootBundle.loadString(path);
    final List json = await jsonDecode(response);
    final List<EquipmentInfo> data =
        json.map((json) => EquipmentInfo.fromJson(json)).toList();
    return data;
  }
}
