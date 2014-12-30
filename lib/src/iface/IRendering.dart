part of FrameUI;

abstract class IRendering {

  Rendering parent;
  Rectangle area;
  List<IRendering> elements;

  bool isHover = false;

  render(CanvasRenderingContext2D context);

  onHoverIn(Point point, MouseEvent event);
  onHoverOut(Point point, MouseEvent event);

  onAction(Point point, MouseEvent event);
  onMouseMove(Point point, MouseEvent event);
  onMouseDown(Point point, MouseEvent event);
  onMouseUp(Point point, MouseEvent event);

  onKeyPress(KeyboardEvent event);
  onKeyDown(KeyboardEvent event);
  onKeyUp(KeyboardEvent event);

}