part of FrameUI;

class HorizontalPanel extends Panel {

  @override
  render(CanvasRenderingContext2D context) {

    super.render(context);

    int offset = 0;

    elements
    .where((element){ return element.style.visible; })
    .forEach((element){
      element.area = new Rectangle(
          area.left + style.paddingLeft + offset,
          area.top + style.paddingTop,
          element.area.width,
          element.area.height);

      offset += element.area.width + 2;
      element.render(context);
    });

  }

}