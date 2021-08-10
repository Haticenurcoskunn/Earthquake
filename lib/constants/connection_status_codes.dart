import 'package:flutter/cupertino.dart';

class ConnectionStatusCodes {
  int succesfullConnectionStatusCode = 200;
  int wrongAccessStatusCode = 403;
}

enum ConnectionStatuses {
  successfullConnectionStatusCode,
  wrongAccessStatusCode,
}

extension connectionStatusCodesGetters on ConnectionStatuses {
  int connectionStatusCodes() {
    switch (this) {
      case ConnectionStatuses.successfullConnectionStatusCode:
        return 202;
      case ConnectionStatuses.wrongAccessStatusCode:
        return 403;
      default:
        return 404;
    }
  }
}

extension connectionStatusErrorWidgets on ConnectionStatuses {
  Widget connectionStatusWidgets() {
    switch (this) {
      case ConnectionStatuses.successfullConnectionStatusCode:
        return Text('Basarili');
      case ConnectionStatuses.wrongAccessStatusCode:
        return Text('Yanlis erisim duzeyi');
      default:
        return Text('404');
    }
  }
}
