import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/repository/user_repository_impl.dart';
import '../../../../domain/repository/user_repository.dart';
import 'splash_bloc_state.dart';

class SplashBloc extends EinBaseBloc {
  final UserRepository _userRepository = UserRepositoryImpl.instance;

  void fetchUsers() {
    execute(
      requesting: () async {
        await _userRepository.users();
        safeEmit(SplashStateGotUsers());
      },
      onError: (_) {
        safeEmit(SplashStateGotUsers());
      },
    );
  }
}
