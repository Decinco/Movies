import 'dart:convert';

import 'movie.dart';

class Actor {
  bool adult;
  int gender;
  int id;
  String known_for_department;
  double popularity;
  String profile_path;
  String name;
  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.known_for_department,
    required this.popularity,
    required this.profile_path,
    required this.name,
  });

  factory Actor.fromMap(Map<String, dynamic> map) {
      return Actor(
          adult: map['adult'] as bool,
          gender: map['gender'] as int,
          id: map['id'] as int,
          known_for_department: map['known_for_department'] ?? '',
          popularity: map['popularity']?.toDouble() ?? 0.0,
          profile_path: map['profile_path'] ?? '',
          name: map['name']
      );
  }

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source));
}