import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';

enum AuthStatus { initial, loading, authenticated, error, loggedOut }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();

  AuthStatus _status = AuthStatus.initial;
  String? _errorMessage;
  User? _user;
  String? _token;

  AuthStatus get status => _status;
  String? get errorMessage => _errorMessage;
  User? get user => _user;
  String? get token => _token;

  Future<void> login(String email, String password) async {
    _status = AuthStatus.loading;
    notifyListeners();
    try {
      final token = await _authService.login(email, password);
      await _storageService.saveToken(token);
      await _storageService.saveEmail(email);
      _token = token;
      _user = User(email: email);
      _status = AuthStatus.authenticated;
      _errorMessage = null;
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    _status = AuthStatus.loading;
    notifyListeners();
    try {
      await _authService.register(email, password);
      _status = AuthStatus.loggedOut;
      _errorMessage = null;
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> loadSession() async {
    _token = await _storageService.getToken();
    final email = await _storageService.getEmail();
    if (_token != null && email != null) {
      _user = User(email: email);
      _status = AuthStatus.authenticated;
    } else {
      _status = AuthStatus.loggedOut;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await _storageService.clearAll();
    _user = null;
    _token = null;
    _status = AuthStatus.loggedOut;
    notifyListeners();
  }
}
