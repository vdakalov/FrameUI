part of FrameUI;

class Rendering implements IRendering {

  Rectangle area = new Rectangle(0, 0, 0, 0);
  Style style = new Style();

  render(CanvasRenderingContext2D context) {
    context..beginPath()
           ..fillStyle = "rgb(${style.backgroundColor.join(", ")})"
           ..fillRect(area.left, area.top, area.width, area.height)
           ..fill()
           ..closePath()

           ..beginPath()
           ..strokeStyle =
            "rgb(${style.backgroundColor.map((i){return i+25;}).join(", ")})"
           ..moveTo(area.left+style.padding+1, area.bottom-style.padding)
           ..lineTo(area.left+style.padding, area.top+style.padding)
           ..lineTo(area.right-style.padding, area.top+style.padding)
           ..stroke()
           ..closePath()

           ..beginPath()
           ..strokeStyle =
              "rgb(${style.backgroundColor.map((i){return i-35;}).join(", ")})"
           ..moveTo(area.right-style.padding, area.top+style.padding)
           ..lineTo(area.right-style.padding, area.bottom-style.padding)
           ..lineTo(area.left+style.padding, area.bottom-style.padding)
           ..stroke()
           ..closePath()
           ;
  }
}