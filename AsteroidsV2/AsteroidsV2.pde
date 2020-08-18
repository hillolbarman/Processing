Map map;
List<Integer> scores;
Rock r;
void setup()
{
  size(1080,720);
  //fullScreen();
  frameRate(50);
  scores=new ArrayList<Integer>();
  scores.add(0);
  map=new Map();
}

void draw()
{
  loop();
  background(0);
  if (focused)
    map.updateFrame();
  else
    ui.start();
}

void keyPressed() 
{  
  if (key == CODED) {
    if (keyCode==ESC) {
      System.exit(0);
    }
  }
  if (key == 'd' || key=='D') {
    move="left";
  }
  if (key == 'a' || key=='A') {
    move="right";
  } 
  if (key=='w' || key=='W') {
    spaceship.isBoosting=true;
  }
  if (key == 32) {
    spaceship.fire();
  }
  if (key== 'r' || key=='R') {
    loop();
    map=new Map();
    draw();
  }
}

void keyReleased() {
  if (key == 'd' || key=='D' || key == 'a' || key=='A')
    move=" ";
  if (key=='w' || key=='W')
    spaceship.isBoosting=false;
}
