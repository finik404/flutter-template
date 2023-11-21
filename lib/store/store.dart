import 'package:template/store/slices/account.dart';

/*
  Store ----------------
 */
class AppState {
  // Slices ----------------
  final AccountState accountState;

  AppState({required this.accountState});

  AppState.initialState() : accountState = AccountState();

  // State ----------------
  AppState copyWith({
    AccountState? accountState,
  }) {
    return AppState(
      accountState: accountState ?? this.accountState,
    );
  }
}


/*
  Redusers ----------------
 */
AppState appReducer(AppState state, action) {
  return AppState(
    accountState: accountReducers(state.accountState, action),
  );
}
