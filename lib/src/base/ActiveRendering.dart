part of FrameUI;

class ActiveRendering extends Rendering {

  bool isActive = false;

  render(CanvasRenderingContext2D context) {

    List<int> borderTopColor =
                isActive ? style.borderBottomColor : style.borderTopColor,
              borderLeftColor =
                isActive ? style.borderRightColor : style.borderLeftColor,
              borderRightColor =
                isActive ? style.borderLeftColor : style.borderRightColor,
              borderBottomColor =
                isActive ? style.borderTopColor : style.borderBottomColor;

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
              "rgb(${borderTopColor.join(", ")})"
           ..moveTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.top + style.borderSize)
           ..lineTo(
               absoluteArea.right - style.borderSize,
               absoluteArea.top+style.borderSize)
           ..stroke()
           ..closePath()

           // left border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderLeftColor.join(", ")})"
           ..moveTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.bottom-style.borderSize)
           ..lineTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.top + style.borderSize)
           ..stroke()
           ..closePath()

           // right border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderRightColor.join(", ")})"
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
              "rgb(${borderBottomColor.join(", ")})"
           ..moveTo(
               absoluteArea.right - style.borderSize,
               absoluteArea.bottom - style.borderSize)
           ..lineTo(
               absoluteArea.left + style.borderSize,
               absoluteArea.bottom - style.borderSize)
           ..stroke()
           ..closePath()
           ;
  }

}