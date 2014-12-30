
import "dart:html";
import "dart:async";

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

  FrameUI.IconButton save =
      new FrameUI.IconButton(name: "Save", action: (){print("press save");});
  controlbar.elements.add(save);
  save.style.cursor = FrameUI.CURSOR.POINTER;

  // internal panel
  FrameUI.BottomPanel statusbar = new FrameUI.BottomPanel();
  frame.elements.add(statusbar);

  FrameUI.IconButton chart =
      new FrameUI.IconButton(name: "Chart1", action: (){print("press chart");});
  statusbar.elements.add(chart);
  chart.style.cursor = FrameUI.CURSOR.PROGRESS;

  // left panel
  FrameUI.LeftPanel inventary = new FrameUI.LeftPanel();
  frame.elements.add(inventary);

  FrameUI.IconButton compile =
      new FrameUI.IconButton(name: "Compile", action:(){print("press compile");});
  inventary.elements.add(compile);

  FrameUI.IconButton computer =
      new FrameUI.IconButton(name: "Computer", action:(){print("press computer");});
  inventary.elements.add(computer);

  // right panel
  FrameUI.RightPanel extra = new FrameUI.RightPanel();
  frame.elements.add(extra);

  FrameUI.IconButton folderAdd =
      new FrameUI.IconButton(name: "Folder-Add", action: (){print("press fAdd");});
  extra.elements.add(folderAdd);

  FrameUI.IconButton folderDel =
      new FrameUI.IconButton(name: "Folder-Del", action: (){print("press fDel");});
  extra.elements.add(folderDel);

  new Timer(new Duration(seconds: 4), (){
    frame.context.canvas.width = 900;
    frame.context.canvas.height = 200;
    frame.update();
  });

}