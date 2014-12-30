
import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

main() {

  int width = 800, height = 600;

  FrameUI.start();

  FrameUI.Frame frame1 = new FrameUI.Frame(
      new Rectangle(0, 0, width, height));
  frame1.mount(document.body);
  frame1.area = new Rectangle(0, 0, 400, 600);

  FrameUI.Frame frame2 = new FrameUI.Frame.fromContext(frame1.context);
  frame2.area = new Rectangle(400, 0, 400, 600);

  // TOP PANEL
  FrameUI.TopPanel controlbar = new FrameUI.TopPanel();
  frame1.elements.add(controlbar);

  FrameUI.IconButton add =
      new FrameUI.IconButton(name: "Add", action: (){print("press add");});
  controlbar.elements.add(add);
  add.style.cursor = FrameUI.CURSOR.POINTER;

  FrameUI.IconButton save =
      new FrameUI.IconButton(name: "Save", action: (){print("press save");});
  controlbar.elements.add(save);
  save.style.cursor = FrameUI.CURSOR.POINTER;

  // internal panel
  FrameUI.BottomPanel statusbar = new FrameUI.BottomPanel();
  frame1.elements.add(statusbar);

  FrameUI.IconButton chart =
      new FrameUI.IconButton(name: "Chart1", action: (){print("press chart");});
  statusbar.elements.add(chart);
  chart.style.cursor = FrameUI.CURSOR.PROGRESS;

  // left panel
  FrameUI.LeftPanel inventary = new FrameUI.LeftPanel();
  frame2.elements.add(inventary);

  FrameUI.IconButton compile =
      new FrameUI.IconButton(name: "Compile", action:(){print("press compile");});
  inventary.elements.add(compile);

  FrameUI.IconButton computer =
      new FrameUI.IconButton(name: "Computer", action:(){print("press computer");});
  inventary.elements.add(computer);

  // right panel
  FrameUI.RightPanel extra = new FrameUI.RightPanel();
  frame2.elements.add(extra);

  FrameUI.IconButton folderAdd =
      new FrameUI.IconButton(name: "Folder-Add", action: (){print("press fAdd");});
  extra.elements.add(folderAdd);

  FrameUI.IconButton folderDel =
      new FrameUI.IconButton(name: "Folder-Del", action: (){print("press fDel");});
  extra.elements.add(folderDel);

  FrameUI.Scroll models = new FrameUI.Scroll();
  extra.elements.add(models);

  models.onChange.listen((FrameUI.ScrollItem item){
    if (item is FrameUI.ScrollItem) {
      print("Select ${item.title}");
    } else {
      print("Unselected");
    }
  });
  models.area = new Rectangle(0, 0, 250, 300);

  models.elements.add(new FrameUI.ScrollItem(1, "First value"));
  models.elements.add(new FrameUI.ScrollItem(2, "Second value"));
  models.elements.add(new FrameUI.ScrollItem(3, "Other value"));

}