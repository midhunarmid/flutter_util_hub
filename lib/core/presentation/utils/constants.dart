import 'package:logger/logger.dart';

const double maxScreenWidth = 640;

Logger appLogger = Logger(
  printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false),
);
