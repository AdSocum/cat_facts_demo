import 'package:cat_facts_demo/facts_api_client/facts_client.dart';
import 'package:cat_facts_demo/repository/facts_repository.dart';
import 'package:cat_facts_demo/ui/fact_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'cats_history.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Platform.localeName),
        Provider(create: (_) => ApiClient(Dio())),
        Provider(create: (_) => FactsRepository()),
      ],
      child: MaterialApp(
        routes: {
          '/history': (context) => CatsHistory(context.read<FactsRepository>())
        },
        home: FactPage.create(),
      ),
    );
  }
}
