import java.util.List;

UI ui;
Spaceship spaceship;
List<Bullet> bullets;
List<Rock> rocks;
Star stars[]=new Star[100];

final int spaceshipOffset=100;
final int spaceshipMoveSpeed=4;
int fireRate;
final int maxRockSize[]={spaceshipMoveSpeed*3, spaceshipMoveSpeed*12}; 
int maxNoOfRocks;
String move;

class Map {
  Map() {
    ui=new UI();
    spaceship=new Spaceship();
    bullets=new ArrayList<Bullet>();
    rocks=new ArrayList<Rock>();
    fireRate=(int)frameRate;
    maxNoOfRocks=7;
    move=" ";
    for (int i=0; i<100; i++) {
      stars[i]=new Star();
    }
  }

  void updateFrame() {
    this.back();
    createRocks();
    if (!move.equalsIgnoreCase(" ")) {
      spaceship.update(move);
    }
    spaceship.boost();

    for (Bullet b : bullets) {
      b.update();
      b.drawObject();
    }
    checkForHit();
    for (Rock r : rocks) {
      r.collision();
      r.update();
      r.drawObject();
    }
    spaceship.drawObject();
    ui.displayUI();
    if (spaceship.checkCollision()) {
      ui.showGameOver();
      scores.add(ui.score);
      noLoop();
    }
  }

  void createRocks() {
    for (int i=rocks.size(); i<maxNoOfRocks; i++)
      rocks.add(new Rock());
  }
  void checkForHit() {
    if (bullets.size()!=0) {
      for (int i=bullets.size()-1; i>=0; i--) {
        if (rocks.size()!=0) {
          for (int j=rocks.size()-1; j>=0; j--) {
            if (j==rocks.size() || i==bullets.size())  continue;
            if (dist(bullets.get(i).vector.x, bullets.get(i).vector.y, rocks.get(j).vector.x, rocks.get(j).vector.y)<rocks.get(j).radius) {
              ui.updateScore();
              rocks.get(j).split(bullets.get(i));
              bullets.remove(bullets.get(i));
              rocks.remove(rocks.get(j));
            }
          }
        }
      }
    }
  }
  void back() {
    for (Star s : stars) {
      s.move();
      s.render();
    }
    for(int i=stars.length-1;i>=0;i--) {
      if(stars[i].pos.x>height) {
        stars[i].pos.x=-1;
      }
    }
  }
}
