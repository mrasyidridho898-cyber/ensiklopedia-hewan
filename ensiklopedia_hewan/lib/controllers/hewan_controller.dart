
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/hewan.dart';

class HewanController {
  Future<List<Hewan>> ambilDataHewan() async {
    final String response = await rootBundle.loadString(
      'assets/data/hewan.json',
    );

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) {
      return Hewan.fromJson(item);
    }).toList();
  }

  List<Hewan> cariHewan(
    List<Hewan> daftar,
    String keyword,
  ) {
    if (keyword.isEmpty) {
      return daftar;
    }

    return daftar.where((hewan) {
      return hewan.nama.toLowerCase().contains(
        keyword.toLowerCase(),
      );
    }).toList();
  }
}
