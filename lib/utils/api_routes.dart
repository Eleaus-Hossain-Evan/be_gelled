// ignore_for_file: constant_identifier_names

class APIRoute {
  static const String DUMMY_PERSON = 'https://i.pravatar.cc/300';
  static const String WEB_URL = "";

  static const String BASE_URL = "https://appapi.begelled.com/";
  // static const String BASE_URL = "https://api.senaiyah.com/";
  // static const String BASE_URL_LOCAL = "http://192.168.68.118:3697/";
  static const String API_V1 = "api/v1/";

  static const String SIGNUP = "${API_V1}customer/registration";
  static const String LOGIN_SEND_OTP = "${API_V1}customer/phone/login";
  static const String LOGIN_CHECK_OTP = "${API_V1}customer/phone/otp-check";

  //:<<-------------------------------------------------->>
  //:<<------------------- BeGelled --------------------->>
  //:<<-------------------------------------------------->>

  static const String HOME = "${API_V1}home-page/view";

  //'<<---------------- Family Member ------------------>>

  static const String ADD_FAMILY_MEMBER = "${API_V1}customer/add-family-member";
  static const String GET_FAMILY_MEMBER =
      "${API_V1}customer/get-family-members";

  //'<<---------------- Product ------------------>>

  static const String SUGGESTION = "${API_V1}products/order/get-suggestions";
  static const String PRODUCT_BY_CATEGORY = "${API_V1}products/by-category";

  //'<<----------------Order------------------>>

  static const String ORDER_CREATE = "${API_V1}products/fixed-order/create";
}
