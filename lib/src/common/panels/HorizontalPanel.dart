part of FrameUI;

class HorizontalPanel extends Panel {

  Rectangle get absoluteArea =>
      new Rectangle(
          parent.area.left + parent.style.paddingLeft,
          parent.area.top + parent.style.paddingTop,
          parent.area.width - parent.style.paddingHorizontal,
          area.height);

  Rectangle get area =>
      parent is Rendering ? new Rectangle(
          parent.area.left,
          parent.area.top,
          parent.area.width,
          32) :
            new Rectangle(0, 0, 0, 0);

  @override
  render(CanvasRenderingContext2D context) {

    elements.forEach((element){
      element.parent = this;
    });

    super.render(context);

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
      element.render(context);
    });

  }

}