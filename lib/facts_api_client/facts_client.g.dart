// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      text: json['text'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'text': instance.text,
      'createdAt': instance.createdAt,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://cat-fact.herokuapp.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Fact>> fetchFacts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Fact>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/facts',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Fact.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Fact> fetchRandomFact() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Fact>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/facts/random',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Fact.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
