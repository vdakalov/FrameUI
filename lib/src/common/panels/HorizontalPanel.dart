part of FrameUI;

class HorizontalPanel extends Panel {

  Rectangle _absoluteArea = new Rectangle(0, 0, 0, 0);
  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get absoluteArea => _absoluteArea;
  Rectangle get area => _area;

  singleCalc() {

    _absoluteArea = new Rectangle(
        parent.area.left + parent.style.paddingLeft,
        parent.area.top + parent.style.paddingTop,
        parent.area.width - parent.style.paddingHorizontal,
        area.height);

    _area = new Rectangle(
        parent.area.left,
        parent.area.top,
        parent.area.width,
        32);
  }

  @override
  render(CanvasRenderingContext2D context) {

    int offset = 0;

    elements.forEach((element){
      element.area = new Rectangle(
          area.left + offset,
          element.area.top,
          element.area.width,
          element.area.height);

      offset += element.area.width + 2;
    });

    super.render(context);

  }

}