part of FrameUI;

class CenterPanel extends Panel {


  singleCalc() {

    int left = 0,
        top = 0,
        right = 0,
        bottom = 0,
        width = 0,
        height = 0;

    if (parent is Rendering) {
      left = parent.style.paddingLeft;
      top = parent.style.paddingTop;
      right = parent.absoluteArea.right - parent.style.paddingRight;
      bottom = parent.absoluteArea.bottom - parent.style.paddingBottom;

      parent.elements
      .where((element){ return element.style.visible; })
      .forEach((element){
        if (element is TopPanel && element.absoluteArea.bottom > top) {
          top = element.absoluteArea.bottom;
        }

        if (element is BottomPanel && element.absoluteArea.top < bottom) {
          bottom = element.absoluteArea.top;
        }

        if (element is LeftPanel && element.absoluteArea.right > left) {
          left = element.absoluteArea.right;
        }

        if (element is RightPanel && element.absoluteArea.left < right) {
          right = element.absoluteArea.left;
        }
      });
    }

    width = right - left;
    height = bottom - top;

    _area = new Rectangle(
        0,
        0,
        width,
        height);

    _absoluteArea = new Rectangle(
        left,
        top,
        width,
        height);

  }



}