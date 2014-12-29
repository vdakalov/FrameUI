part of FrameUI;

class Rendering extends IRendering {

  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get area =>
      new Rectangle(
          _area.left,
          _area.top,
          _area.width + style.paddingHorizontal,
          _area.height + style.paddingVertical);

  void set area(Rectangle rect) {
    _area = new Rectangle(
        rect.left,
        rect.top,
        rect.width - style.paddingHorizontal,
        rect.height - style.paddingVertical);
  }

  final Style style = new Style();

  render(CanvasRenderingContext2D context) {

    context..beginPath()
           ..fillStyle = "rgb(${style.backgroundColor.join(", ")})"
           ..fillRect(area.left, area.top, area.width, area.height)
           ..fill()
           ..closePath()

           // top border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderTopColor.join(", ")})"
           ..moveTo(area.left+style.borderSize, area.top+style.borderSize)
           ..lineTo(area.right-style.borderSize, area.top+style.borderSize)
           ..stroke()
           ..closePath()

           // left border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderLeftColor.join(", ")})"
           ..moveTo(area.left+style.borderSize, area.bottom-style.borderSize)
           ..lineTo(area.left+style.borderSize, area.top+style.borderSize)
           ..stroke()
           ..closePath()

           // right border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderRightColor.join(", ")})"
           ..moveTo(area.right-style.borderSize, area.top+style.borderSize)
           ..lineTo(area.right-style.borderSize, area.bottom-style.borderSize)
           ..stroke()
           ..closePath()

           // bottom border
           ..beginPath()
           ..strokeStyle =
              "rgb(${style.borderBottomColor.join(", ")})"
           ..moveTo(area.right-style.borderSize, area.bottom-style.borderSize)
           ..lineTo(area.left+style.borderSize, area.bottom-style.borderSize)
           ..stroke()
           ..closePath()
           ;
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