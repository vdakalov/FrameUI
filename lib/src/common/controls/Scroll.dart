part of FrameUI;

class Scroll extends Rendering {

  ScrollItem _selected;

  ScrollItem get selected => _selected;
  void set selected(ScrollItem item) {
    if (_selected is ScrollItem) {
      _selected.isActive = false;
    }

    if (item is ScrollItem) {
      item.isActive = true;
    }

    _selected = item;
    _onChange.add(item);
  }

  StreamController<ScrollItem> _onChange = new StreamController<ScrollItem>();
  Stream<ScrollItem> get onChange => _onChange.stream;

  render(CanvasRenderingContext2D context) {

    int offset = 0;

    elements.forEach((element){
      element.area = new Rectangle(
          element.area.left,
          offset,
          area.width - style.paddingHorizontal,
          element.style.fontSize + style.paddingVertical);

      offset += element.area.height;

      if (offset > area.height) {
        if (parent.area.bottom - parent.style.paddingBottom >
            area.bottom + element.area.height) {
          area = new Rectangle(
              area.left,
              area.top,
              area.width,
              offset + style.paddingVertical);
        }
      }

    });

    super.render(context);

  }

  onAction(Point point, MouseEvent event) {
    elements.forEach((item){
      if (selected != item && item.absoluteArea.containsPoint(point)) {
        selected = item;
      }
    });
  }
}

class ScrollItem extends ActiveRendering {

  int id;
  String title;

  ScrollItem(int this.id, String this.title);

  render(CanvasRenderingContext2D context) {

    super.render(context);

    context..fillStyle = "rgb(30, 30, 30)"
           ..textBaseline = "middle"
           ..font = "${style.fontSize}px ${style.fontFamily}"
           ..fillText(
               title,
               absoluteArea.left + style.paddingLeft + (isActive ? 1 : 0),
               absoluteArea.top + style.paddingTop + (style.fontSize / 2) +
                  (isActive ? 1 : 0))
           ;

  }

}