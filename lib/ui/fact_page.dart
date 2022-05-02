import 'package:cat_facts_demo/facts_api_client/facts_client.dart';
import 'package:cat_facts_demo/facts_bloc/facts_page_cubit.dart';
import 'package:cat_facts_demo/repository/facts_repository.dart';
import 'package:cat_facts_demo/ui/cat_image.dart';
import 'package:cat_facts_demo/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactPage extends StatelessWidget {
  const FactPage({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      lazy: false,
      create: (context) => FactsPageCubit(
        context.read<ApiClient>(),
        context.read<FactsRepository>(),
      )..nextFact(),
      child: const FactPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FactsPageCubit>();
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.red,
        ),
        body: BlocBuilder<FactsPageCubit, FactsPageState>(
            bloc: cubit,
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const ImageView(),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      state.status == FactStatus.success
                          ? state.fact.text
                          : "Looking for your cat",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      state.status == FactStatus.success
                          ? state.fact.createdAt.formatDate(context)
                          : "",
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        onPressed: () => cubit.nextFact(),
                        child: const Text('Another Fact!')),
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/history'),
                        child: const Text('History'))
                  ],
                ),
              );
            }));
  }
}
