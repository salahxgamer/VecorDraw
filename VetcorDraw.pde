import g4p_controls.*;
//--------- initializing main elements
Layer CurrLayer;
ArrayList<Layer> layers;
PVector mouseC;
//-------------------------------------------
//--------- initializing constans / settings :
boolean isAutoSnapFV = true;  // if your mouse is near the first vertex by a radius of AUTOSNAP_BUFFER it will snap to it
boolean isAutoSnap = true;    // if your mouse is near a vertex by a radius of AUTOSNAP_BUFFER it will snap to it
boolean isAutoCMPLT = false;  // if the shape has closed in a loop you will left the trace mode
int AUTOSNAP_BUFFER = 20;
//-------------------------------------------
//--------- status variables used in sketch :
String AlignVMode = "";
boolean isTracing = false;
//-------------------------------------------

void setup() {
  size(800, 800);
  GUI();
  layers = new ArrayList<Layer>();
  createLayer();
}
void draw() {
  background(#151B48);
  mouseC = new PVector(mouseX, mouseY);
  features();
  for (int i = 0; i < layers.size(); i++)
    layers.get(i).render();

  fill(#d85555, 200);
  circle(mouseC.x, mouseC.y, 10);
}

void mousePressed(MouseEvent event) {
  int prsdBTN = event.getButton();
  if (isInWorkSpace(mouseC) && prsdBTN == 37) {
    CurrLayer.addVertex(mouseC);
  }
}
boolean isInWorkSpace(PVector trgt) {
  return (trgt.x >= 0 && trgt.x < width && trgt.y >= 0 && trgt.y < height);
}

String[] toString(ArrayList objects) {
  String[] strs = new String[objects.size()];
  int i = 0;
  if (objects.size()>0)
    for (Object obj : objects)
      strs[i++] = obj.toString();
  return strs;
}
