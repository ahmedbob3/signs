
// import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:signs/Exceptions/network_error.dart';

abstract class Repo {
  void handleError(SignsError error);
  // Future<void> sendAnalyticsEvent(FirebaseAnalytics analytics,String tagName, String parameter , String parameterValue);

}

class BaseRepo implements Repo {
  @override
  void handleError(SignsError error) {
    // TODO: implement handleError
    print("plz handel this error>>>" + error.errorMessage);
  }
}