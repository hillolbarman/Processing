class Spaceship 
{
  PImage image,fire;
  PVector vector, velocity, acc;
  int size=spaceshipOffset/3;
  float direction=0;
  Boolean isBoosting=false;
  Spaceship() {
    this.image=loadImage("source\\ship.png");
    this.fire=loadImage("source\\fire2.png");
    this.vector=new PVector(height/2+size/2+10, width/2);
    this.direction=0;
    this.velocity = new PVector(0, 0);
  }
  void update(String direction) {
    if (direction.equalsIgnoreCase("left")) {
      this.direction+=0.07;
    }
    if (direction.equalsIgnoreCase("right")) {
      this.direction-=0.07;
    }
  }
  void drawObject() {
    push();
    
    translate(this.vector.y, this.vector.x);
    rotate(direction);
    fill(178,75,150,100);
    circle(0,0,size*1.3);
    imageMode(CORNER);
    image(this.image,-size+1,-33,size*2,size*2);
    if(isBoosting)
      image(this.fire,-size+20,size-10,size,size);
    pop();
  }
  void fire() {
    push();
    bullets.add(new Bullet(this.vector.x,this.vector.y));
    pop();
  }

  boolean checkCollision() {
    for (Rock r : rocks) {
      if (dist(vector.x, vector.y, r.vector.x, r.vector.y)<(r.radius+size)) 
        return true;
    }
    for (Bullet b : bullets) {
      if (dist(vector.x, vector.y, b.vector.x, b.vector.y)<(size*1.3) && b.hitEdge)
        return true;
    }
    return false;
  }

  void boost() {
    if (isBoosting) {
      PVector force = PVector.fromAngle(PI-this.direction);
      force.mult(0.15);
      velocity.add(force);
    }
    vector.add(velocity);
    velocity.mult(0.98);

    if (this.vector.x < size/2) {
      this.velocity.x *=-1;
    } else if (this.vector.x > height-size/2) {
      this.velocity.x *=-1;
    }
    if (this.vector.y < size/2) {
      this.velocity.y *=-1;
    } else if (this.vector.y > width-size/2) {
      this.velocity.y *=-1;
    }
  }
  void rotateShip(double theta) {
    float x=(float)(this.velocity.x*Math.cos(theta)-this.velocity.y*Math.sin(theta));
    float y=(float)(this.velocity.x*Math.sin(theta)+this.velocity.y*Math.cos(theta));
    this.velocity.x=x;
    this.velocity.y=y;
  }
}
