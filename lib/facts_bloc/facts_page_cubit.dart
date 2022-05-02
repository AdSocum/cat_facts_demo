import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cat_facts_demo/facts_api_client/facts_client.dart';
import 'package:cat_facts_demo/repository/facts_repository.dart';
import 'package:flutter/services.dart';

part 'facts_page_state.dart';

const _src = 'https://cataas.com/cat';

class FactsPageCubit extends Cubit<FactsPageState> {
  ApiClient apiClient;
  FactsRepository factsRepository;

  FactsPageCubit(this.apiClient, this.factsRepository) : super(initialState);

  void nextFact() async {
    if (state.status != FactStatus.initial) {
      factsRepository.saveFact(state.fact);
    }
    emit(state.copyWith(status: FactStatus.loading));
    final newFact = await apiClient.fetchRandomFact();
    final newImage = (await NetworkAssetBundle(Uri.parse(_src)).load(_src))
        .buffer
        .asUint8List();
    emit(FactsPageState(status: FactStatus.success, fact: newFact,image: newImage));
  }
}
