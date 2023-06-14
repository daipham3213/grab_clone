abstract class LogService {
  void error(String message, dynamic e, StackTrace? stack);
  void warn(String message, [dynamic e, StackTrace? stack]);
  void info(String message);
  void debug(String message);
}
