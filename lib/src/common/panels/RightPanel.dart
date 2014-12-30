part of FrameUI;

class RightPanel extends VerticalPanel {

  Rectangle _absoluteArea = new Rectangle(0, 0, 0, 0);
  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get absoluteArea => _absoluteArea;
  Rectangle get area => _area;

  singleCalc() {

    int topPosition = getTopPosition(),
        bottomPosition = getBottomPosition();

    _area = new Rectangle(0, 0, 32, bottomPosition - topPosition);

    _absoluteArea = new Rectangle(
        parent.area.right - (area.width + parent.style.paddingRight),
        parent.area.top + topPosition + parent.style.paddingTop,
        area.width,
        area.height - parent.style.paddingVertical);
  }

}