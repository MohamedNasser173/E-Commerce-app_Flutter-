import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:get/get.dart';
import '../core/view_model/auth_view_model.dart';
import '../core/view_model/cart_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../core/view_model/profile_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => ControlViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => CartViewModel(), fenix: true);
    Get.lazyPut(() => LocalStorgeData(), fenix: true);
    Get.lazyPut(() => ProfileViewModel(), fenix: true);
  }
}
