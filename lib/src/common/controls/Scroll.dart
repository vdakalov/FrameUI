part of FrameUI;

class Scroll extends Rendering {

  final List<ScrollItem> items = new List<ScrollItem>();

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

    super.render(context);

    int offset = 0;

    items.forEach((item){
      item.area = new Rectangle(
          area.left + style.paddingLeft,
          area.top + style.paddingTop + offset,
          area.width - style.paddingHorizontal,
          item.style.fontSize + style.paddingVertical);

      offset += item.area.height;
      item.render(context);
    });

  }

  onAction(Point point, MouseEvent event) {
    items.forEach((item){
      if (item.area.containsPoint(point)) {
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
               area.left + style.paddingLeft + (isActive ? 1 : 0),
               area.top + style.paddingTop + (style.fontSize / 2) +
                  (isActive ? 1 : 0))
               ;

  }

}