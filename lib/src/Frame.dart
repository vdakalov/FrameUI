part of FrameUI;

class Frame {

  CanvasRenderingContext2D context;

  Duration frequency = null;

  final List<Panel> panels = new List<Panel>();

  Frame(int width, int height) {

    CanvasElement canvas = new CanvasElement(width: width, height: height);
    context = canvas.getContext("2d");

    _requestFrame();
  }

  Frame.fromContext(CanvasRenderingContext2D context) {
    this.context = context;
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

}