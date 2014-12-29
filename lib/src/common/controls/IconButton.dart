part of FrameUI;

class IconButton extends ActiveRendering {

  String name;
  final ImageElement icon = new ImageElement();

  Function action;

  Rectangle get area =>
      new Rectangle(
          _area.left,
          _area.top,
          icon.width + style.paddingHorizontal,
          icon.height + style.paddingVertical);

  IconButton({
    String this.name,
    Function this.action,
    String path, String extension}) {

    setIcon(name: this.name, path: path, extension: extension);
  }

  setIcon({String name, String path, String extension}) {

    path = path is String ? path : "/resources/icons";
    extension = extension is String ? extension : "png";

    icon.src = "${path}/${name}.${extension}";
  }

  render(CanvasRenderingContext2D context) {

    super.render(context);

    context.drawImage(
        icon,
        area.left + style.paddingLeft + (isActive ? 1 : 0),
        area.top + style.paddingTop + (isActive ? 1 : 0));
  }

  onAction(Point point, MouseEvent event) {
    if (action is Function) {
      action();
    }
  }

}