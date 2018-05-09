int cols,rows;
float[][] buffer1,buffer2;
float damping=0.99;
void setup()
{
  size(600,600);
  cols=width;
  rows=height;
  buffer1 = new float[cols][rows];
  buffer2 = new float[cols][rows];
}
void mousePressed()
{
  buffer2[mouseX][mouseY]=255;
}
void mouseDragged()
{
  buffer2[mouseX][mouseY]=255;
}
void draw()
{
  background(0);
  loadPixels();
  for(int x=1;x<cols-1;x++)
    for(int y=1;y<rows-1;y++)
    {
      buffer2[x][y]=(buffer1[x-1][y]+buffer1[x+1][y]+buffer1[x][y-1]+buffer1[x][y+1])/2-buffer2[x][y];
      buffer2[x][y]=buffer2[x][y]*damping;
      int index=x+y*cols;
      pixels[index]=color(buffer2[x][y]*25);
    } 
   updatePixels();
   float[][] temp=buffer1;
   buffer1=buffer2;
   buffer2=temp;
}