import 'package:country_app/infrastructure/connector/service_connector.dart';
import 'package:country_app/infrastructure/external_services/country/response/country_ext_response.dart';
import 'package:country_app/Utils/util.dart';

class CountryExtService {
  static Future<String?> _getCountryAPI() async =>
      await Util.getConfigurationValue('ExternalConnections', 'Country_API');

  static Future<List<CountryExtResponse>?> getCountryInformation(
      String code) async {
    String url = '${await _getCountryAPI()}/v3.1/alpha/$code';
    String? response = await ServiceConnector.getService(url);
    return (response != null && response != "")
        ? countryFromJson(response)
        : null;
  }
}
