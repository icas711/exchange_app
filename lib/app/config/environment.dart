
import 'build_type.dart';

class Environment {
  /// Build type.
  final BuildType buildType;

  /// Firebase options for initialize.
  //final FirebaseOptions? firebaseOptions;

  /// Is this application running in dev mode.
  bool get isDev => buildType == BuildType.dev;

  /// Is this application running in prod mode.
  bool get isProd => buildType == BuildType.prod;

  /// Creates an instance of [Environment].
  const Environment({
    required this.buildType,
    // this.firebaseOptions,
  });

 
}

/// [BuildType] extension for default url.
extension BuildTypeX on BuildType {
  /// Default url for build type.
  String get defaultUrl => switch (this) {
        BuildType.dev => 'https://rest.coincap.io/v3/',
        BuildType.prod => 'https://rest.coincap.io/v3/',
      };
  
}
