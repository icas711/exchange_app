import 'package:exchange_app/app/config/build_type.dart';
import 'package:exchange_app/app/config/environment.dart';
import 'package:exchange_app/runner.dart';

void main() async {
  run(const Environment(buildType: BuildType.dev)).ignore();
}