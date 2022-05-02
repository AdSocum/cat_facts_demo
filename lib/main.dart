import 'package:cat_facts_demo/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();
  const app = App();
  runApp(app);

}

