import 'package:injectable/injectable.dart';

enum Environment {
  dev('dev'),
  uat('uat'),
  prod('prod');

  final String value;

  const Environment(this.value);

  factory Environment.init(String x) {
    if (x == Environment.uat) {
      return Environment.uat;
    } else if (x == Environment.prod) {
      return Environment.prod;
    }

    return Environment.dev;
  }
}

@injectable
class Config {
  Environment get env => Environment.init(const String.fromEnvironment(
        'ENV',
      ));

  String get baseUrl => 'https://sample-comments-service-5y6owysdhq-uc.a.run.app';
}
