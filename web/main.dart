
import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

main() {

  int width = 500, height = 500;

  FrameUI.Frame main = new FrameUI.Frame(width, height);
  main.mount(document.body);

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

}