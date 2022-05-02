import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'facts_client.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/facts")
  Future<List<Fact>> fetchFacts();

  @GET("/facts/random")
  Future<Fact> fetchRandomFact();
}

@JsonSerializable()
class Fact {
  String text;
  String createdAt;

  Fact({required this.text, required this.createdAt});

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
