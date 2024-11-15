import 'package:country_app/global/global_dto.dart';
import 'package:country_app/service/country_service.dart';

void main(List<String> arguments) async {
  CountryService countryRepository = CountryService();
  CountryDTO countryDTO = await countryRepository.getCountryByCode('col');
  print(countryDTO);
}
