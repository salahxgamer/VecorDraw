void features() { //<>// //<>// //<>//
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
    for (Layer layer : layers)
      for (PVector v : layer.shape ) {
        if (dist(v.x, v.y, mouseX, mouseY) < AUTOSNAP_BUFFER)
          mouseC = v.copy();
      }
    if (keyCode == SHIFT  && keyPressed ) {
      PVector v = CurrLayer.getVertex(-1);    // get the last vertex/vector
      float dx = (mouseX - v.x);
      float dy = (mouseY - v.y);
      float adx = abs(dx);
      float ady = abs(dy);
      switch(AlignVMode) {
      case "" :
        if (adx < ady+AUTOSNAP_BUFFER && adx > ady - AUTOSNAP_BUFFER)
          AlignVMode = "B";
        else
          AlignVMode = (adx < ady) ? "V" : "H";
        break;
      case "H" :
        mouseC.y = v.y;
        break;
      case "V" :
        mouseC.x = v.x;
        break;
      case"B":
        float len = min(adx, ady);
        mouseC.x = v.x + len * (dx/adx);
        mouseC.y = v.y + len * (dy/ady);
        break;
      }
    } else {  
      AlignVMode = "";
    }
  }
}
void keyPressed(KeyEvent event) {
  int prsdKEY = event.getKeyCode();
}
