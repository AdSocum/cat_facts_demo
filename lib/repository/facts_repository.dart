import 'package:cat_facts_demo/facts_api_client/facts_client.dart' as client;
import 'package:hive/hive.dart';

import 'hive_fact_interface.dart';

class FactsRepository {

  FactsRepository(){
    Hive.registerAdapter(FactAdapter());
  }


  void saveFact(client.Fact fact) async {
    final _box = await Hive.openBox<Fact>('myBox');
    _box.add(_fromClientFact(fact));
    await _box.close();

  }

  Future<List<Fact>> getFacts() async {
    final _box = await Hive.openBox<Fact>('myBox');
    List<Fact> facts = _box.values.toList();
    await _box.close();
    return facts;
  }

  Fact _fromClientFact(client.Fact fact) {
    return Fact(
      text: fact.text,
      createdAt: fact.createdAt,
    );
  }
}
