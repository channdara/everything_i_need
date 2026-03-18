import 'dart:async';
import 'dart:ui';

class EinDebouncer {
  EinDebouncer(this.delay);

  final Duration delay;
  Timer? _timer;
  bool _isDisposed = false;

  void call(VoidCallback action) {
    if (_isDisposed) return;
    _timer?.cancel();
    _timer = Timer(delay, () {
      if (_isDisposed) return;
      action();
    });
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _isDisposed = true;
    cancel();
  }
}
