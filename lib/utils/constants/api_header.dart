import '../services/get_storage_service.dart';

class API_Header {
  Map<String, String> getHeader() {
    Map<String, String> requestHeaders;
    return requestHeaders = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + getStorage().getUserToken()
    };
  }
}
