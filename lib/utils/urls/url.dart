class URLS {
  final String _baseUrl = 'https://gym-30-v2.herokuapp.com';
  final String _version = 'api/v1';
  final String _auth = 'auth';
  final String _user = 'user';
  final String _member = 'member';
  final String _newsletter = 'newsletter';
  final String _class = 'class';
  final String _online = 'online';
  final String _offline = 'offline';

  String userRegister() {
    return '$_baseUrl/$_version/$_auth/register';
  }

  String userLogin() {
    return '$_baseUrl/$_version/$_auth/login';
  }

  String userResetPassword() {
    return '$_baseUrl/$_version/$_auth/reset-password';
  }

  String verifyUserEmail() {
    return '$_baseUrl/$_version/$_auth/verify-email';
  }

  String userProfile() {
    return '$_baseUrl/$_version/$_user/profile';
  }

  String updateUserProfile() {
    return '$_baseUrl/$_version/$_user/profile';
  }

  String userRegisterMembership() {
    return '$_baseUrl/$_version/$_member/register';
  }

  String userMembershipPaymentInfo() {
    return '$_baseUrl/$_version/$_member/payment';
  }

  String membershipDetails() {
    return '$_baseUrl/$_version/${_member}ship/list';
  }

  String membershipDetailById(String id) {
    return '$_baseUrl/$_version/${_member}ship/$id';
  }

  String userBookingClass() {
    return '$_baseUrl/$_version/$_member/booking';
  }

  String userClassSchedule() {
    return '$_baseUrl/$_version/$_member/schedule';
  }

  String getAllClass() {
    return '$_baseUrl/$_version/$_class/list';
  }

  String getAllOnlineClass() {
    return '$_baseUrl/$_version/$_class/$_online/list';
  }

  String getOnlineClassById(String id) {
    return '$_baseUrl/$_version/$_class/$_online/$id';
  }

  String searchOnlineClass() {
    return '$_baseUrl/$_version/$_class/$_online/search';
  }

  String getAllOfflineClass() {
    return '$_baseUrl/$_version/$_class/$_offline/list';
  }

  String getOfflineClassById(String id) {
    return '$_baseUrl/$_version/$_class/$_offline/$id';
  }

  String searchOfflineClass() {
    return '$_baseUrl/$_version/$_class/$_offline/search';
  }

  String getAllNewsletter() {
    return '$_baseUrl/$_version/$_newsletter/list';
  }

  String getNewsletterById(String id) {
    return '$_baseUrl/$_version/$_newsletter/$id';
  }
}

final URLS urls = URLS();
