import 'package:country_app/global/global_dto.dart' as dto;
import 'package:country_app/infrastructure/external_services/country/response/country_ext_response.dart';
import 'package:country_app/infrastructure/external_services/country/service/country_ext_service.dart';

class CountryService {
  Future<dto.CountryDTO> getCountryByCode(String code) async {
    List<CountryExtResponse>? datas =
        await CountryExtService.getCountryInformation(code);
    return (datas != null && datas.isNotEmpty)
        ? _mappingCountryDTO(datas)
        : dto.CountryDTO.setResponse(
            null,
            'Ocurrió un problema con la obtención de la información de paises',
            500);
  }

  dto.CountryDTO _mappingCountryDTO(List<CountryExtResponse> datas) {
    List<dto.CountryDataDTO> countries = _mappingCountryData(datas);
    bool hasData = (countries.isNotEmpty);
    String? message = hasData
        ? 'Se muestra la información del país'
        : 'No se obtuvo información del país';
    int status = hasData ? 200 : 500;
    return dto.CountryDTO.setResponse(countries, message, status);
  }

  List<dto.CountryDataDTO> _mappingCountryData(List<CountryExtResponse> datas) {
    List<dto.CountryDataDTO> datasDTO = [];
    for (CountryExtResponse data in datas) {
      datasDTO.add(_addCountryData(data));
    }
    return datasDTO;
  }

  dto.CountryDataDTO _addCountryData(CountryExtResponse data) =>
      dto.CountryDataDTO()
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

  List<dto.CurrencyDTO> _setCurrency(
      Map<String, CurrencyExtResponse>? currency) {
    List<dto.CurrencyDTO> response = [];
    if (currency != null && currency.isNotEmpty) {
      currency.forEach((k, v) => response.add(_addCurrency(k, v)));
    }
    return response;
  }

  dto.CurrencyDTO _addCurrency(String key, CurrencyExtResponse extResponse) =>
      dto.CurrencyDTO()
        ..code = key
        ..name = extResponse.name ?? ''
        ..symbol = extResponse.symbol ?? '';

  dto.RegionDTO _setRegion(CountryExtResponse data) => dto.RegionDTO()
    ..name = data.region ?? ''
    ..subRegion = data.subregion ?? '';

  dto.LocationDTO _setLocation(List<double>? latlng) => dto.LocationDTO()
    ..latitude = latlng?.first ?? 0
    ..longitude = latlng?.last ?? 0;
}
