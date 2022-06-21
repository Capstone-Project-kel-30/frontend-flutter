class URLS {
  final String _baseUrl = 'https://gym30.herokuapp.com';
  final String _version = 'api/v1';
  final String _auth = 'auth';
  final String _user = 'user';
  final String _member = 'member';
  final String _newsletter = 'newslatter';
  final String _class = 'class';

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
    return '$_baseUrl/$_version/$_user';
  }

  String userRegisterMembership() {
    return '$_baseUrl/$_version/$_member/register';
  }

  String userMembershipPaymentInfo() {
    return '$_baseUrl/$_version/$_member/payment';
  }

  String userBookingClass() {
    return '$_baseUrl/$_version/$_member/booking';
  }

  String userClassSchedule() {
    return '$_baseUrl/$_version/$_member/schedule';
  }

  String getAllClass() {
    return '$_baseUrl/$_version/$_class/all';
  }

  String getClassById(String id) {
    return '$_baseUrl/$_version/$_class/$id';
  }

  String searchClass() {
    return '$_baseUrl/$_version/$_class/search';
  }

  String getAllNewsletter() {
    return '$_baseUrl/$_version/$_newsletter/all';
  }

  String getNewsletterById(String id) {
    return '$_baseUrl/$_version/$_newsletter/$id';
  }
}

final URLS urls = URLS();
