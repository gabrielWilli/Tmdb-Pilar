import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfoAbs {
  Future<bool> isConnected();
}

@LazySingleton(as: NetworkInfoAbs)
class NetworkInfo implements NetworkInfoAbs {
  @override
  Future<bool> isConnected() async {
    if (kIsWeb) return true;

    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
