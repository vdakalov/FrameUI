part of FrameUI;

class Rendering extends IRendering {

  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get area =>
      new Rectangle(
          _area.left,
          _area.top,
          _area.width + (style.paddingLeft + style.paddingRight),
          _area.height + (style.paddingTop + style.paddingBottom));

  void set area(Rectangle rect) {
    _area = rect;
  }

  final Style style = new Style();

  render(CanvasRenderingContext2D context) {

    List<int> borderTop = isActive ? style.borderBottomColor : style.borderTopColor,
              borderLeft = isActive ? style.borderRightColor : style.borderLeftColor,
              borderRight = isActive ? style.borderLeftColor : style.borderRightColor,
              borderBottom = isActive ? style.borderTopColor : style.borderBottomColor;

    context..beginPath()
           ..fillStyle = "rgb(${style.backgroundColor.join(", ")})"
           ..fillRect(area.left, area.top, area.width, area.height)
           ..fill()
           ..closePath()

           // top border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderTop.join(", ")})"
           ..moveTo(area.left+style.borderSize, area.top+style.borderSize)
           ..lineTo(area.right-style.borderSize, area.top+style.borderSize)
           ..stroke()
           ..closePath()

           // left border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderLeft.join(", ")})"
           ..moveTo(area.left+style.borderSize, area.bottom-style.borderSize)
           ..lineTo(area.left+style.borderSize, area.top+style.borderSize)
           ..stroke()
           ..closePath()

           // right border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderRight.join(", ")})"
           ..moveTo(area.right-style.borderSize, area.top+style.borderSize)
           ..lineTo(area.right-style.borderSize, area.bottom-style.borderSize)
           ..stroke()
           ..closePath()

           // bottom border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderBottom.join(", ")})"
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