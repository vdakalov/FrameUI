
import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

main() {

  int width = 500, height = 500;

  FrameUI.Frame main = new FrameUI.Frame(width, height);
  main.mount(document.body);

  FrameUI.Panel controlbar = new FrameUI.Panel();
  controlbar.area = new Rectangle(0, 0, width, 28);
  main.panels.add(controlbar);

}