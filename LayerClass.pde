class Layer {
  ArrayList<PVector> shape;
  String layerName;
  //----------- default layer settings :
  color fillColor = (int) map(random(1), 0, 1, #000000, #FFFFFF);
  color strokeColor = #101010;
  float strokeWeight = 1;
  boolean isActive = false;
  boolean isEmpty = true;
  //------------------------------------

  Layer(String name) {
    shape = new ArrayList<PVector>();
    layerName = name;
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
        if (this == CurrLayer)
          circle(vtx.x, vtx.y, 5);
        else isActive = false;
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
  void removeVertex(int id) {
    if (!shape.isEmpty()) {
      if (id < 0)
        id = shape.size() - id -2;
      shape.remove(id);
    }
  }
  String toString() {
    return layerName;
  }
}
void createLayer() {
  int id = layers.size();
  layers.add(new Layer("layer"+id));
  updateLayer(id);
}
void removeLayer(int id) {
  layers.remove(id);
  if (layers.size() == 0)
    createLayer();
  if (id == layers.size())
    updateLayer(id - 1);
}
void selectLayer() {
}
void updateLayer(int id) {
  layersDropList.setItems(toString(layers), id);
  CurrLayer = layers.get(id);
}
