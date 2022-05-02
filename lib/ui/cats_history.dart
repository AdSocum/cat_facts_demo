import 'package:cat_facts_demo/repository/facts_repository.dart';
import 'package:cat_facts_demo/util.dart';
import 'package:flutter/material.dart';
import 'package:cat_facts_demo/repository/hive_fact_interface.dart';
class CatsHistory extends StatelessWidget {

  final FactsRepository factsRepository;

  const CatsHistory(this.factsRepository, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: factsRepository.getFacts(),
        builder: (BuildContext context,AsyncSnapshot<List<Fact>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
              return _ListTile(snapshot.data![index]);
            });
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}

class _ListTile extends StatelessWidget {
  final Fact fact;

  const _ListTile(this.fact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          fact.text,
          style: Theme
              .of(context)
              .textTheme
              .bodyText1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          fact.createdAt.formatDate(context),
          style: Theme
              .of(context)
              .textTheme
              .subtitle1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        const Divider(),
      ],
    );
  }
}

