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

  //'<<---------------- Product ------------------>>

  static const String SUGGESTION = "${API_V1}products/order/get-suggestions";
  static const String PRODUCT_BY_CATEGORY = "${API_V1}products/by-category";

  //'<<----------------Notification------------------>>

  static const String NOTIFICATION =
      "${API_V1}car/vendor/submitted/others-problem/user/un-accepted/list/view";
  static const String ACCEPTED_OTHER_PROBLEM =
      "${API_V1}car/vendor/submitted/others-problem/amount-time/user/accept";
  static const String ON_GOING_PACKAGE =
      "${API_V1}car/user/submitted/problem/vendor-accepted/list/view-by/user";
  static const String COMPLETED_PACKAGE =
      "${API_V1}car/user/completed/all-problem/list";
  static const String SUBMIT_REVIEW =
      "${API_V1}car/service/rating-review/create";

  //'<<----------------Profile------------------>>
  static const String CAR_SERVICE_VIEW_ALL =
      "${API_V1}car/customer/service/all";
  static const String CAR_SERVICE_ADD = "${API_V1}car/customer/service/create";
  static const String CAR_SERVICE_UPDATE =
      "${API_V1}car/customer/service/update";

  //'<<----------------Order------------------>>
  static const String BIDDING_CREATE =
      "${API_V1}car-parts/biding/create/by-customer";
  static const String MY_BIDS = "${API_V1}car-parts/biding/by-customer";
  static const String ORDER_CREATE =
      "${API_V1}car-parts/order/by-customer/create";
}
