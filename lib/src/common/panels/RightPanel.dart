part of FrameUI;

class RightPanel extends VerticalPanel {

  singleCalc() {

    super.singleCalc();

    int topPosition = getTopPosition();

    _absoluteArea = new Rectangle(
        parent.area.right - (area.width + parent.style.paddingRight),
        parent.area.top + topPosition + parent.style.paddingTop,
        area.width,
        area.height - parent.style.paddingVertical);
  }

}