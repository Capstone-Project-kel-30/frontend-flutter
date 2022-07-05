import 'package:dio/dio.dart';
import 'package:workout_zone/models/membership_payment_model.dart';

import '../../models/membership_model.dart';
import '../../utils/urls/url.dart';
import 'dio.dart';

class MembershipService {
  MembershipService() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  Future<MembershipPaymentModel> membershipRegister({
    required int membershipId,
    required String authorization,
  }) async {
    final Map<String, dynamic> data = {
      "membership_id": membershipId,
    };
    final Map<String, dynamic> header = {
      "Authorization": authorization,
    };
    try {
      final Response response = await dio.post(urls.userRegisterMembership(),
          data: data,
          options: Options(
            headers: header,
          ));
      final MembershipPaymentModel membershipPayment =
          MembershipPaymentModel.fromJson(response.data);
      return membershipPayment;
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

  Future<MembershipPaymentModel> membershipPaymentInfo(
      String authorization) async {
    try {
      final Map<String, String> header = {
        'Authorization': authorization,
      };
      final Response response = await dio.get(
        urls.userMembershipPaymentInfo(),
        options: Options(headers: header),
      );
      final MembershipPaymentModel membershipPayment =
          MembershipPaymentModel.fromJson(response.data);
      return membershipPayment;
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

  Future<MembershipModel> getMembershipDetails() async {
    try {
      final Response response = await dio.get(
        urls.membershipDetails(),
      );
      final MembershipModel membership =
          MembershipModel.fromJson(response.data);
      return membership;
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

  Future<MembershipModel> getMembershipById(String id) async {
    try {
      final Response response = await dio.get(
        urls.membershipDetailById(id),
      );
      final MembershipModel membership =
          MembershipModel.fromJson(response.data);
      return membership;
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
