
import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

main() {

  int width = 500, height = 500;

  FrameUI.Frame main = new FrameUI.Frame(width, height);
  main.mount(document.body);

  FrameUI.Panel controlbar = new FrameUI.Panel();
  main.panels.add(controlbar);

  controlbar.area = new Rectangle(0, 0, width, 28);


  FrameUI.IconButton add = new FrameUI.IconButton(name: "Add");
  controlbar.elements.add(add);

  add.area = new Rectangle(0, 0, 16, 16);
  add.style.cursor = FrameUI.CURSOR.POINTER;

}