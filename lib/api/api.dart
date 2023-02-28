// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String api_worker_profile_view = "http://10.0.2.2:8000/api/user/profile";
const String api_login_view = "http://10.0.2.2:8000/api/user/login/";
const String api_get_current_user = "http://10.0.2.2:8000/api/user/get_current_user/";


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

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}