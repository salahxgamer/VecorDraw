import g4p_controls.*;
//--------- initializing main elements
Layer layer = new Layer();
Layer CurrLayer = layer;
PVector mouseC;
//------------------------------------------
//--------- initializing constans / settings
boolean isAutoSnapFV = true;
boolean isAutoSnap = true;
int AUTOSNAP_BUFFER = 10;
//------------------------------------------

void setup() {
  size(800, 800);
  createGUI();
}
void draw() {
  background(#151B48);
  mouseC = new PVector(mouseX, mouseY);
  features();
  CurrLayer.render();
}

void mouseClicked(MouseEvent event) {
  int prsdBTN = event.getButton();
  if (isInWorkSpace(mouseC) && prsdBTN == 37) {
    CurrLayer.addVertex(mouseC);
  }
}
boolean isInWorkSpace(PVector trgt) {
  return (trgt.x >= 0 && trgt.x < width && trgt.y >= 0 && trgt.y < height);
}
void features() {
  autoSnapFV();
  autoSnap();
}
void autoSnapFV() {   // autosnap to the first vertex to make shape easy to close
  if (!CurrLayer.isEmpty && isAutoSnapFV && !isAutoSnap) {
    PVector v = CurrLayer.getVertex(-1);    // get the last vertex/vector
    if (dist(v.x, v.y, mouseX, mouseY) < AUTOSNAP_BUFFER)
      mouseC = v.copy();
  }
}
void autoSnap() {   // autosnap to the first vertex to make shape easy to close
  if (!CurrLayer.isEmpty) {
    for (PVector v : CurrLayer.shape ) {
      if (dist(v.x, v.y, mouseX, mouseY) < AUTOSNAP_BUFFER)
        mouseC = v.copy();
    }
  }
}
