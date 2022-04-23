import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final dio = Dio();

const baseUrl = "https://needdl.herokuapp.com/api/v1/";

Future<bool> createAccount({
  required String name,
  required String email,
  required String password,
  required String userType,
  required String phoneNumber,
}) async {
  final dataToPost = {
    "name": name,
    "email": email,
    "password": password,
    "userType": userType,
    "phoneNumber": phoneNumber
  };

  print(dataToPost);
  try {
    EasyLoading.show();
    final res = await dio.post(
      baseUrl + "user/create",
      data: dataToPost,
      options: Options(headers: {
        "Content-Type": 'application/json',
        // "Access-Control-Allow-Origin": "*"
      }),
    );
    EasyLoading.showSuccess("SUCCESS");
    return true;
  } on DioError catch (err, s) {
    print(err);
    print(s);
    EasyLoading.showError("Something went wrong");
  } catch (err) {
    print(err);
    EasyLoading.showError("${err}");
  } finally {
    EasyLoading.dismiss();
  }

  return false;
}

Future<bool> loginAccount({
  required String email,
  required String password,
}) async {
  final dataToPost = {
    "email": email,
    "password": password,
  };

  print(dataToPost);
  try {
    EasyLoading.show();
    final res = await dio.post(
      baseUrl + "user/login",
      data: dataToPost,
      options: Options(headers: {
        "Content-Type": 'application/json',
        // "Access-Control-Allow-Origin": "*"
      }),
    );
    EasyLoading.showSuccess("SUCCESS");
    return true;
  } on DioError catch (err, s) {
    print(err.message);
    print(s);
    EasyLoading.showError("Something went wrong");
  } catch (err) {
    print(err);
    EasyLoading.showError("$err");
  } finally {
    EasyLoading.dismiss();
  }
  return false;
}

Future<bool> fetchAccounts({
  required String email,
  required String password,
}) async {
  final dataToPost = {
    "email": email,
    "password": password,
  };
  try {
    EasyLoading.show();
    final res = await dio.post(baseUrl + "user/login", data: dataToPost);
    EasyLoading.dismiss();
    return true;
  } catch (err) {
    EasyLoading.showError("$err");
  }
  return false;
}
