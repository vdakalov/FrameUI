part of FrameUI;

class BottomPanel extends HorizontalPanel {

  singleCalc() {

    super.singleCalc();

    _area = new Rectangle(
        parent.area.left,
        parent.area.bottom - area.height,
        parent.area.width,
        area.height);

    _absoluteArea = new Rectangle(
        parent.area.left + parent.style.paddingLeft,
        parent.area.bottom - parent.style.paddingBottom - area.height,
        parent.area.width - parent.style.paddingHorizontal,
        area.height);
  }

}