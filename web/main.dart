
import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

main() {

  int width = 800, height = 600;

  FrameUI.Frame frame = new FrameUI.Frame(
      new Rectangle(0, 0, width, height));
  frame.mount(document.body);

  // TOP PANEL
  FrameUI.TopPanel controlbar = new FrameUI.TopPanel();
  frame.elements.add(controlbar);

  FrameUI.IconButton add =
      new FrameUI.IconButton(name: "Add", action: (){print("press add");});
  controlbar.elements.add(add);
  add.style.cursor = FrameUI.CURSOR.POINTER;

  // internal panel
  FrameUI.BottomPanel statusbar = new FrameUI.BottomPanel();
  frame.elements.add(statusbar);

  FrameUI.IconButton save =
      new FrameUI.IconButton(name: "Save", action: (){print("press save");});
  statusbar.elements.add(save);
  save.style.cursor = FrameUI.CURSOR.POINTER;

  FrameUI.IconButton chart =
      new FrameUI.IconButton(name: "Chart1", action: (){print("press chart");});
  statusbar.elements.add(chart);
  chart.style.cursor = FrameUI.CURSOR.PROGRESS;

  // RIGHT PANEL
//  FrameUI.VerticalPanel toolbar = new FrameUI.VerticalPanel();
//  frame.elements.add(toolbar);
//  toolbar.area = new Rectangle(
//      width - 250,
//      controlbar.area.height,
//      250,
//      height - controlbar.area.height);
//
//  FrameUI.Scroll models = new FrameUI.Scroll();
//  toolbar.elements.add(models);
//
//  models.area = new Rectangle(
//      0, 0,
//      toolbar.area.width - models.style.paddingHorizontal,
//      300);
//
//  models.items.add(new FrameUI.ScrollItem(0, "First model"));
//  models.items.add(new FrameUI.ScrollItem(0, "Second model"));
//  models.items.add(new FrameUI.ScrollItem(0, "Other model"));
//
//  models.onChange.listen((item){
//    print("change current model (${item is FrameUI.ScrollItem ? item.title : "null"})");
//  });


}