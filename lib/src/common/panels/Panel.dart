part of FrameUI;

class Panel extends Rendering {

  final List<Rendering> elements = new List<Rendering>();

  @override
  render(CanvasRenderingContext2D context) {

    super.render(context);

    elements.forEach((element){
      element.render(context);
    });

  }

}