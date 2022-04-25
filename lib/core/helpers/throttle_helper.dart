import 'dart:async';

class Throttle<T> {
  Timer? _timer;
  Function callBack;

  final int timeInMS;

  Throttle({
    required this.timeInMS,
    required this.callBack,
  });

  void cancel() => _timer?.cancel();

  void restart(T? param) {
    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer(Duration(milliseconds: timeInMS), () {
      callBack(param);
    });
  }
}
