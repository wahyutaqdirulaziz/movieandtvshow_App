// To parse this JSON data, do
//
//     final tvTopRateModel = tvTopRateModelFromJson(jsonString);

import 'dart:convert';

TvTopRateModel tvTopRateModelFromJson(String str) => TvTopRateModel.fromJson(json.decode(str));

String tvTopRateModelToJson(TvTopRateModel data) => json.encode(data.toJson());

class TvTopRateModel {
    int? page;
    List<Result>? results;
    int? totalPages;
    int? totalResults;

    TvTopRateModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory TvTopRateModel.fromJson(Map<String, dynamic> json) => TvTopRateModel(
        page: json["page"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    String? backdropPath;
    DateTime? firstAirDate;
    List<int>? genreIds;
    int? id;
    String? name;
    List<OriginCountry>? originCountry;
    OriginalLanguage? originalLanguage;
    String? originalName;
    String? overview;
    double? popularity;
    String? posterPath;
    double? voteAverage;
    int? voteCount;

    Result({
        this.backdropPath,
        this.firstAirDate,
        this.genreIds,
        this.id,
        this.name,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.voteAverage,
        this.voteCount,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: json["origin_country"] == null ? [] : List<OriginCountry>.from(json["origin_country"]!.map((x) => originCountryValues.map[x]!)),
        originalLanguage: originalLanguageValues.map[json["original_language"]]!,
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => originCountryValues.reverse[x])),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum OriginCountry { US, JP, CA, KR }

final originCountryValues = EnumValues({
    "CA": OriginCountry.CA,
    "JP": OriginCountry.JP,
    "KR": OriginCountry.KR,
    "US": OriginCountry.US
});

enum OriginalLanguage { EN, JA, KO }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "ja": OriginalLanguage.JA,
    "ko": OriginalLanguage.KO
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
