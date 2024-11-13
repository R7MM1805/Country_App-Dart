import 'dart:convert';

List<CountryExtResponse> countryFromJson(String str) =>
    List<CountryExtResponse>.from(
        json.decode(str).map((x) => CountryExtResponse.fromJson(x)));

String countryToJson(List<CountryExtResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryExtResponse {
  NameExtResponse? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Map<String, CurrencyExtResponse>? currencies;
  IddExtResponse? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Map<String, dynamic>? languages;
  Map<String, TranslationExtResponse>? translations;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  Map<String, DemonymsExtResponse>? demonyms;
  String? flag;
  MapsExtResponse? maps;
  int? population;
  Map<String, dynamic>? gini;
  String? fifa;
  CarExtResponse? car;
  List<String>? timezones;
  List<String>? continents;
  FlagsExtResponse? flags;
  CoatOfArmsExtResponse? coatOfArms;
  String? startOfWeek;
  CapitalInfoExtResponse? capitalInfo;

  CountryExtResponse({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
  });

  factory CountryExtResponse.fromJson(Map<String, dynamic> json) =>
      CountryExtResponse(
        name: (json["name"] != null)
            ? NameExtResponse.fromJson(json["name"])
            : null,
        tld: (json["tld"] != null)
            ? List<String>.from(json["tld"]!.map((x) => x))
            : null,
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: (json["currencies"] != null)
            ? (json["currencies"] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, CurrencyExtResponse.fromJson(v)))
            : null,
        idd:
            (json["idd"] != null) ? IddExtResponse.fromJson(json["idd"]) : null,
        capital: (json["capital"] != null)
            ? List<String>.from(json["capital"]!.map((x) => x))
            : [],
        altSpellings: (json["altSpellings"] != null)
            ? List<String>.from(json["altSpellings"]!.map((x) => x))
            : [],
        region: json["region"],
        subregion: json["subregion"],
        languages: (json["languages"] != null)
            ? (json["languages"] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, v))
            : null,
        translations: (json["translations"] != null)
            ? (json["translations"] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, TranslationExtResponse.fromJson(v)))
            : null,
        latlng: (json["latlng"] != null)
            ? List<double>.from(json["latlng"]!.map((x) => x))
            : null,
        landlocked: json["landlocked"],
        borders: (json["borders"] != null)
            ? List<String>.from(json["borders"]!.map((x) => x))
            : [],
        area: json["area"],
        demonyms: (json["demonyms"] != null)
            ? (json["demonyms"] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, DemonymsExtResponse.fromJson(v)))
            : null,
        flag: json["flag"],
        maps: (json["maps"] != null)
            ? MapsExtResponse.fromJson(json["maps"])
            : null,
        population: json["population"],
        gini: (json["gini"] != null)
            ? (json["gini"] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, v))
            : null,
        fifa: json["fifa"],
        car:
            (json["car"] != null) ? CarExtResponse.fromJson(json["car"]) : null,
        timezones: (json["timezones"] != null)
            ? List<String>.from(json["timezones"]!.map((x) => x))
            : [],
        continents: (json["continents"] != null)
            ? List<String>.from(json["continents"]!.map((x) => x))
            : [],
        flags: (json["flags"] != null)
            ? FlagsExtResponse.fromJson(json["flags"])
            : null,
        coatOfArms: (json["coatOfArms"] != null)
            ? CoatOfArmsExtResponse.fromJson(json["coatOfArms"])
            : null,
        startOfWeek: json["startOfWeek"],
        capitalInfo: (json["capitalInfo"] != null)
            ? CapitalInfoExtResponse.fromJson(json["capitalInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "tld": tld,
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": currencies?.map((k, v) => MapEntry(k, v.toJson())),
        "idd": idd?.toJson(),
        "capital": capital,
        "altSpellings": altSpellings,
        "region": region,
        "subregion": subregion,
        "languages": languages?.map((k, v) => MapEntry(k, v)),
        "translations": translations?.map((k, v) => MapEntry(k, v.toJson())),
        "latlng": latlng,
        "landlocked": landlocked,
        "borders": borders,
        "area": area,
        "demonyms": demonyms?.map((k, v) => MapEntry(k, v.toJson())),
        "flag": flag,
        "maps": maps?.toJson(),
        "population": population,
        "gini": gini?.map((k, v) => MapEntry(k, v)),
        "fifa": fifa,
        "car": car?.toJson(),
        "timezones": timezones,
        "continents": continents,
        "flags": flags?.toJson(),
        "coatOfArms": coatOfArms?.toJson(),
        "startOfWeek": startOfWeek,
        "capitalInfo": capitalInfo?.toJson(),
      };
}

class NameExtResponse {
  String? common;
  String? official;
  Map<String, NativeNameExtResponse>? nativeName;

  NameExtResponse({
    this.common,
    this.official,
    this.nativeName,
  });

  factory NameExtResponse.fromJson(Map<String, dynamic> json) =>
      NameExtResponse(
        common: json["common"],
        official: json["official"],
        nativeName: (json["nativeName"] != null)
            ? (json["nativeName"] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, NativeNameExtResponse.fromJson(v)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.map((k, v) => MapEntry(k, v.toJson())),
      };
}

class NativeNameExtResponse {
  String? official;
  String? common;

  NativeNameExtResponse({
    this.common,
    this.official,
  });

  factory NativeNameExtResponse.fromJson(Map<String, dynamic> json) =>
      NativeNameExtResponse(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class CurrencyExtResponse {
  String? name;
  String? symbol;

  CurrencyExtResponse({
    this.name,
    this.symbol,
  });

  factory CurrencyExtResponse.fromJson(Map<String, dynamic> json) =>
      CurrencyExtResponse(
        name: json["name"],
        symbol: json["symbol"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class IddExtResponse {
  String? root;
  List<String>? suffixes;

  IddExtResponse({
    this.root,
    this.suffixes,
  });

  factory IddExtResponse.fromJson(Map<String, dynamic> json) => IddExtResponse(
        root: json["root"],
        suffixes: (json["suffixes"] != null)
            ? List<String>.from(json["suffixes"]!.map((x) => x))
            : [],
      );
  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": suffixes,
      };
}

class TranslationExtResponse {
  String? official;
  String? common;

  TranslationExtResponse({
    this.common,
    this.official,
  });

  factory TranslationExtResponse.fromJson(Map<String, dynamic> json) =>
      TranslationExtResponse(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class DemonymsExtResponse {
  String? f;
  String? m;

  DemonymsExtResponse({
    this.f,
    this.m,
  });

  factory DemonymsExtResponse.fromJson(Map<String, dynamic> json) =>
      DemonymsExtResponse(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class MapsExtResponse {
  String? googleMaps;
  String? openStreetMaps;

  MapsExtResponse({
    this.googleMaps,
    this.openStreetMaps,
  });

  factory MapsExtResponse.fromJson(Map<String, dynamic> json) =>
      MapsExtResponse(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class CarExtResponse {
  List<String>? signs;
  String? side;

  CarExtResponse({
    this.signs,
    this.side,
  });

  factory CarExtResponse.fromJson(Map<String, dynamic> json) => CarExtResponse(
        signs: (json["signs"] != null)
            ? List<String>.from(json["signs"]!.map((x) => x))
            : [],
        side: json["side"],
      );

  Map<String, dynamic> toJson() => {
        "signs": signs,
        "side": side,
      };
}

class FlagsExtResponse {
  String? png;
  String? svg;
  String? alt;

  FlagsExtResponse({
    this.png,
    this.svg,
    this.alt,
  });

  factory FlagsExtResponse.fromJson(Map<String, dynamic> json) =>
      FlagsExtResponse(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class CoatOfArmsExtResponse {
  String? png;
  String? svg;

  CoatOfArmsExtResponse({
    this.png,
    this.svg,
  });

  factory CoatOfArmsExtResponse.fromJson(Map<String, dynamic> json) =>
      CoatOfArmsExtResponse(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

class CapitalInfoExtResponse {
  List<double>? latlng;

  CapitalInfoExtResponse({
    this.latlng,
  });

  factory CapitalInfoExtResponse.fromJson(Map<String, dynamic> json) =>
      CapitalInfoExtResponse(
        latlng: (json["latlng"] != null)
            ? List<double>.from(json["latlng"]!.map((x) => x))
            : null,
      );
  Map<String, dynamic> toJson() => {
        "latlng": latlng,
      };
}
