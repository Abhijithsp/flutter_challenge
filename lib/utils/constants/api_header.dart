import '../services/get_storage_service.dart';

class ApiHeader {
  Map<String, String> getHeader() {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${GetStorageService().getUserToken()}',
    };
  }
}
