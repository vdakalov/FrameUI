part of FrameUI;

bool _state = false;
List<Frame> _frames = new List<Frame>();

_frameRequest(dynamic some) {

  DateTime timerMark = new DateTime.now();

  _frames.forEach((frame){
    if (frame.frequency == null ||
        frame._lastRender.difference(timerMark).inMilliseconds >
          frame.frequency.inMilliseconds) {

      frame._lastRender = timerMark;
      frame._render();
    }
  });

  if (_state) {
    window.requestAnimationFrame(_frameRequest);
  }
}

start() {
  _state = true;
  _frameRequest(0);
}

stop() {
  _state = false;
}