part of FrameUI;

class Frame {

  CanvasRenderingContext2D context;

  Duration frequency = null;
  DateTime _lastRender = new DateTime.now();
  double fps = 0.0;

  final List<Panel> panels = new List<Panel>();

  bool _mouseDown = false;

  StreamController<Event> _onBeforeRender = new StreamController<Event>();
  Stream<Event> get onBeforeRender => _onBeforeRender.stream;

  Frame(int width, int height) {

    CanvasElement canvas = new CanvasElement(width: width, height: height);
    context = canvas.getContext("2d");

    _init();
  }

  Frame.fromContext(CanvasRenderingContext2D context) {
    this.context = context;
    _init();
  }

  _init() {
    _binds();
    _requestFrame();
  }

  _requestFrame() {
    window.requestAnimationFrame(_render);
  }

  _render(var some) {

    _updateFps();

    context.clearRect(0, 0, context.canvas.width, context.canvas.height);

    // create event
    _onBeforeRender.add(new Event(this, "onBeforeRender"));

    panels.forEach((panel){
      panel.render(context);
    });

    frequency is Duration ?
        new Timer(frequency, _requestFrame) :
        _requestFrame();
  }

  _updateFps() {
    DateTime nowRender = new DateTime.now();
    fps = double.parse((1000 / nowRender.difference(_lastRender).inMilliseconds).toStringAsFixed(2));
    _lastRender = nowRender;
  }

  mount(HtmlElement parent) {
    parent.append(context.canvas);
    context.canvas..tabIndex = 1
                  ..focus()
                  ;
  }

  _binds() {
    context.canvas..onClick.listen(_onClick)
                  ..onMouseMove.listen(_onMouseMove)
                  ..onMouseDown.listen(_onMouseDown)
                  ..onMouseUp.listen(_onMouseUp)
                  ..onContextMenu.listen(_onContext)
                  ..onKeyPress.listen(_onKeyPress)
                  ..onKeyDown.listen(_onKeyDown)
                  ..onKeyUp.listen(_onKeyUp)
                  ;
  }

  _onClick(MouseEvent event) {
    panels.forEach((panel){
      panel.elements.forEach((element){
        if (element.style.visible && element.area.containsPoint(event.offset)) {
          element.onAction(event.offset, event);
        }
      });
    });
  }

  _onMouseMove(MouseEvent event) {
    panels.forEach((panel){

      if (panel.style.visible && panel.area.containsPoint(event.offset)) {
        document.body.style.cursor = panel.style.cursor;
      }

      panel.elements
      .forEach((element){
        if (element.style.visible && element.area.containsPoint(event.offset)) {
          if (element is ActiveRendering) {
              element.isActive = _mouseDown;
          }
          element..isHover = true
                 ..onHoverIn(event.offset, event)
                 ..onMouseMove(event.offset, event);
          document.body.style.cursor = element.style.cursor;
        } else if (element.isHover) {
          if (element is ActiveRendering) {
            element.isActive = false;
          }
          element..isHover = false
                 ..onHoverOut(event.offset, event);
        }
      });
    });
  }

  _onMouseUp(MouseEvent event) {
    _mouseDown = false;
    panels.forEach((panel){
      panel.elements.forEach((element){
        if (element.style.visible && element.area.containsPoint(event.offset)) {
          if (element is ActiveRendering) {
            element.isActive = false;
          }
          element.onMouseUp(event.offset, event);
        }
      });
    });
  }

  _onMouseDown(MouseEvent event) {
    _mouseDown = true;
    panels.forEach((panel){
      panel.elements.forEach((element){
        if (element.style.visible && element.area.containsPoint(event.offset)) {
          if (element is ActiveRendering) {
            element.isActive = true;
          }
          element.onMouseDown(event.offset, event);
        } else if (element is ActiveRendering && element.isActive) {
          element.isActive = false;
        }
      });
    });
  }
  _onContext(MouseEvent event) {}

  _onKeyPress(KeyboardEvent event) {}
  _onKeyUp(KeyboardEvent event) {}
  _onKeyDown(KeyboardEvent event) {}

}