import 'package:dio/dio.dart';
import 'package:workout_zone/utils/urls/url.dart';

class MembershipService {
  final Dio _dio = Dio();
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
      final Response response = await _dio.post(
        urls.userRegisterMembership(),
        data: data,
      );
    } catch (e) {
      throw ('Server Error');
    }
  }

  membershipPaymentInfo(String authorization) async {
    try {
      final Map<String, String> header = {
        'Authorization': authorization,
      };
      final Response response = await _dio.get(
        urls.userMembershipPaymentInfo(),
        options: Options(headers: header),
      );
    } catch (e) {
      throw ('Server Error');
    }
  }

  bookingClass({required String userId, required String classId}) async {
    final Map<String, String> data = {
      'user_id': userId,
      'class_id': classId,
    };
    try {
      final Response response = await _dio.post(
        urls.userBookingClass(),
        data: data,
      );
    } catch (e) {
      throw ('Server Error');
    }
  }

  userClassSchedule(String authorization) async {
    try {
      final Map<String, String> header = {
        'Authorization': authorization,
      };
      final Response response = await _dio.get(
        urls.userClassSchedule(),
        options: Options(headers: header),
      );
    } catch (e) {
      throw ('Server Error');
    }
  }
}
