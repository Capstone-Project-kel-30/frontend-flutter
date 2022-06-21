import 'package:dio/dio.dart';

import '../../utils/urls/url.dart';
import 'dio.dart';

class MembershipService {
  MembershipService() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  membershipRegister({
    required String userId,
    required String amount,
    required String tier,
  }) async {
    final Map<String, String> data = {
      'user_id': userId,
      'amount': amount,
      'tier': tier,
    };
    try {
      final Response response = await dio.post(
        urls.userRegisterMembership(),
        data: data,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    }
  }

  membershipPaymentInfo(String authorization) async {
    try {
      final Map<String, String> header = {
        'Authorization': authorization,
      };
      final Response response = await dio.get(
        urls.userMembershipPaymentInfo(),
        options: Options(headers: header),
      );
    } on DioError catch (e) {
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    }
  }

  bookingClass({required String userId, required String classId}) async {
    final Map<String, String> data = {
      'user_id': userId,
      'class_id': classId,
    };
    try {
      final Response response = await dio.post(
        urls.userBookingClass(),
        data: data,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    }
  }

  userClassSchedule(String authorization) async {
    try {
      final Map<String, String> header = {
        'Authorization': authorization,
      };
      final Response response = await dio.get(
        urls.userClassSchedule(),
        options: Options(headers: header),
      );
    } on DioError catch (e) {
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    }
  }
}
