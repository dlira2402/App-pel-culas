import 'dart:convert';

class Cast {
  final int id;
  final String name;
  final String character;
  final String? profilePath;

  Cast({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });

  String get fullProfileImg {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w200$profilePath';
    }
    return 'https://via.placeholder.com/200x300?text=No+Image';
  }

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        id: json["id"],
        name: json["name"] ?? '',
        character: json["character"] ?? '',
        profilePath: json["profile_path"],
      );
}

class CreditsResponse {
  final List<Cast> cast;

  CreditsResponse({required this.cast});

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
      );
}
