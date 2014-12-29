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
           ..fillRect(area.left, area.top, area.width, area.height)
           ..fill()
           ..closePath()

           // top border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderTopColor.join(", ")})"
           ..moveTo(area.left+style.borderSize, area.top+style.borderSize)
           ..lineTo(area.right-style.borderSize, area.top+style.borderSize)
           ..stroke()
           ..closePath()

           // left border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderLeftColor.join(", ")})"
           ..moveTo(area.left+style.borderSize, area.bottom-style.borderSize)
           ..lineTo(area.left+style.borderSize, area.top+style.borderSize)
           ..stroke()
           ..closePath()

           // right border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderRightColor.join(", ")})"
           ..moveTo(area.right-style.borderSize, area.top+style.borderSize)
           ..lineTo(area.right-style.borderSize, area.bottom-style.borderSize)
           ..stroke()
           ..closePath()

           // bottom border
           ..beginPath()
           ..strokeStyle =
              "rgb(${borderBottomColor.join(", ")})"
           ..moveTo(area.right-style.borderSize, area.bottom-style.borderSize)
           ..lineTo(area.left+style.borderSize, area.bottom-style.borderSize)
           ..stroke()
           ..closePath()
           ;
  }

}