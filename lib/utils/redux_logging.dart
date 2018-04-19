import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

String onlyLogActionFormatter<State>(
  State state,
  action,
  DateTime timestamp,
) {
  return '{Action: $action}';
}

List<Middleware> createLoggingMiddlewares() {
  return [
    new LoggingMiddleware.printer(formatter: onlyLogActionFormatter),
  ];
}
