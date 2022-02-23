import 'package:equatable/equatable.dart';

class Query extends Equatable {
  final String id;
  final String name;
  final List<String> locations;
  final List<String> languages;
  final List<String> includedKeywords;
  final List<String> excludedKeywords;
  final List<String> variations;

  Query({
    this.id,
    this.name,
    this.locations,
    this.languages,
    this.includedKeywords,
    this.excludedKeywords,
    this.variations,
  });

  @override
  List<Object> get props => [
        id,
        name,
        locations,
        languages,
        includedKeywords,
        excludedKeywords,
        variations,
      ];
}
