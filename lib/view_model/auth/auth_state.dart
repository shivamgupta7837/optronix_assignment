part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoadingState extends AuthState {

}
final class AuthLoadedState extends AuthState {
  final BusinessModel AuthResponse;
  AuthLoadedState({required this.AuthResponse});
}
final class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({required this.message});
}
