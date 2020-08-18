class Rock {
  PImage image;
  PVector vector, velocity;
  float radius, speed, rot,drot;
  Rock() {
    image=loadImage("source\\aa.png");
    vector=new PVector(-maxRockSize[1], random(width));
    radius=random(maxRockSize[0], maxRockSize[1]);
    velocity=PVector.random2D();
    speed=random(1, 5);
    velocity.setMag(speed);
    velocity.limit(4);
    this.rot=random(PI);
    this.drot=random(0,0.1);
  }
  void update() {
     this.velocity.limit(5);
     this.vector.add(this.velocity);

    if (this.vector.x < -maxRockSize[1] || this.vector.x > (height+maxRockSize[1])) {
      this.velocity.x *= -1;
    }
    if (this.vector.y < -maxRockSize[1] || this.vector.y > (width+maxRockSize[1])) {
      this.velocity.y *= -1;
    }
  }
  void drawObject() {
    push();
    stroke(175);
    
    translate(this.vector.y, this.vector.x);
    rotate(this.rot);
    rot+=drot;
    imageMode(CENTER);
    image(this.image,this.radius*0.1,-this.radius*0.05,this.radius*2.5,this.radius*2.5);
    pop();
  }
  void collision() {
    for (Rock r : rocks) {
      if (r!=this) {
        if (dist(this.vector.x, this.vector.y, r.vector.x, r.vector.y)<=(this.radius+r.radius)) {
          resolveCollision(r);
        }
      }
    }
  }

  void split(Bullet b) {
    if(this.radius>maxRockSize[0]) {
    PVector bulletDir = PVector.sub(this.vector, b.vector.mult(0.4)).setMag(this.velocity.mag());
    Rock c=new Rock();
    c.vector=this.vector.copy();
    c.radius=this.radius/2;
    c.velocity=bulletDir.copy().setMag(-bulletDir.mag());
    c.rotateRock(this.velocity.heading()*(-150));
    rocks.add(c);
    Rock c1=new Rock();
    c1.vector=this.vector.copy();
    c1.radius=this.radius/2;
    c1.velocity=bulletDir.copy().setMag(bulletDir.mag());
    c1.rotateRock(this.velocity.heading()*(-30));
    rocks.add(c1);
    }
    
  }

  PVector rotateA(PVector velocity, float angle) {
    PVector newVel=new PVector();
    newVel.x= (float)(velocity.x * Math.cos(angle) - velocity.y * Math.sin(angle));
    newVel.y= (float)(velocity.x * Math.sin(angle) + velocity.y * Math.cos(angle));
    return newVel;
  }
  void resolveCollision(Rock r) {
    float xVelocityDiff = this.velocity.x - r.velocity.x;
    float yVelocityDiff = this.velocity.y - r.velocity.y;

    float xDist = r.vector.x - this.vector.x;
    float yDist = r.vector.y - this.vector.y;

    if (xVelocityDiff * xDist + yVelocityDiff * yDist >= 0) {
      float angle = (float)-Math.atan2(r.vector.y - this.vector.y, r.vector.x - this.vector.x);
      float m1=this.radius*10;
      float m2=r.radius*10;
      PVector u1=rotateA(this.velocity, angle);
      PVector u2=rotateA(r.velocity, angle);
      PVector v1=new PVector(u1.x * (m1 - m2) / (m1 + m2) + u2.x * 2 * m2 / (m1 + m2), u1.y );
      PVector v2=new PVector(u2.x * (m1 - m2) / (m1 + m2) + u1.x * 2 * m2 / (m1 + m2), u2.y );
      u1=rotateA(v1, -angle);
      u2=rotateA(v2, -angle);

      this.velocity.x=u1.x;
      this.velocity.y=u1.y;
      r.velocity.x=u2.x;
      r.velocity.y=u2.y;
    }
  }
  
  void rotateRock(double theta) {
    float x=(float)(this.velocity.x*Math.cos(theta)-this.velocity.y*Math.sin(theta));
    float y=(float)(this.velocity.x*Math.sin(theta)+this.velocity.y*Math.cos(theta));
    this.velocity.x=x;
    this.velocity.y=y;
  }
}
