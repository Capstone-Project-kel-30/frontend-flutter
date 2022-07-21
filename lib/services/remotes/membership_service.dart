import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:workout_zone/models/book_info_model.dart';
import 'package:workout_zone/models/membership_payment_model.dart';

import '../../models/membership_model.dart';
import '../../utils/urls/url.dart';
import 'dio.dart';
import 'dio_error_handler.dart';

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
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
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
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
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
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
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
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<BookInfoModel> bookingClass({
    required int userId,
    required int classId,
    required String authorization,
  }) async {
    final Map<String, dynamic> header = {
      'Authorization': authorization,
    };
    final Map<String, dynamic> data = {
      'user_id': userId,
      'class_id': classId,
    };
    try {
      final Response response = await dio.post(
        urls.userBookingClass(),
        data: data,
        options: Options(headers: header),
      );
      final BookInfoModel bookInfo = BookInfoModel.fromJson(response.data);
      return bookInfo;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }
}
