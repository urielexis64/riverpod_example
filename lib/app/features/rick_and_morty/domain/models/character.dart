import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

/// Represents a character in the Rick & Morty universe.
@JsonSerializable(createToJson: false)
class Character {
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.gender,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String gender;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
