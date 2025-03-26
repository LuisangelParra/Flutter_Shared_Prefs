import '../../domain/entities/user.dart';
import '../../domain/repositories/i_auth_repo.dart';
import '../datasources/i_local_auth_source.dart';
import '../datasources/shared_prefs/shared_pref_local_auth_source.dart';

class AuthRepo implements IAuthRepo {
  final ILocalAuthSource localAuthSource;
  final sharedPrefLocalAuthSource = SharedPrefLocalAuthSource();

  AuthRepo(this.localAuthSource);


  @override
  Future<User> getUserFromEmail(email) async {
    //TODO: implement getUserFromEmail
    return sharedPrefLocalAuthSource.getUserFromEmail(email);
    
  }

  @override
  Future<void> logout() async {
    //TODO: implement logout
    return sharedPrefLocalAuthSource.logout();
  }

  @override
  Future<void> signup(email, password) async {
    //TODO: implement signup
    return sharedPrefLocalAuthSource.signup(email, password);
  }

  @override
  Future<String> getLoggedUser() async {
    //TODO: implement getLoggedUser
    return sharedPrefLocalAuthSource.getLoggedUser();
  }

  @override
  Future<bool> isLogged() async {
    //TODO: implement isLogged
    return sharedPrefLocalAuthSource.isLogged();
  }

  @override
  Future<void> setLoggedIn() async {
    //TODO: implement setLoggedIn
    return sharedPrefLocalAuthSource.setLoggedIn();
  }
}
