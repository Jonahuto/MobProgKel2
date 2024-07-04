import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'admin' && password == 'admin') {
      await UserInfo().setToken("Admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
      isLogin = true;
    }else if (username == 'karyawan' && password == '123') {
      await UserInfo().setToken("Karyawan");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("karyawan");
      isLogin = true;
    }
    return isLogin;
  }
}