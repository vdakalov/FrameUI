part of FrameUI;

class RightPanel extends VerticalPanel {

  Rectangle get absoluteArea =>
      new Rectangle(
          parent.area.right - (area.width + parent.style.paddingRight),
          parent.area.top + getTopPosition() + parent.style.paddingTop,
          area.width,
          area.height - parent.style.paddingVertical);

  Rectangle get area =>
      new Rectangle(
          0,
          0,
          32,
          // TODO нужно подумать как не вызывать getTopPosition два раза
          getBottomPosition() - getTopPosition());

}