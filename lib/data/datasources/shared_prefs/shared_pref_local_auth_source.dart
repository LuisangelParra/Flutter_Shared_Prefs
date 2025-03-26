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
    // Get the stored users as Map
    final Map<String, dynamic>? usersMap =
        await _sharedPreferences.retrieveData<Map<String, dynamic>>('users');

    if (usersMap == null || !usersMap.containsKey(email)) {
      throw "User not found";
    }

    final userPassword = usersMap[email];
    return User(email: email, password: userPassword);
  }

  @override
  Future<bool> isLogged() async {
    return await _sharedPreferences.retrieveData<bool>('logged') ?? false;
  }

  @override
  Future<void> signup(email, password) async {
    // Retrieve existing users or create a new map
    Map<String, dynamic> usersMap =
        await _sharedPreferences.retrieveData<Map<String, dynamic>>('users') ??
            {};

    // Store the new user
    usersMap[email] = password;

    // Save the updated users map
    await _sharedPreferences.storeData('users', usersMap);
  }

  @override
  Future<void> setLoggedIn() async {
    await _sharedPreferences.storeData('logged', true);
  }
}