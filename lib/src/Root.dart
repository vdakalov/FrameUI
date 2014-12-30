part of FrameUI;

class Root extends Rendering {

  Frame frame;

  Rectangle get absoluteArea =>
      new Rectangle(
          frame.area.left,
          frame.area.top,
          frame.area.width,
          frame.area.height);

  Rectangle get area =>
      new Rectangle(
          frame.area.left,
          frame.area.top,
          frame.area.width,
          frame.area.height);

  List<Rendering> get elements => frame.elements;

  render(CanvasRenderingContext2D context) {

    frame.elements.forEach((element){
      element.parent = this;
    });

    super.render(context);

    frame.elements.forEach((element){
      element.render(context);
    });

  }

}