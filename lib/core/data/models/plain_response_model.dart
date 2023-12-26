enum LoadingIconEnum {
  circular,
  horizontal,
  submitting,
  syncing,
  fetching,
  processing
}

enum StatusInfoIconEnum { warning, alert, error, silent, success }

abstract class ResponseInfo {
  final String title;
  final String message;

  ResponseInfo({required this.title, required this.message});
}

class ErrorInfo extends ResponseInfo {
  final StatusInfoIconEnum icon;

  ErrorInfo({
    required super.title,
    required super.message,
    required this.icon,
  });
}

class StatusInfo extends ResponseInfo {
  final StatusInfoIconEnum icon;

  StatusInfo({
    required super.title,
    required super.message,
    required this.icon,
  });
}

class LoadingInfo extends ResponseInfo {
  final LoadingIconEnum icon;

  LoadingInfo({
    required super.title,
    required super.message,
    required this.icon,
  });
}
