

final color redColor = color(240,0,0);
final color greenColor = color(0,240,0);
final color blueColor = color(0,0,240);
final color blankScreenColor = color(255);

final int paintRadius = 5; 

color currentColor;

void setup()
{
size(500,500);
background(blankScreenColor);

noStroke();

currentColor = redColor;
fill(currentColor);
}

void draw()
{

}

void keyPressed()
{
  switch(key)
  {
    case 'r':
      currentColor = redColor;
      break;
    case 'g':
      currentColor = greenColor;
      break;
    case 'b':
      currentColor = blueColor;
      break;
    case ' ':
      background(blankScreenColor);
      break;
    default:
      // Do nothing
      break;
  }
}

void mouseDragged()
{
  fill(currentColor);
  ellipse(mouseX,mouseY, paintRadius,paintRadius);
}
