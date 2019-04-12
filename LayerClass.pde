class Layer {
  ArrayList<PVector> shape;
  //----------- default layer settings :
  color fillColor = #343434;
  color strokeColor = #101010;
  float strokeWeight = 1;
  boolean isActive = true;
  boolean isEmpty = true;
  //------------------------------------
  
  Layer() {
    shape = new ArrayList<PVector>();
  }

  void render() {

    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWeight);
    isEmpty = true;
    if (!shape.isEmpty()) {
      isEmpty = false;
      beginShape();
      for (PVector vtx : shape) {
        vertex(vtx.x, vtx.y);
        //circle(vtx.x, vtx.y, shape.indexOf(vtx) * 2);
      }
      if (isActive)
        vertex(mouseC.x, mouseC.y);
      endShape();
    }
  }
  void addVertex(PVector vec) {
    shape.add(vec);
    isActive = true;
  }
  PVector getVertex(int id) {
    if (!shape.isEmpty()) {
      if (id < 0)
        id = shape.size() - id -2;
      return shape.get(id);
    }
    return null;
  }
}
