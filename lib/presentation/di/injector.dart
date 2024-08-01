import 'package:git_search/presentation/di/modules/module.dart';

class Injector {
  static Injector? _instance = Injector._();

  static Injector get instance {
    _instance ??= Injector._();
    return _instance!;
  }

  Injector._();

  void inject(List<Module> modules) {
    modules.forEach((m) => m.dependency());
  }
}
