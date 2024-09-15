import 'package:geolocator/geolocator.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';

class LocationClient {
  static final LocationClient instanse = LocationClient._();

  LocationClient._();
  late bool serviceEnabled;
  late LocationPermission permission;

// طلب الأذونات
  Future<void> requestLocationPermission() async {
    permission = await Geolocator.requestPermission();
  }

// الحصول على الموقع الحالي
  Future<Position> getCurrentLocation() async {
    // التحقق مما إذا كانت خدمة الموقع مفعلة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      // إذا كانت غير مفعلة، اطلب من المستخدم تفعيلها
      Logger.l('message ${LocationPermission.denied}');
      return Future.error('خدمة الموقع غير مفعلة.');
    }

    // التحقق من الأذونات
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Logger.l('message ${LocationPermission.denied}');
        return Future.error('تم رفض الإذن.');
      }
    }
    requestLocationPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error('تم رفض الإذن بشكل دائم.');
    }

    // الحصول على الموقع الحالي
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
