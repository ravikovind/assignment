// ignore_for_file: avoid_print
import 'package:assigment/data/helpers/constants.dart';
import 'package:assigment/data/models/astrologer_model.dart';
import 'package:assigment/data/models/location_api_model.dart';
import 'package:assigment/data/models/panchang_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static Future<Map<String, dynamic>> fetchAllAgents() async {
    try {
      final http.Response _apiResponse =
          await http.get(Uri.http(baseUrl, asntroPath));
      print(_apiResponse.body);
      if (_apiResponse.statusCode == 200) {
        final AstrologerModel astrologers =
            astrologerModelFromJson(_apiResponse.body);
        return {
          'status': true,
          'message': 'Data fetched Successfully',
          'data': astrologers
        };
      } else {
        return {'status': false, 'message': 'Error in fetching the data'};
      }
    } on Exception catch (e) {
      return {'status': false, 'message': 'Error in fetching the data\n$e'};
    }
  }

  static Future<Map<String, dynamic>> fetchLocation(String inputPlace) async {
    try {
      final http.Response _apiResponse = await http
          .get(Uri.http(baseUrl, locationPath, {'inputPlace': inputPlace}));
      print(_apiResponse.body);
      if (_apiResponse.statusCode == 200) {
        final LoctionApiModel loctionApiModel =
            loctionApiModelFromJson(_apiResponse.body);
        return {
          'status': true,
          'message': 'Data fetched Successfully',
          'data': loctionApiModel
        };
      } else {
        return {'status': false, 'message': 'Error in fetching the data'};
      }
    } on Exception catch (e) {
      return {'status': false, 'message': 'Error in fetching the data\n$e'};
    }
  }

//Panchang API (POST):- https://www.astrotak.com/astroapi/api/horoscope/daily/panchang
  static Future<Map<String, dynamic>> fetchPanchang(
      int day, int month, int year, String placeId) async {
    try {
      final http.Response _apiResponse =
          await http.post(Uri.http(baseUrl, panchangPath), body: {
        'day': day.toString(),
        'month': month.toString(),
        'year': year.toString(),
        'placeId': placeId,
      });
      print(_apiResponse.body + "=====================");
      print(_apiResponse.statusCode.toString() + "=====================");
      if (_apiResponse.statusCode == 200) {
        final PanchangModel panchang = panchangModelFromJson(_apiResponse.body);
        return {
          'status': true,
          'message': 'Data fetched Successfully',
          'data': panchang
        };
      } else {
        return {'status': false, 'message': 'Error in fetching the data'};
      }
    } on Exception catch (e) {
      return {'status': false, 'message': 'Error in fetching the data\n$e'};
    }
  }
}

// error in panchang api
// redicrected to error - status code: 302

// class DioClient {
//   static final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: baseUrl,
//         connectTimeout: 5000,
//         receiveTimeout: 3000,
//         followRedirects: false,
//         validateStatus: (status) {
//           return status! < 500;
//         }),
//   )..interceptors.add(Logging());

//   static Future<Map<String, dynamic>> fetchPanchang(
//       int day, int month, int year, String placeId) async {
//     final Map<String, dynamic> _params = {
//       'day': day.toString(),
//       'month': month.toString(),
//       'year': year.toString(),
//       'placeId': placeId,
//     };
//     try {
//       Response _apiResponse = await Dio(
//         BaseOptions(
//           baseUrl: baseUrl,
//           connectTimeout: 5000,
//           receiveTimeout: 3000,
//           followRedirects: false,
//           validateStatus: (status) {
//             return status! < 500;
//           },
//         ),
//       ).post(panchangPath, data: _params);
//       if (_apiResponse.statusCode == 200) {
//         final PanchangModel panchang = panchangModelFromJson(_apiResponse.data);
//         return {
//           'status': true,
//           'message': 'Data fetched Successfully',
//           'data': panchang
//         };
//       } else {
//         return {'status': false, 'message': 'Error in fetching the data'};
//       }
//     } on Exception catch (e) {
//       print(e.toString());
//       return {'status': false, 'message': 'Error in fetching the data'};
//     }
//   }
// }
