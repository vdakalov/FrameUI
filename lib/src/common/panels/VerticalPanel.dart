part of FrameUI;

class VerticalPanel extends Panel {

  Rectangle _absoluteArea = new Rectangle(0, 0, 0, 0);
  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get absoluteArea => _absoluteArea;
  Rectangle get area => _area;

  singleCalc() {

    int topPostion = getTopPosition(),
        bottomPosition = getBottomPosition();

    _absoluteArea = new Rectangle(
              parent.area.left + parent.style.paddingLeft,
              parent.area.top + topPostion + parent.style.paddingTop,
              area.width,
              area.height - parent.style.paddingVertical);

    _area = new Rectangle(
        parent.area.left,
        0,
        32,
        bottomPosition - topPostion);
  }

  @override
  render(CanvasRenderingContext2D context) {

    super.render(context);

    int offset = 0;

    elements
    .where((element){ return element.style.visible; })
    .forEach((element){
      element.area = new Rectangle(
          element.area.left,
          area.top + offset,
          element.area.width,
          element.area.height);

      offset += element.area.height + 2;
      element.render(context);
    });

  }

  int getTopPosition() {
    int offset = 0;
    if (parent is Rendering) {

      parent.elements.forEach((element){
        if (element is TopPanel) {
          offset += element.area.height;
        }
      });
    }

    return offset;
  }

  int getBottomPosition() {
    int offset = 0;

    if (parent is Rendering) {
      offset = parent.area.height;
      parent.elements.forEach((element){
        if (element is BottomPanel) {
          offset -= element.area.height;
        }
      });
    }

    return offset;
  }

}