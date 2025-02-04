import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/repositories/remote/login_repo.dart';

class LoginController extends GetxController {
  DioClient dioClient;
  LoginRepo loginRepo;
  LoginController({required this.dioClient, required this.loginRepo});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPassword = true.obs;
  var rememberMe = false.obs;

  var emailErrorText = ''.obs;
  var passwordErrorText = ''.obs;
  var isEmailError = true.obs;
  var isPasswordError = true.obs;
  var buttonVisibility = false.obs;
  var isLoading = false.obs;


  //login button visibility
  void loginButtonVisibility() {
    buttonVisibility.value = !isEmailError.value && !isPasswordError.value;
  }

}