int ellipsePositionX ;
int ellipsePositionY ;

int ellipse2PositionX ;
int ellipse2PositionY ;


void setup()
{
  background(255);
  size(500,500);
  ellipsePositionX = width/4;
  ellipsePositionY = height/8;

  ellipse2PositionX = width/4;
  ellipse2PositionY = 7*height/8;
}

void draw()
{
ellipsePositionX = ellipsePositionX +1;
ellipse(ellipsePositionX,ellipsePositionY,25,25);

/** Question 2:
background(255);
ellipse2PositionX = ellipse2PositionX +1;
disappearingCircle();
*/
}
