part of FrameUI;

class VerticalPanel extends Panel {

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