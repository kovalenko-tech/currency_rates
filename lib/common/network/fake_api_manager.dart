import 'package:logger/logger.dart';

final _logger = Logger();

enum FakeApi {
  currency;

  bool get isEnabled => FakeApiManager.isFakeApiEnabled(this);
  void setEnabled(bool enabled) => FakeApiManager.setFakeApiEnabled(this, enabled);
}

class FakeApiManager {
  static final _enabledFakeApi = <FakeApi>{
    //Place here fake api that should be enabled by default
    //FakeApi.currency,
  };

  static isFakeApiEnabled(FakeApi api) => _enabledFakeApi.contains(api);

  static setFakeApiEnabled(FakeApi fakeApi, bool enabled) {
    _logger.d('FakeAPI: setFakeApiEnabled: $fakeApi => $enabled');
    if (enabled) {
      _enabledFakeApi.add(fakeApi);
    } else {
      _enabledFakeApi.remove(fakeApi);
    }
  }
}
