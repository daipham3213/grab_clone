import 'package:grab_clone/services/log_service/log_service.dart';
import 'package:logger/logger.dart';

class ConsoleLogService implements LogService {
  ConsoleLogService({Logger? logger}) {
    _logger = logger ??
        Logger(
          printer: PrefixPrinter(
            PrettyPrinter(
              methodCount: 0,
              errorMethodCount: 500,
              lineLength: 100,
            ),
          ),
          output: ConsoleOutput(),
        );
  }

  late final _logger;

  @override
  void debug(String message) {
    _logger.d(message);
  }

  @override
  void error(String message, e, StackTrace? stack) {
    _logger.e(message, e, stack);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }

  @override
  void warn(String message, [e, StackTrace? stack]) {
    _logger.w(message, e, stack);
  }
}
