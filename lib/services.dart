import 'package:http/http.dart' as http;
import 'package:rmr_attendance/values.dart';

Future<http.Response> loginService (Map<String, String> headers, Map<String, String> body) async {
  try {
    var response = await http.post(
        BASE_URL + API_TOKEN, headers: headers, body: body);
    return response;
  } catch(error) {
    return null;
  }
}

Future<http.Response> forgetPasswordService (Map<String, String> headers) async {
  return await http.post(BASE_URL+API_FORGET_PASSWORD, headers: headers);
}

Future<http.Response> userByEmailService (Map<String, String> headers) async {
  return await http.get(BASE_URL+API_GET_USER_BY_EMAIL, headers: headers);
}

Future<http.Response> companyListService (Map<String, String> headers) async {
  return await http.get(BASE_URL+API_GET_COMPANY_LIST, headers: headers);
}