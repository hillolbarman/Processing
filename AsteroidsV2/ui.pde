import java.util.Collections;
class UI {
  int score;
  UI() {
    score=0;
  }
  void updateScore() {
    score+=1;
    if(score%10==0) {
      maxNoOfRocks+=2;
      if (maxNoOfRocks%20==0 && fireRate>=5)
        fireRate--;
    }
  }
  void displayUI() {
    textAlign(LEFT);
    textSize(16);
    text("Score: "+Integer.toString(score), 5, 20);
    textAlign(RIGHT);
    text("Highest Score: "+Integer.toString(Collections.max(scores)),width-5,20);
    text("Previous Score: "+Integer.toString(scores.get(scores.size()-1)),width-5,20+20);
  }
  void showGameOver() {
    background(0);
    textSize(32);
    textAlign(CENTER);
    text("GAME OVER!!", width/2, height/2);
    textSize(24);
    text("Score: "+Integer.toString(score), width/2, height/2+48);
    textSize(16);
    text("Press R to play again..", width/2, (height/2+48+24+16));
    textSize(16);
    text("Press ESC to exit game..", width/2, (height/2+48+24+16+16+8));
    
    textAlign(BOTTOM);
    text("Made by HILLOL BARMAN",width-215,height-16);
  }
  void start() {
    background(0);
    textSize(24);
    textAlign(CENTER);
    text("...Click on screen to start...", width/2, height/2);
    textSize(16);
    text("..Press W to boost..", width/2, (height/2+24+16));
    text("..Use A & D to turn..", width/2, (height/2+24+16+8+16));
    text("..Press R to restart..", width/2, (height/2+24+16+8+16+8+16));
    text("..Press ESC to exit game..", width/2, (height/2+24+16+8+16+8+16+8+16));
    textAlign(BOTTOM);
    text("Made by HILLOL BARMAN",width-215,height-16);
  }
}
