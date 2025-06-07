import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(requireEnvFile: true)
final class Env {
  @EnviedField(varName: 'COIN_CAP_KEY')
  static const String key = _Env.key; 
} 