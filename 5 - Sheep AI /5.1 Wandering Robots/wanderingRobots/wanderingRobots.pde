int beaconX;
int beaconY;
int beaconSize;

int roboX1;
int roboY1;
int roboSize1;
int roboDirection1;

int roboX2;
int roboY2;
int roboSize2;
int roboDirection2;

final int robotSpeed = 30;

void setup()
{
    size(512, 512);
    background(0);

    beaconX = width/2; 
    beaconY = height/2;
    beaconSize = width/10;
    circle(beaconX, beaconY, beaconSize); 

    roboX1 = width * 1/4; 
    roboY1 = height * 1/4; 
    roboSize1 = width/8; 
    drawRobo(roboX1, roboY1, roboSize1);

    roboX2 = width * 3/4;
    roboY2 = height * 3/4;
    roboSize2 = width/8;    
    drawRobo(roboX2, roboY2, roboSize2);
}

void draw() 
{
    background(0);
    circle(beaconX, beaconY, beaconSize);
    drawRobo(roboX1, roboY1, roboSize1);
    drawRobo(roboX2, roboY2, roboSize2);
}

void mouseDragged()
{
    if (mouseX <= (beaconX + beaconSize) && mouseX >= (beaconX - beaconSize))
    {
        if (mouseY <= (beaconY + beaconSize) && mouseY >= (beaconY - beaconSize)) 
        {
            beaconX = mouseX; 
            beaconY = mouseY; 
        }
    }
    else
    {
        // do nothing
    }
}

void drawRobo(int robotX, int robotY, int robotSize)
{
    circle(robotX, robotY, robotSize);
}

void moveRobo(int robotX, int robotY, int robotDirection )
{
  int nextX = robotX + int(robotSpeed * cos(robotDirection));
  int nextY = robotY + int(robotSpeed * sin(robotDirection));

  int crossProduct = (nextX - robotX)*(mouseY - robotY) -
                     (nextY - robotY)*(mouseX - robotX);
 
  if (dist(nextX, nextY, mouseX, mouseY) > 25)
  {
    robotX = nextX;
    robotY = nextY;
  }

  if (random(1) < 0.05)
  {
    final int angleToTurn = 30;
    if (crossProduct < 0)
    {
      robotDirection -= radians(angleToTurn 
                        + random(angleToTurn/4) 
                        - angleToTurn/8);
    }
    else
    {
      robotDirection += radians(angleToTurn 
                        + random(angleToTurn/4.0f) 
                        - angleToTurn/8.0f);
    }
  }
}