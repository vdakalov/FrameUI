part of FrameUI;

class Panel extends Rendering {

  Frame frame;

  final List<Rendering> elements = new List<Rendering>();

  @override
  render(CanvasRenderingContext2D context) {

    super.render(context);

    elements.forEach((element){
      if (element.style.visible) {
        element.render(context);
      }
    });

  }

}