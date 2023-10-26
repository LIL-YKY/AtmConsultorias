import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController with WidgetsBindingObserver {
  final _appState = AppLifecycleState.resumed.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _appState.value = state;
  }

  AppLifecycleState get appState => _appState.value;
}
