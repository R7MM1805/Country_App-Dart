import 'package:country_app/DTO/country_dto.dart';
import 'package:country_app/DTO/currency_dto.dart';
import 'package:country_app/DTO/location_dto.dart';
import 'package:country_app/DTO/region_dto.dart';
import 'package:country_app/Infrastructure/ExternalServices/Country/Response/country_ext_response.dart';
import 'package:country_app/Infrastructure/ExternalServices/Country/Service/country_ext_service.dart';

class CountryService {
  Future<CountryDTO> getCountryByCode(String code) async {
    List<CountryExtResponse>? datas =
        await CountryExtService.getCountryInformation(code);
    return (datas != null && datas.isNotEmpty)
        ? _mappingCountryDTO(datas)
        : CountryDTO.setResponse(
            null,
            'Ocurrió un problema con la obtención de la información de paises',
            500);
  }

  CountryDTO _mappingCountryDTO(List<CountryExtResponse> datas) {
    List<CountryDataDTO> countries = _mappingCountryData(datas);
    bool hasData = (countries.isNotEmpty);
    String? message = hasData
        ? 'Se muestra la información del país'
        : 'No se obtuvo información del país';
    int status = hasData ? 200 : 500;
    return CountryDTO.setResponse(countries, message, status);
  }

  List<CountryDataDTO> _mappingCountryData(List<CountryExtResponse> datas) {
    List<CountryDataDTO> datasDTO = [];
    for (CountryExtResponse data in datas) {
      datasDTO.add(_addCountryData(data));
    }
    return datasDTO;
  }

  CountryDataDTO _addCountryData(CountryExtResponse data) => CountryDataDTO()
    ..code = data.cca2 ?? ''
    ..name = data.name?.common ?? ''
    ..capital = _convertListToString(data.capital)
    ..limits = data.borders
    ..population = data.population
    ..timeZones = data.timezones
    ..flag = data.flags?.svg ?? data.flags?.png ?? ''
    ..currency = _setCurrency(data.currencies)
    ..region = _setRegion(data)
    ..location = _setLocation(data.latlng);

  String _convertListToString(List<String>? datas) {
    String response = '';
    if (datas != null && datas.isNotEmpty) {
      for (String data in datas) {
        response += '$data¬';
      }
      response = response.substring(0, response.length - 1);
    }
    return response;
  }

  List<CurrencyDTO> _setCurrency(Map<String, CurrencyExtResponse>? currency) {
    List<CurrencyDTO> response = [];
    if (currency != null && currency.isNotEmpty) {
      currency.forEach((k, v) => response.add(_addCurrency(k, v)));
    }
    return response;
  }

  CurrencyDTO _addCurrency(String key, CurrencyExtResponse extResponse) =>
      CurrencyDTO()
        ..code = key
        ..name = extResponse.name ?? ''
        ..symbol = extResponse.symbol ?? '';

  RegionDTO _setRegion(CountryExtResponse data) => RegionDTO()
    ..name = data.region ?? ''
    ..subRegion = data.subregion ?? '';

  LocationDTO _setLocation(List<double>? latlng) => LocationDTO()
    ..latitude = latlng?.first ?? 0
    ..longitude = latlng?.last ?? 0;
}
