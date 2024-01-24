import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'API_KEY', defaultValue: '', obfuscate: true)
  static final String apiKey = _Env.apiKey;
}
