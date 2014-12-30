part of FrameUI;

class VerticalPanel extends Panel {

  Rectangle get absoluteArea =>
      new Rectangle(
          parent.area.left + parent.style.paddingLeft,
          parent.area.top + parent.style.paddingTop,
          parent.area.width - parent.style.paddingHorizontal,
          area.height);

  Rectangle get area =>
      new Rectangle(
          parent.area.left,
          parent.area.top,
          parent.area.width,
          32);

  @override
  render(CanvasRenderingContext2D context) {

    super.render(context);

    int offset = 0;

    elements
    .where((element){ return element.style.visible; })
    .forEach((element){
      element.area = new Rectangle(
          area.left + style.paddingLeft,
          area.top + style.paddingTop + offset,
          element.area.width,
          element.area.height);

      offset += element.area.height + 2;
      element.render(context);
    });

  }

}