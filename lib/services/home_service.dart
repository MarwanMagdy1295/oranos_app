import 'package:dio/dio.dart';
import 'package:oranos_app/models/experts.dart';
import 'package:oranos_app/services/client.dart';
import 'package:oranos_app/services/helper.dart';

class HomeService {
  Future<List<Experts>> getHomeExperts() async {
    try {
      var response = await get('experts');
      return List<Experts>.from(response.data.map((x) => Experts.fromJson(x)));
    } catch (e) {
      Future<Response<dynamic>> error = handleError(e);
      throw (error);
    }
  }

  Future<List<Experts>> getOnlineExperts() async {
    try {
      var response = await get('online/experts');
      return List<Experts>.from(response.data.map((x) => Experts.fromJson(x)));
      ;
    } catch (e) {
      Future<Response<dynamic>> error = handleError(e);
      throw (error);
    }
  }
}
