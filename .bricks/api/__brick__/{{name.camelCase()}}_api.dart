import 'package:currency_rates/common/common.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part '{{name.camelCase()}}_api.g.dart';

@RestApi()
@injectable
abstract class {{name.pascalCase()}}Api {
  @factoryMethod
  factory {{name.pascalCase()}}Api(Dio dio) => FakeApi.{{name.camelCase()}}.isEnabled ? _{{name.pascalCase()}}Api(dio) : Fake{{name.pascalCase()}}Api();

  @GET('/ping')
  Future<void> ping();
}

class Fake{{name.pascalCase()}}Api implements {{name.pascalCase()}}Api {
  @override
  Future<void> ping() {
    // TODO: implement ping
    throw UnimplementedError();
  }
}
