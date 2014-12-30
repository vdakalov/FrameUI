part of FrameUI;

class CURSOR {
  static final String DEFAULT = "default";
  static final String CROSSHAIR = "crosshair";
  static final String HELP = "help";
  static final String MOVE = "move";
  static final String POINTER = "pointer";
  static final String PROGRESS = "progress";
  static final String TEXT = "text";
  static final String WAIT = "wait";
}


class Style {

  List<int> backgroundColor = [220, 220, 220];

  int borderSize = 1;
  List<int> borderTopColor;
  List<int> borderLeftColor;
  List<int> borderRightColor;
  List<int> borderBottomColor;

  List<int> padding = [4, 4, 4, 4];

  int get paddingTop => padding[0];
  void set paddingTop(int size) { padding[0] = size; }

  int get paddingLeft => padding[3];
  void set paddingLeft(int size) { padding[3] = size; }

  int get paddingRight => padding[1];
  void set paddingRight(int size) { padding[1] = size; }

  int get paddingBottom => padding[2];
  void set paddingBottom(int size) { padding[2] = size; }

  int get paddingHorizontal => paddingLeft + paddingRight;

  int get paddingVertical => paddingTop + paddingBottom;

  int fontSize = 16;
  String fontFamily = "Verdana";

  bool visible = true;

  String cursor = CURSOR.DEFAULT;

  Style() {

    // BORDERS

    borderTopColor = backgroundColor.map((component){
      return component + 25 >= 255 ? 255 : component + 25;
    }).toList();

    borderLeftColor = borderTopColor;

    borderRightColor = backgroundColor.map((component){
      return component - 35 <= 0 ? 0 : component - 35;
    }).toList();

    borderBottomColor = borderRightColor;
  }

}