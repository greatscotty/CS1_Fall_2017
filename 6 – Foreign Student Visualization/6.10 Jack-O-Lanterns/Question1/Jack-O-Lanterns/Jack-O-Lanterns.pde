final int pumpkinWidth = 89;
final int pumpkinHeight = 71;

class Pumpkin
{
  float x;
  float y;

  Pumpkin(float newX, float newY)
  {
    x = newX;
    y = newY;
  }
}

void setup()
{
  size(800, 600);
  background(0);
  smooth();
}

void draw()
{
  Pumpkin p = new Pumpkin(width/2, height/2);
  drawPumpkin(p);
}

void drawPumpkin(Pumpkin p)
{
  fill(232, 117, 23);
  ellipse(p.x, p.y, pumpkinWidth, pumpkinHeight);

  fill(0, 120, 0);
  quad(p.x - 3, p.y - pumpkinHeight/2 + 5, 
       p.x - 5, p.y - pumpkinHeight/2 - 5, 
       p.x + 5, p.y - pumpkinHeight/2 - 5, 
       p.x + 3, p.y - pumpkinHeight/2 + 5);
}