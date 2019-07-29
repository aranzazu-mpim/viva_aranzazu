library aranzazu_search_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'aranzazu_search_result.g.dart';

abstract class AranzazuSearchResult
    implements Built<AranzazuSearchResult, AranzazuSearchResultBuilder> {
  @nullable
  String get nextPage;
  BuiltList<SearchItems> get items;

  AranzazuSearchResult._();

  factory AranzazuSearchResult([updates(AranzazuSearchResultBuilder b)]) =
      _$AranzazuSearchResult;

  String toJson() {
    return json.encode(
        serializers.serializeWith(AranzazuSearchResult.serializer, this));
  }

  static AranzazuSearchResult fromJson(String jsonString) {
    return serializers.deserializeWith(
        AranzazuSearchResult.serializer, json.decode(jsonString));
  }

  static Serializer<AranzazuSearchResult> get serializer =>
      _$AranzazuSearchResultSerializer;
}
