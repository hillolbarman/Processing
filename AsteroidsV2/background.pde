abstract class Object {
  final float objectMoveSpeed=1;
  PVector pos;
  Object() {
    this.pos=new PVector(random(height),random(width));
  }
  Object(float x) {
    this.pos=new PVector(random(x),random(width));
  }
  void move() {
    this.pos.x+=objectMoveSpeed;
  }
  abstract void render();
}

class Star extends Object {
  void render() {
    super.move();
    push();
    fill(255);
    stroke(255);
    circle(this.pos.y,this.pos.x,2);
    pop();
  }
}
