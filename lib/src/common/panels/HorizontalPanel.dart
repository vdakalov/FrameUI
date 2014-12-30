part of FrameUI;

class HorizontalPanel extends Panel {

  singleCalc() {

    _absoluteArea = new Rectangle(
        parent.area.left + parent.style.paddingLeft,
        parent.area.top + parent.style.paddingTop,
        parent.area.width - parent.style.paddingHorizontal,
        area.height);

    int height = 0;

    elements.forEach((element){
      if (element.area.height > height) {
        height = element.area.height;
      }
    });

    _area = new Rectangle(
        parent.area.left,
        parent.area.top,
        parent.area.width,
        height + style.paddingVertical);
  }

  @override
  render(CanvasRenderingContext2D context) {

    int offset = 0;

    elements
    .where((element){ return element.style.visible; })
    .forEach((element){
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