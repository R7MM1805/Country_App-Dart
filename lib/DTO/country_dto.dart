import 'package:country_app/DTO/currency_dto.dart';
import 'package:country_app/DTO/general_dto.dart';
import 'package:country_app/DTO/location_dto.dart';
import 'package:country_app/DTO/region_dto.dart';

class CountryDTO extends GeneralDTO {
  List<CountryDataDTO>? data;

  static CountryDTO setResponse(
          List<CountryDataDTO>? data, String message, int status) =>
      (CountryDTO()
        ..status = status
        ..message = message
        ..data = data);

  @override
  String toString() => _setResponseToString();

  String _setResponseToString() {
    String response = 'No hay información de paises';
    if (data != null) {
      response = '';
      RegionDTO? regionDTO;
      LocationDTO? locationDTO;
      for (CountryDataDTO value in data!) {
        regionDTO = value.region;
        locationDTO = value.location;
        response += '''
===========================
Código: ${value.code}
Pais: ${value.name}
Capital: ${value.capital}
Fronteras: ${value.limits}
Población: ${value.population}
Zona Horaria: ${value.timeZones}
Bandera: ${value.flag}
${_setCurrency(value.currency)}
Región:
  Nombre: ${regionDTO?.name ?? ''}
  SubRegión: ${regionDTO?.subRegion ?? ''}
Location:
  Latitud: ${locationDTO?.latitude ?? 0}
  Longitud: ${locationDTO?.longitude ?? 0}
===========================
''';
      }
    }
    return response;
  }

  String _setCurrency(List<CurrencyDTO>? datas) {
    String response = '';
    if (datas != null && datas.isNotEmpty) {
      int count = 1;
      for (CurrencyDTO data in datas) {
        response += '''
Moneda ($count): 
  Código: ${data.code}
  Moneda: ${data.name}
  Simbolo: ${data.symbol}
''';
        count++;
      }
    }
    return response;
  }
}

class CountryDataDTO {
  String code = '';
  String name = '';
  String capital = '';
  List<String>? limits;
  int? population;
  List<String>? timeZones;
  String flag = '';
  List<CurrencyDTO>? currency;
  RegionDTO? region;
  LocationDTO? location;
}
