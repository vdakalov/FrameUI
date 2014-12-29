part of FrameUI;

class HorizontalPanel extends Panel {

  HorizontalPanel() {
    style.padding = [4, 4, 4, 4];
  }

  @override
  render(CanvasRenderingContext2D context) {

    super.render(context);

    int offset = 0;

    elements.forEach((element){
      element.area = new Rectangle(
          area.left + style.paddingLeft + offset,
          area.top + style.paddingTop,
          element.area.width,
          element.area.height);

      offset += element.area.width;
      element.render(context);
    });

  }

}