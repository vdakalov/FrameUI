part of FrameUI;

class Frame {

  CanvasRenderingContext2D context;

  Rectangle area;

  Duration frequency = null;
  DateTime _lastRender = new DateTime.now();
  double fps = 0.0;

  final Root _root = new Root();
  final List<Rendering> elements = new List<Rendering>();

  bool _mouseDown = false;

  StreamController<FrameEvent> _onBeforeRender =
      new StreamController<FrameEvent>();
  Stream<FrameEvent> get onBeforeRender => _onBeforeRender.stream;

  Frame(Rectangle this.area) {

    CanvasElement canvas = new CanvasElement(
        width: area.width, height: area.height);
    context = canvas.getContext("2d");
    _init();
  }

  Frame.fromContext(CanvasRenderingContext2D context) {
    this.context = context;
    area = new Rectangle(0, 0, context.canvas.width, context.canvas.height);
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

//    _updateFps();

    context.clearRect(0, 0, context.canvas.width, context.canvas.height);

    // create event
    _onBeforeRender.add(new FrameEvent(this, "onBeforeRender"));

    // rendering
    _root.frame = this;
    _root.render(context);

    // request new frame
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

  update() {
    area = new Rectangle(0, 0, context.canvas.width, context.canvas.height);
  }

  _onClick(MouseEvent event) {
    elements.forEach((panel){
      panel.elements.forEach((element){
        if (element.style.visible && element.parent is Rendering &&
            element.absoluteArea.containsPoint(event.offset)) {
          element.onAction(event.offset, event);
        }
      });
    });
  }

  _onMouseMove(MouseEvent event) {
    elements.forEach((element){

      if (element.style.visible && element.parent is Rendering &&
          element.absoluteArea.containsPoint(event.offset)) {
        document.body.style.cursor = element.style.cursor;
      }

      element.elements
      .forEach((element){
        if (element.style.visible && element.parent is Rendering &&
            element.absoluteArea.containsPoint(event.offset)) {
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
    elements.forEach((element){
      element.elements.forEach((element){
        if (element.style.visible && element.parent is Rendering &&
            element.absoluteArea.containsPoint(event.offset)) {
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
    elements.forEach((element){
      element.elements.forEach((element){
        if (element.style.visible && element.parent is Rendering &&
            element.absoluteArea.containsPoint(event.offset)) {
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