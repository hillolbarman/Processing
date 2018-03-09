void setup() {
  size(640, 480);
  colorMode(RGB, 1);
}
void draw() {
  background(255);

  float w = 5;
  float h = (w * height) / width;

  float xmin = -w/2;
  float ymin = -h/2;

  loadPixels();

  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 100;

  // x goes from xmin to xmax
  float xmax = xmin + w;
  // y goes from ymin to ymax
  float ymax = ymin + h;

  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);

  // Start y
  float y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin;
    for (int i = 0; i < width; i++) {

      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        if (a*a + b*b > 16.0) {
          break;  // Bail
        }
        n++;
      }
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } 
      else 
      {
        pixels[i+j*width] = color(sqrt(float(n) / maxiterations));
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
}