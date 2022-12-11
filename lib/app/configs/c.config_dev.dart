// ignore_for_file: annotate_overrides

part of '_index.dart';

class ConfigDev implements IConfig {
  String get apiHost => 'https://api.themoviedb.org';
  String get appName => 'DEV_FeMaster';
  String get token => 'a603bb398cc5d799ec8d03ff2c95b7f4';
  // 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz';
  IPersistStore get store => StoreFake();
}
