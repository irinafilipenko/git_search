import 'package:git_search/presentation/di/modules/module.dart';

class Injector {
  static Injector? _instance = Injector._();

  static Injector get instance {
    _instance ??= Injector._();
    return _instance!;
  }

  Injector._();

  void inject(List<Module> modules) {
    for (var m in modules) {
      m.dependency();
    }
  }
}

// class Injector {
//   static Injector? _instance = Injector._();
//
//   static Injector get instance {
//     _instance ??= Injector._();
//     return _instance!;
//   }

//   Injector._();
//
//   Future<void> injectAsync(List<Module> modules) async {
//     for (var module in modules) {
//       await module.dependency();
//     }
//   }
// }
