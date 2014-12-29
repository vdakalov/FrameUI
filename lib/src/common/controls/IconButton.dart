part of FrameUI;

class IconButton extends Rendering {

  String name;
  final ImageElement icon = new ImageElement();

  Rectangle _area = new Rectangle(0, 0, 0, 0);

  Rectangle get area =>
      new Rectangle(
          _area.left,
          _area.top,
          icon.width + (style.paddingLeft + style.paddingRight),
          icon.height + (style.paddingTop + style.paddingBottom));

  void set area(Rectangle rect) {
    _area = rect;
  }

  IconButton({
    String this.name,
    String path,
    String extension}) {

    setIcon(name: this.name, path: path, extension: extension);
  }

  setIcon({String name, String path, String extension}) {

    path = path is String ? path : "/resources/icons";
    extension = extension is String ? extension : "png";

    icon.src = "${path}/${name}.${extension}";
  }

  render(CanvasRenderingContext2D context) {
    super.render(context);
    context.drawImage(icon, area.left, area.top);
  }

}