float x;
float y;
int sizeX;
int sizeY;
color currentColor;

void setup()
{
  size(500,500);
  background(255);
  currentColor = color(255);
  sizeX = 25;
  sizeY = 25; 
}

void draw()
{
  
}

void picture(float x, float y, int sizeX, int sizeY, color fillColor)
{
 fill(fillColor);
 ellipse(x,y,sizeX,sizeY); //<>//
}

void keyPressed()
{
  switch(key)
  {
    case '1':
      currentColor = color(255);
      sizeX = 25;
      sizeY = 25; 
    break;
    case '2':
      sizeX = sizeX+25;
      sizeY = sizeY+25;
    break;
    case '3':
      currentColor = color(random(0,255),random(0,255),random(0,255));
    break;
    case ' ':
      picture(random(0,width),random(0,height),sizeX,sizeY, currentColor);
    break;
    default:
      //do nothing
    break;
  }
}
