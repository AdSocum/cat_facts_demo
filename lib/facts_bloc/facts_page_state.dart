part of 'facts_page_cubit.dart';

enum FactStatus { initial, loading, success, error }

class FactsPageState {
  final Fact fact;
  final FactStatus status;
  final Uint8List image;

  FactsPageState(
      {required this.image, required this.status, required this.fact});

  FactsPageState copyWith({Uint8List? image, FactStatus? status, Fact? fact}) {
    return FactsPageState(
      status: status ?? this.status,
      fact: fact ?? this.fact,
      image: image ?? this.image,
    );
  }
}

FactsPageState initialState = FactsPageState(
    image: Uint8List(0) ,
    status: FactStatus.initial,
    fact: Fact(text: "Cats ", createdAt: ""));
