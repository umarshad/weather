import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/Components/Constants/colors.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.greenColor,
        textColor: AppColors.whiteColor,
        fontSize: 16.0);
  }
}
