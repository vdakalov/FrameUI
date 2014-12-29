part of FrameUI;

class Frame {

  CanvasRenderingContext2D context;

  Duration frequency = null;

  final List<Panel> panels = new List<Panel>();

  bool _mouseDown = false;

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

    context.clearRect(0, 0, context.canvas.width, context.canvas.height);

    panels.forEach((panel){
      panel.render(context);
    });

    frequency is Duration ?
        new Timer(frequency, _requestFrame) :
        _requestFrame();
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
        document.body.style.cursor = panel.style.cursorName;
      }

      panel.elements
      .forEach((element){
        if (element.style.visible && element.area.containsPoint(event.offset)) {
          element..isHover = true
                 ..isActive = _mouseDown
                 ..onHoverIn(event.offset, event)
                 ..onMouseMove(event.offset, event);
          document.body.style.cursor = element.style.cursorName;
        } else if (element.isHover) {
          element..isHover = false
                 ..isActive = false
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
          element.isActive = false;
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
          element.isActive = true;
          element.onMouseDown(event.offset, event);
        } else if (element.isActive) {
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