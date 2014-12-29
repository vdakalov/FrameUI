
import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

main() {

  int width = 800, height = 600;

  FrameUI.Frame main = new FrameUI.Frame(width, height);
  main.mount(document.body);

  // TOP PANEL
  FrameUI.HorizontalPanel controlbar = new FrameUI.HorizontalPanel();
  main.panels.add(controlbar);
  controlbar.area = new Rectangle(0, 0, width, 32);

  FrameUI.IconButton add =
      new FrameUI.IconButton(name: "Add", action: (){print("press add");});
  controlbar.elements.add(add);
  add.style.cursor = FrameUI.CURSOR.POINTER;

  FrameUI.IconButton save =
      new FrameUI.IconButton(name: "Save", action: (){print("press save");});
  controlbar.elements.add(save);
  save.style.cursor = FrameUI.CURSOR.POINTER;

  // RIGHT PANEL
  FrameUI.VerticalPanel toolbar = new FrameUI.VerticalPanel();
  main.panels.add(toolbar);
  toolbar.area = new Rectangle(
      width - 250,
      controlbar.area.height,
      250,
      height - controlbar.area.height);

  FrameUI.Scroll models = new FrameUI.Scroll();
  toolbar.elements.add(models);

  models.area = new Rectangle(
      0, 0,
      toolbar.area.width - models.style.paddingHorizontal,
      300);

  models.items.add(new FrameUI.ScrollItem(0, "First model"));
  models.items.add(new FrameUI.ScrollItem(0, "Second model"));
  models.items.add(new FrameUI.ScrollItem(0, "Other model"));

  models.onChange.listen((item){
    print("change current model (${item is FrameUI.ScrollItem ? item.title : "null"})");
  });


}