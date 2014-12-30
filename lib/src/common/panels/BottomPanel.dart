part of FrameUI;

class BottomPanel extends HorizontalPanel {

  Rectangle _absoluteArea = new Rectangle(0, 0, 0, 0);
  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get absoluteArea => _absoluteArea;
  Rectangle get area => _area;

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