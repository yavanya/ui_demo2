import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '../../../domain/model/barber.dart';

class HomeViewModel extends FutureViewModel {
  List<Barber> _individuals = [];
  List<Barber> get individuals => _individuals;

  List<Barber> _salons = [];
  List<Barber> get salons => _salons;

  List<Barber> _popular = [];
  List<Barber> get popular => _popular;

  List<Barber> _recent = [];
  List<Barber> get recent => _recent;

  Future<void> getDataFromJson() async {
    String _json = await rootBundle.loadString('assets/strings/barbers.json');

    List<Barber> _rawBarbers;

    _rawBarbers =
        List<Barber>.from(json.decode(_json).map((x) => Barber.fromJson(x)));

    for (int i = 0; i < _rawBarbers.length; i++) {
      if (_rawBarbers[i].isIndividual) _individuals.add(_rawBarbers[i]);
      if (!_rawBarbers[i].isIndividual) _salons.add(_rawBarbers[i]);
      if (_rawBarbers[i].isPopular) _popular.add(_rawBarbers[i]);
      if (_rawBarbers[i].isRecent) _recent.add(_rawBarbers[i]);
    }
  }

  @override
  Future<void> futureToRun() async {
    await getDataFromJson();
  }
}
