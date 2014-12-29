part of FrameUI;

class Panel extends Rendering {

  final List<IRendering> elements = new List<IRendering>();

  @override
  render(CanvasRenderingContext2D context) {

    super.render(context);

    elements.forEach((element){
      element.render(context);
    });

  }

}