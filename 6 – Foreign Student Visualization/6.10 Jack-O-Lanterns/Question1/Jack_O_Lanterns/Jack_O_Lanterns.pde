final int pumpkinWidth = 89;
final int pumpkinHeight = 71;
Pumpkin pumpkins[] = new Pumpkin[7];

class Pumpkin
{
  float x;
  float y;
  boolean jackOLantern;
  boolean lit;

  Pumpkin(float newX, float newY, boolean isJackOLantern, boolean isLit)
  {
    x = newX;
    y = newY;
    jackOLantern = isJackOLantern;
    lit = isLit;
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
    pumpkins[pumpkinNum] = new Pumpkin(random(0 + pumpkinWidth/2, width- pumpkinWidth/2), random(0 + pumpkinHeight/2, height - pumpkinHeight/2), true, false);
    pumpkinNum++;
  }
  initPumpkins(pumpkins);
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
    if (p.lit == true)
    {
      fill(250,200,95);
    }
    else
    {
      fill(0); 
    }
    ellipse(p.x - pumpkinWidth/5, p.y - pumpkinHeight/4, pumpkinHeight/4, pumpkinHeight/4);
    ellipse(p.x + pumpkinWidth/5, p.y - pumpkinHeight/4, pumpkinHeight/4, pumpkinHeight/4);
    triangle(p.x , p.y - pumpkinHeight/10, p.x + pumpkinWidth/10, p.y + pumpkinHeight/10, p.x - pumpkinWidth/10, p.y + pumpkinHeight/10);
    arc(p.x, p.y + pumpkinHeight/4 , pumpkinWidth/3, pumpkinHeight/5, 0, PI);
  }
}

void initPumpkins(Pumpkin[] patch)
{
  int pumpkinNum = 0; 
  while ( pumpkinNum < patch.length)
  {
    patch[pumpkinNum].x = ((pumpkinNum+1) * getHorizontalSpacing()) + pumpkinWidth*pumpkinNum + pumpkinWidth/2; 
    patch[pumpkinNum].y = height/2;
    patch[pumpkinNum].jackOLantern = randomBool();
    patch[pumpkinNum].lit = false;
    pumpkinNum++;
  }
}

boolean randomBool()
{
  return random(1) > 0.5;
}

float getHorizontalSpacing()
{
  return (width - (pumpkinWidth * pumpkins.length))/ (float)(pumpkins.length + 1);
}

void mouseClicked()
{
  int pumpkinNum = 0; 
  while (pumpkinNum < pumpkins.length) 
  {
    // if (mouseY > (pumpkins[pumpkinNum].y - pumpkinHeight) && mouseY < (pumpkins[pumpkinNum].y + pumpkinHeight))
    // {
    //   if (mouseX > (pumpkins[pumpkinNum].x - pumpkinWidth) && mouseX < (pumpkins[pumpkinNum].x + pumpkinWidth))
    //   {
    //     pumpkins[pumpkinNum].jackOLantern = true; 
    //   }
    // }

    if (dist(pumpkins[pumpkinNum].x, pumpkins[pumpkinNum].y, mouseX, mouseY) < pumpkinWidth/2)
    {
      if (pumpkins[pumpkinNum].jackOLantern == true)
      {
        pumpkins[pumpkinNum].lit = true;
      }
      else
      {
        pumpkins[pumpkinNum].jackOLantern = true; 
      }
    }

    pumpkinNum++;
  }
}