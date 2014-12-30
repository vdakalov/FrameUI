part of FrameUI;

class Rendering extends IRendering {

  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get absoluteArea =>
      new Rectangle(
          area.left + parent.absoluteArea.left + parent.style.paddingLeft,
          area.top + parent.absoluteArea.top + parent.style.paddingTop,
          area.width,
          area.height);

  Rectangle get area =>
      new Rectangle(
          _area.left,
          _area.top,
          _area.width,
          _area.height);

  void set area(Rectangle rect) {
    _area = new Rectangle(
        rect.left,
        rect.top,
        rect.width - style.paddingHorizontal,
        rect.height - style.paddingVertical);
  }

  final Style style = new Style();

  List<Rendering> elements = new List<Rendering>();

  render(CanvasRenderingContext2D context) {

    context..beginPath()
           ..fillStyle = "rgb(${style.backgroundColor.join(", ")})"
           ..fillRect(
               absoluteArea.left,
               absoluteArea.top,
               absoluteArea.width,
               absoluteArea.height)
           ..fill()
           ..closePath()

           // top border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderTopColor.join(", ")})"
           ..moveTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.top + style.borderSize)
           ..lineTo(
               absoluteArea.right - style.borderSize,
               absoluteArea.top + style.borderSize)
           ..stroke()
           ..closePath()

           // left border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderLeftColor.join(", ")})"
           ..moveTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.bottom - style.borderSize)
           ..lineTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.top + style.borderSize)
           ..stroke()
           ..closePath()

           // right border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderRightColor.join(", ")})"
           ..moveTo(
               absoluteArea.right - style.borderSize,
               absoluteArea.top + style.borderSize)
           ..lineTo(
               absoluteArea.right - style.borderSize,
               absoluteArea.bottom - style.borderSize)
           ..stroke()
           ..closePath()

           // bottom border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderBottomColor.join(", ")})"
           ..moveTo(
               absoluteArea.right - style.borderSize,
               absoluteArea.bottom - style.borderSize)
           ..lineTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.bottom - style.borderSize)
           ..stroke()
           ..closePath()
           ;

    elements.forEach((element){
      element.parent = this;
      element.render(context);
    });
  }

  onHoverIn(Point point, MouseEvent event) {}
  onHoverOut(Point point, MouseEvent event) {}

  onAction(Point point, MouseEvent event) {}
  onMouseMove(Point point, MouseEvent event) {}
  onMouseUp(Point point, MouseEvent event) {}
  onMouseDown(Point point, MouseEvent event) {}

  onKeyPress(KeyboardEvent event) {}
  onKeyDown(KeyboardEvent event) {}
  onKeyUp(KeyboardEvent event) {}

}