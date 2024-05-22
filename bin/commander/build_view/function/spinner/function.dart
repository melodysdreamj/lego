import 'dart:async';
import 'dart:io';

class Spinner {
  bool _isActive = false;
  List<String> _spinnerIcons = ['-', '\\', '|', '/'];
  int _currentIndex = 0;

  void start() {
    _isActive = true;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (!_isActive) {
        timer.cancel();
        return;
      }

      stdout.write('\r${_spinnerIcons[_currentIndex]}');
      _currentIndex = (_currentIndex + 1) % _spinnerIcons.length;
    });
  }

  void stop() {
    _isActive = false;
    stdout.write('\r '); // 커서를 청소하기 위해 공백 문자를 출력합니다.
  }
}