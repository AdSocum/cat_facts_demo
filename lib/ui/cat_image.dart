import 'package:cat_facts_demo/facts_bloc/facts_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactsPageCubit, FactsPageState>(
      builder: (context, state) {
        if (state.status == FactStatus.success) {
          return Image.memory(state.image);
        } else if (state.status == FactStatus.loading) {
          return const Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
