part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const paymentView = _Paths.paymentView;

  static const createSession = _Paths.createSession;
  static const print = _Paths.print;
  static const tables = _Paths.tables;
  static const settings = _Paths.settings;
}

abstract class _Paths {
  _Paths._();
  static const login = '/login';
  static const home = '/home';
  static const createSession = '/create-session';
  static const paymentView = '/payment-view';
  static const print = '/print';
  static const tables = '/tables';
  static const settings = '/settings';
}
