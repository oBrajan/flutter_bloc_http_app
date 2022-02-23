import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/domain/repositories/auth_repository.dart';

class Logout {
  final UserRepository repository = sl<UserRepository>();
  
  logout() {
    repository.logout();
  }
}
