int beaconX;
int beaconY;
int beaconSize;

final int robotNumber1 = 1;
int roboX1;
int roboY1;
int roboSize1;
int robotStopTime1;
float roboDirection1;

final int robotNumber2 = 2;
int roboX2;
int roboY2;
int roboSize2;
int robotStopTime2;
float roboDirection2;

final int robotSpeed = 2;

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
    roboDirection1 = 0;
    robotStopTime1 = 0;  
    drawRobo(roboX1, roboY1, roboSize1, roboDirection1);

    roboX2 = width * 3/4;
    roboY2 = height * 3/4;
    roboSize2 = width/8;    
    roboDirection2 = 0;
    robotStopTime2 = 0;   
    drawRobo(roboX2, roboY2, roboSize2, roboDirection2);
}

void draw() 
{
    background(0);
    circle(beaconX, beaconY, beaconSize);
    drawRobo(roboX1, roboY1, roboSize1, roboDirection1);
    drawRobo(roboX2, roboY2, roboSize2, roboDirection2);
    robotStopper(1, robotStopTime1);
    robotStopper(2, robotStopTime2);
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

void drawRobo(int robotX, int robotY, int robotSize, float roboDirection)
{
    circle(robotX, robotY, robotSize);
    line(robotX, robotY, robotX + (30 * cos(roboDirection)) , robotY + (30 * sin(roboDirection)));
}

void moveRobo1()
{
    int nextX = roboX1 + int(robotSpeed * cos(roboDirection1));
    int nextY = roboY1 + int(robotSpeed * sin(roboDirection1));

    int crossProduct = crossProduct(nextX, nextY, roboX1, roboY1);
    
    if (dist(nextX, nextY, beaconX, beaconY) > (width/10))
    {
        roboX1 = nextX;
        roboY1 = nextY;
    }
    else 
    {
        robotStopTime1 = 180;
    }

    roboDirection1 = angleRandomizer(crossProduct,  roboDirection1);
}

 void moveRobo2()
{
    int nextX = roboX2 + int(robotSpeed * cos(roboDirection2));
    int nextY = roboY2 + int(robotSpeed * sin(roboDirection2));

    int crossProduct = crossProduct(nextX, nextY, roboX2, roboY2);
    
    if (dist(nextX, nextY, beaconX, beaconY) > (width/10))
    {
        roboX2 = nextX;
        roboY2 = nextY;
    }
    else 
    {
        robotStopTime2 = 180;
    }

    roboDirection2 = angleRandomizer(crossProduct,  roboDirection2);
}

void robotStopper(int robotNumber, int robotStopTime)
{
    if (robotStopTime == 0)
    {
        if(robotNumber == 1)
        {
            moveRobo1();
        }
        else
        {
            moveRobo2();
        }
    }
    else
    {
        if(robotNumber == 1)
        {
           robotStopTime1--;
        }
        else
        {
            robotStopTime2--;
        }
    }
}

int crossProduct( int nextX,  int nextY, int robotX, int robotY )
{
 return (nextX - robotX)*(beaconY - robotY) - (nextY - robotY)*(beaconX - robotX);
}

float angleRandomizer(int crossProduct, float roboDirection)
{
        if (random(1) < 0.05)
    {
        final int angleToTurn = 30;
        if (crossProduct < 0)
        {
        roboDirection -= radians(angleToTurn 
                            + random(angleToTurn/6.0f) 
                            - angleToTurn/8.0f);
        }
        else
        {
        roboDirection += radians(angleToTurn 
                            + random(angleToTurn/6.0f) 
                            - angleToTurn/8.0f);
        }
    }
    return roboDirection;
}