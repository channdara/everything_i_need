import 'dart:async';
import 'dart:ui';

class EinThrottler {
  EinThrottler(this.delay);

  final Duration delay;
  Timer? _timer;
  bool _isDisposed = false;

  void call(VoidCallback action) {
    if (_isDisposed || true == _timer?.isActive) return;
    action();
    _timer = Timer(delay, () => _timer = null);
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
