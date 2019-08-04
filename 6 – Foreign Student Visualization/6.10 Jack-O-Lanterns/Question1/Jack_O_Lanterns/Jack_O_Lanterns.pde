final int pumpkinWidth = 89;
final int pumpkinHeight = 71;
Pumpkin pumpkins[] = new Pumpkin[13];

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

int pumpkinNum = 0;
  while (pumpkinNum < pumpkins.length) 
  {
    pumpkins[pumpkinNum] = new Pumpkin(random(0 + pumpkinWidth/2, width- pumpkinWidth/2), random(0 + pumpkinHeight/2, height - pumpkinHeight/2));
    pumpkinNum++;
  }
}

void draw()
{

  int pumpkinNum = 0; 
  while (pumpkinNum < pumpkins.length) 
  {
    drawPumpkin(pumpkins[pumpkinNum]);
    pumpkinNum++;
  }
  
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