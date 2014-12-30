part of FrameUI;

class BottomPanel extends HorizontalPanel {

  Rectangle get absoluteArea =>
      new Rectangle(
          parent.area.left + parent.style.paddingLeft,
          parent.area.bottom - parent.style.paddingBottom - area.height,
          parent.area.width - parent.style.paddingHorizontal,
          area.height);

  Rectangle get area =>
      new Rectangle(
          parent.area.left,
          parent.area.bottom - 32,
          parent.area.width,
          32);

}