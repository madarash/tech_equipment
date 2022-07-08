import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:madrush_tech_support/model/equipment_info.dart';

abstract class DataSoundEquipment {
  Future getDataSoundEquipment();
}

class DataSoundEquipmentImpl implements DataSoundEquipment {
  @override
  Future getDataSoundEquipment() async {
    final String response =
        await rootBundle.loadString('assets/equipment_sound.json');
    final List json = await jsonDecode(response);
    final List<EquipmentInfo> data =
        json.map((json) => EquipmentInfo.fromJson(json)).toList();
    return data;
  }
}
