
import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

main() {

  int width = 800, height = 600;

  FrameUI.Frame main = new FrameUI.Frame(width, height);
  main.mount(document.body);

  // TOP PANEL
  FrameUI.HorizontalPanel controlbar = new FrameUI.HorizontalPanel();
  main.panels.add(controlbar);
  controlbar.area = new Rectangle(0, 0, width, 24);

  FrameUI.IconButton add =
      new FrameUI.IconButton(name: "Add", action: (){print("press add");});
  controlbar.elements.add(add);
  add.style.cursor = FrameUI.CURSOR.POINTER;

  FrameUI.IconButton save =
      new FrameUI.IconButton(name: "Save", action: (){print("press save");});
  controlbar.elements.add(save);
  save.style.cursor = FrameUI.CURSOR.POINTER;

  // RIGHT PANEL
  FrameUI.VerticalPanel models = new FrameUI.VerticalPanel();
  main.panels.add(models);
  models.area = new Rectangle(width - 250, controlbar.area.height, 250, 300);

}