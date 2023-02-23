// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const String api_worker_profile_view = "http://10.0.2.2:8000/api/user/profile";


Future<bool> isUserAuth() async{
  try {
      http.Response response = await http.get(Uri.parse(api_worker_profile_view));
      if (response.statusCode == 401) {
        return false;
      }else{
        return true;
      }
  } catch (e) {
    print("This error is $e");
    return false;
  }
}