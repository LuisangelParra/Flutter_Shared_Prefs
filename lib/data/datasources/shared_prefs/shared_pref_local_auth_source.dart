import '../../../domain/entities/user.dart';
import '../i_local_auth_source.dart';
import 'local_preferences.dart';

class SharedPrefLocalAuthSource implements ILocalAuthSource {
  final _sharedPreferences = LocalPreferences();

  @override
  Future<String> getLoggedUser() async {
    return await _sharedPreferences.retrieveData<String>('user') ?? "noUser";
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.storeData('logged', false);
  }

  @override
  Future<User> getUserFromEmail(email) async {
    //TODO: implement getUserFromEmail, return a User object
    // if no user is found, throw "User not found"
    try {
      final user = await _sharedPreferences.retrieveData<User>(email);
      if (user == null) {
        throw "User not found";
      }
      return user;
    } catch (e) {
      if (e == "User not found") {
        rethrow;
      }
      throw e;
    }

  }

  @override
  Future<bool> isLogged() async {
    //TODO: implement isLogged, return a boolean, default is false
    return await _sharedPreferences.retrieveData<bool>('logged') ?? false;
  }

  @override
  Future<void> signup(email, password) async {
    //TODO: implement signup, stroe the email and pass on shared preferences
    await _sharedPreferences.storeData(email, User(email: email, password: password));
  }

  @override
  Future<void> setLoggedIn() async {
    //TODO: implement setLoggedIn, store a boolean on shared preferences
    await _sharedPreferences.storeData('logged', true);
  }
}
