import 'package:template/store/slices/account.dart';

/*
  Store ----------------
 */
class AppState {
  final AccountState accountState;

  AppState(this.accountState);

  factory AppState.initialState() {
    return AppState(
      AccountState(),
    );
  }
}

/*
  Redusers ----------------
 */
AppState appReducers(AppState state, action) {
  return AppState(
    accountReducers(state.accountState, action),
  );
}
