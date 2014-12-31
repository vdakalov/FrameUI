// Copyright (c) 2014, Viktor Dakalov. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library FrameUI.example;

import "dart:html";
import "package:FrameUI/init.dart" as FrameUI;

main() {

  Rectangle canvasArea = new Rectangle(0, 0, 800, 600);

  // Запускаем рендеринг [window.requestAnimationFrame]
  FrameUI.start();

  // Создаем окно из canvasArea (под окно будет создан canvas)
  FrameUI.Frame frame1 = new FrameUI.Frame(canvasArea);

  // выгружаем canvas в DOM
  frame1.mount(document.body);

  // меняем размер окна (не canvas'а) на другой
  frame1.area = new Rectangle(0, 0, 400, 600);

  // создаем в том же контексте другое окно (по умолчанию размеры будут как у canvas'а)
  FrameUI.Frame frame2 = new FrameUI.Frame.fromContext(frame1.context);
  // ...меняем их
  frame2.area = new Rectangle(400, 0, 400, 600);

  // создаем панель для кнопок (TopPanel прижата к верху и занимает всю ширину)
  FrameUI.TopPanel controlbar = new FrameUI.TopPanel();
  // добавляем панель в первое окно
  frame1.elements.add(controlbar);

  // создаем кнопку
  FrameUI.IconButton add =
      new FrameUI.IconButton(
          name: "Add",
//          path: "/resources/icons", <- по умолчанию
//          extension: "png" <- по умолчанию
          action: (){ print("press add"); }
  );

  // добавляем кнопку на панель
  controlbar.elements.add(add);
  // меняем курсор
  add.style.cursor = FrameUI.CURSOR.POINTER;

  // еще одна кнопка
  FrameUI.IconButton save =
      new FrameUI.IconButton(name: "Save", action: (){print("press save");});
  controlbar.elements.add(save);
  save.style.cursor = FrameUI.CURSOR.POINTER;

  // Нижняя панель прижата к низу и занимает всю ширину окна
  FrameUI.BottomPanel statusbar = new FrameUI.BottomPanel();
  frame1.elements.add(statusbar);

  FrameUI.IconButton chart =
      new FrameUI.IconButton(name: "Chart1", action: (){print("press chart");});
  statusbar.elements.add(chart);
  chart.style.cursor = FrameUI.CURSOR.PROGRESS;

  // левая панель прижата левому краю и находится между верхней
  // и нижней панелями, если они есть
  FrameUI.LeftPanel inventary = new FrameUI.LeftPanel();
  frame2.elements.add(inventary);

  FrameUI.IconButton compile =
      new FrameUI.IconButton(name: "Compile", action:(){print("press compile");});
  inventary.elements.add(compile);

  FrameUI.IconButton computer =
      new FrameUI.IconButton(name: "Computer", action:(){print("press computer");});
  inventary.elements.add(computer);

  // правая панель
  FrameUI.RightPanel extra = new FrameUI.RightPanel();
  frame2.elements.add(extra);

  FrameUI.IconButton folderAdd =
      new FrameUI.IconButton(name: "Folder-Add", action: (){print("press fAdd");});
  extra.elements.add(folderAdd);

  FrameUI.IconButton folderDel =
      new FrameUI.IconButton(name: "Folder-Del", action: (){print("press fDel");});
  extra.elements.add(folderDel);

  // добавляем элемен - Список
  FrameUI.Scroll models = new FrameUI.Scroll();
  // добавляем на панель
  extra.elements.add(models);

  models.onChange.listen((FrameUI.ScrollItem item){
    print("Change size: ${item.title}");
    models.area = new Rectangle(
        models.area.left,
        models.area.top,
        item.id,
        models.area.height);
  });

  // нужно задать размеры
  models.area = new Rectangle(0, 0, 250, 300);

  models.elements.add(new FrameUI.ScrollItem(250, "Normal width"));
  models.elements.add(new FrameUI.ScrollItem(200, "Middle width"));
  models.elements.add(new FrameUI.ScrollItem(180, "Small width"));

  // центральная панель занимает всю сотавшуюся область
  FrameUI.CenterPanel workspace1 = new FrameUI.CenterPanel();
  frame1.elements.add(workspace1);

  FrameUI.CenterPanel workspace2 = new FrameUI.CenterPanel();
  frame2.elements.add(workspace2);


}

// своя панель
class MyPanel extends FrameUI.HorizontalPanel {
  // FrameUI.HorizontalPanel - расчитываем положение дочерних
  //                           элементов по горизонтали
  // FrameUI.VerticalPanel - так же следит за положением элементов по вертикали
  // FrameUI.Panel - Базовый класс панели

  // относительное положение и размеры панели (приватное, только хранение)
  Rectangle _area;

  // getter и setter по умолчанию
  Rectangle get area => _area;
  void set area(Rectangle rect) { _area = rect; }


  // приватное свойство хранит абсолютное положение панели в окне
  Rectangle _absoluteArea = new Rectangle(0, 0, 0, 0);

  // getter и setter по умолчанию
  Rectangle get absoluteArea => _absoluteArea;
  void set absoluteArea(Rectangle rect) { _absoluteArea = rect; }


  // метод автоматически вызывается когда нужно обновить/пересчитать
  // свои размеры, положение и прочие параметры
  singleCalc() {

    // по умолчанию вычисление абсолютного положения такое
    _absoluteArea = new Rectangle(
          area.left + parent.absoluteArea.left + parent.style.paddingLeft,
          area.top + parent.absoluteArea.top + parent.style.paddingTop,
          area.width,
          area.height);

    _area = new Rectangle(0, 0, 0, 0);

    // т.п.

  }

  // метод нужно реализовать если наследовались от FrameUI.Panel
  // но если наследовалисть от FrameUI.VerticalPane или FrameUI.HorizontalPanel
  // метод будет реализован с базовыми алгоритмами
  render(CanvasRenderingContext2D context) {

    // если расчитываем положение элементов сами
    int offset = 0;

    elements
    .where((element){ return element.style.visible; })
    .forEach((element){

      // обновляем положение
      element.area = new Rectangle(
          // относительное положение панели + смещение
          area.left + offset,
          // остальные параметры не трогаем
          element.area.top,
          element.area.width,
          element.area.height);

      // добавляем ширину к смещению
      offset += element.area.height;
    });

    // рисуем
    super.render(context);

    // для большей оптимизации можно разместить этот алгоритм
    // расчета в другом месте. Например можно создать приватное
    // свойство _elements и публичный метод add(Rendering element);
    // В этом методе следить за добавлением элементов и расчетом их
    // положения. И еще нужно не забыть написать
    // List<Rendering> get elements => _elements;

  }

}

// Свой элемент для панели
class Workspace extends FrameUI.Rendering {

  // здесь без изменений
  Rectangle _area;
  Rectangle _abstractArea;

  // если наследуемся от FrameUI.ActiveRendering
  // получим такое свойство (true если мышь зажата)
  bool isActive;
  // ...так же получим другой метод render. Он будет отрисовывать нажатие

  Workspace() {

    // стили относятся и к панелям тоже

    // меняем цвет фона
    style.backgroundColor = [255, 255, 255];

    // так же можно изменить курсор
    style.cursor = FrameUI.CURSOR.MOVE;

    // внутренние отступы (верхний,првый,нижный и левый)
    style.padding = [4, 2, 4, 2];
    style.paddingBottom = 2;

    // видимость
    style.visible = false;

    // границы
    style.borderLeftColor = [255, 0, 0];
    style.borderSize = 2;

  }

  singleCalc() {
    // здесь тоже без изменений
  }

  // true если мышь находится над элементом
  // точнее над его absoluteArea
  bool isHover;

  // события (клик)
  onAction(Point point, MouseEvent event) {}

  onHoverIn(Point point, MouseEvent event) {}
  onHoverOut(Point point, MouseEvent event) {}

  onMouseMove(Point point, MouseEvent event) {}
  onMouseDown(Point point, MouseEvent event) {}
  onMouseUp(Point point, MouseEvent event) {}

}





