import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_wise/injector.config.dart';

final injector = GetIt.instance;

@injectableInit
Future<void> setupInjector() async {
  await injector.init(environment: "Dev");
}

@module
abstract class MainModule {
  @lazySingleton
  FirebaseFirestore getFirestore() => FirebaseFirestore.instance;

  @lazySingleton
  @preResolve
  Future<SharedPreferences> getSharePreferences() => SharedPreferences.getInstance();
}
