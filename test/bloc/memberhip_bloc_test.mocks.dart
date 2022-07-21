// Mocks generated by Mockito 5.2.0 from annotations
// in workout_zone/test/bloc/memberhip_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:workout_zone/models/book_info_model.dart' as _i4;
import 'package:workout_zone/models/membership_model.dart' as _i3;
import 'package:workout_zone/models/membership_payment_model.dart' as _i2;
import 'package:workout_zone/services/remotes/membership_service.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMembershipPaymentModel_0 extends _i1.Fake
    implements _i2.MembershipPaymentModel {}

class _FakeMembershipModel_1 extends _i1.Fake implements _i3.MembershipModel {}

class _FakeBookInfoModel_2 extends _i1.Fake implements _i4.BookInfoModel {}

/// A class which mocks [MembershipService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMembershipService extends _i1.Mock implements _i5.MembershipService {
  MockMembershipService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.MembershipPaymentModel> membershipRegister(
          {int? membershipId, String? authorization}) =>
      (super.noSuchMethod(
              Invocation.method(#membershipRegister, [],
                  {#membershipId: membershipId, #authorization: authorization}),
              returnValue: Future<_i2.MembershipPaymentModel>.value(
                  _FakeMembershipPaymentModel_0()))
          as _i6.Future<_i2.MembershipPaymentModel>);
  @override
  _i6.Future<_i2.MembershipPaymentModel> membershipPaymentInfo(
          String? authorization) =>
      (super.noSuchMethod(
              Invocation.method(#membershipPaymentInfo, [authorization]),
              returnValue: Future<_i2.MembershipPaymentModel>.value(
                  _FakeMembershipPaymentModel_0()))
          as _i6.Future<_i2.MembershipPaymentModel>);
  @override
  _i6.Future<_i3.MembershipModel> getMembershipDetails() =>
      (super.noSuchMethod(Invocation.method(#getMembershipDetails, []),
              returnValue:
                  Future<_i3.MembershipModel>.value(_FakeMembershipModel_1()))
          as _i6.Future<_i3.MembershipModel>);
  @override
  _i6.Future<_i3.MembershipModel> getMembershipById(String? id) =>
      (super.noSuchMethod(Invocation.method(#getMembershipById, [id]),
              returnValue:
                  Future<_i3.MembershipModel>.value(_FakeMembershipModel_1()))
          as _i6.Future<_i3.MembershipModel>);
  @override
  _i6.Future<_i4.BookInfoModel> bookingClass(
          {int? userId, int? classId, String? authorization}) =>
      (super.noSuchMethod(
              Invocation.method(#bookingClass, [], {
                #userId: userId,
                #classId: classId,
                #authorization: authorization
              }),
              returnValue:
                  Future<_i4.BookInfoModel>.value(_FakeBookInfoModel_2()))
          as _i6.Future<_i4.BookInfoModel>);
}
