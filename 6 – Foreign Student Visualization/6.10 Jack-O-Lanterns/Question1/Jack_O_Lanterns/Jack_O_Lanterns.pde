final int pumpkinWidth = 89;
final int pumpkinHeight = 71;
Pumpkin pumpkins[] = new Pumpkin[13];

class Pumpkin
{
  float x;
  float y;
  boolean jackOLantern;

  Pumpkin(float newX, float newY, boolean isJackOLantern)
  {
    x = newX;
    y = newY;
    jackOLantern = isJackOLantern;
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
    pumpkins[pumpkinNum] = new Pumpkin(random(0 + pumpkinWidth/2, width- pumpkinWidth/2), random(0 + pumpkinHeight/2, height - pumpkinHeight/2), true);
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

  if (p.jackOLantern == true) 
  {
    fill(0);
    ellipse(p.x - pumpkinWidth/5, p.y - pumpkinHeight/4, pumpkinHeight/4, pumpkinHeight/4);
    ellipse(p.x + pumpkinWidth/5, p.y - pumpkinHeight/4, pumpkinHeight/4, pumpkinHeight/4);
    triangle(p.x , p.y - pumpkinHeight/10, p.x + pumpkinWidth/10, p.y + pumpkinHeight/10, p.x - pumpkinWidth/10, p.y + pumpkinHeight/10);
    arc(p.x, p.y + pumpkinHeight/4 , pumpkinWidth/3, pumpkinHeight/5, 0, PI);
  }
}