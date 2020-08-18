class Bullet
{
  PVector vector,velocity;
  float speed;
  final int bulletSpeed=10,bulletLength=5;
  boolean hitEdge;
  Bullet(float x,float y) {
    this.vector=new PVector(x,y);
    this.speed=7;
    this.velocity = new PVector(sin(spaceship.direction+PI/2) * -this.speed, cos(spaceship.direction+PI/2) * -this.speed);
    hitEdge=false;
  }
  void update() {
    this.vector.add(velocity);
    if (this.vector.x < 0 || this.vector.x > (height)) {
      this.hitEdge=true;
      this.velocity.x *= -1;
    }
    if (this.vector.y < 0 || this.vector.y > (width)) {
      this.hitEdge=true;
      this.velocity.y *= -1;
    }
  }
  void drawObject() {
    push();
    strokeWeight(4);
    stroke(0,255,0);
    strokeWeight(4);
    point(this.vector.y,this.vector.x);
    pop();
  }
}
