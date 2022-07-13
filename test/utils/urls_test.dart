import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/utils/urls/url.dart';

void main() {
  const String baseUrl = "https://gym-30-v2.herokuapp.com/api/v1";
  group('auth', () {
    const String baseAuth = '$baseUrl/auth';
    test('register', () {
      const matcher = '$baseAuth/register';
      final actual = urls.userRegister();
      expect(actual, matcher);
    });
    test('login', () {
      const matcher = '$baseAuth/login';
      final actual = urls.userLogin();
      expect(actual, matcher);
    });
    test('reset password', () {
      const matcher = '$baseAuth/reset-password';
      final actual = urls.userResetPassword();
      expect(actual, matcher);
    });
    test('verify email', () {
      const matcher = '$baseAuth/verify-email';
      final actual = urls.verifyUserEmail();
      expect(actual, matcher);
    });
  });
  group('user', () {
    const baseUser = '$baseUrl/user';
    test('user profile', () {
      const matcher = '$baseUser/profile';
      final actual = urls.userProfile();
      expect(actual, matcher);
    });
    test('update user profile', () {
      const matcher = '$baseUser/profile';
      final actual = urls.updateUserProfile();
      expect(actual, matcher);
    });
  });
  group('membership', () {
    const baseMembership = '$baseUrl/member';
    test('register membership', () {
      const matcher = '$baseMembership/register';
      final actual = urls.userRegisterMembership();
      expect(actual, matcher);
    });
    test('membership payment info', () {
      const matcher = '$baseMembership/payment';
      final actual = urls.userMembershipPaymentInfo();
      expect(actual, matcher);
    });
    test('membership detail', () {
      const matcher = '${baseMembership}ship/list';
      final actual = urls.membershipDetails();
      expect(actual, matcher);
    });
    test('membership detail by id', () {
      const matcher = '${baseMembership}ship/2';
      final actual = urls.membershipDetailById('2');
      expect(actual, matcher);
    });
    test('booking class', () {
      const matcher = '$baseMembership/booking';
      final actual = urls.userBookingClass();
      expect(actual, matcher);
    });
    test('schedule', () {
      const matcher = '$baseMembership/schedule';
      final actual = urls.userClassSchedule();
      expect(actual, matcher);
    });
  });
  group('class', () {
    const baseClass = '$baseUrl/class';
    test('all class', () {
      const matcher = '$baseClass/list';
      final actual = urls.getAllClass();
      expect(actual, matcher);
    });
    test('search class', () {
      const matcher = '$baseClass/search';
      final actual = urls.searchClass();
      expect(actual, matcher);
    });
    group('online class', () {
      const baseOnlineClass = '$baseClass/online';
      test('all online class', () {
        const matcher = '$baseOnlineClass/list';
        final actual = urls.getAllOnlineClass();
        expect(actual, matcher);
      });
      test('online class by id', () {
        const matcher = '$baseOnlineClass/2';
        final actual = urls.getOnlineClassById('2');
        expect(actual, matcher);
      });
    });
    group('offline class', () {
      const basefflineClass = '$baseClass/offline';
      test('all offline class', () {
        const matcher = '$basefflineClass/list';
        final actual = urls.getAllOfflineClass();
        expect(actual, matcher);
      });
      test('offline class by id', () {
        const matcher = '$basefflineClass/2';
        final actual = urls.getOfflineClassById('2');
        expect(actual, matcher);
      });
    });
  });
  group('newsletter', () {
    const baseNewsletter = '$baseUrl/newsletter';
    test('all newsletter', () {
      const matcher = '$baseNewsletter/list';
      final actual = urls.getAllNewsletter();
      expect(actual, matcher);
    });
    test('newsletter by id', () {
      const matcher = '$baseNewsletter/2';
      final actual = urls.getNewsletterById('2');
      expect(actual, matcher);
    });
  });
}
