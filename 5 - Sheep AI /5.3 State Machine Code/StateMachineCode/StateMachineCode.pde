
final int cleanState = 1;
final int fullDirty = 2;
final int halfDirty = 3;

int robotState; 

int mudPuddleX;
int mudPuddleY;
int mudPuddleWidth;
int mudPuddleHeight;

int soapyPuddleX;
int soapyPuddleY;
int soapyPuddleWidth;
int soapyPuddleHeight;

int beaconX;
int beaconY;
int beaconSize;

final int robotNumber1 = 1;
int roboX1;
int roboY1;
int roboSize1;
int robotStopTime1;
float roboDirection1;
final int robotSpeed = 4;

void setup() 
{
    size(512, 512);
    robotState = cleanState;
    
    mudPuddleX = int(random(0, width));;
    mudPuddleY = int(random(0, height));
    mudPuddleWidth = int(random(0, width));
    mudPuddleHeight = int(random(0, height));
    
    soapyPuddleX = int(random(0, width));;
    soapyPuddleY = int(random(0, height));
    soapyPuddleWidth = int(random(0, width));
    soapyPuddleHeight = int(random(0, height));

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

}

void draw()
{
    background(100,0);
    drawMudPuddle();
    drawCleanPuddle();
    drawBeacon();
    drawRobo(roboX1, roboY1, roboSize1, roboDirection1);
    moveRobo1();
}

void updateRobotState()
{
    if (robotState == cleanState)
    {

    }
    else if (robotState == fullDirty)
    {

    }
    else if (robotState ==  halfDirty)
    {

    }
}


void drawMudPuddle()
{   
    fill(110, 60, 20);
    rectMode(CENTER);
    rectangle(mudPuddleX, mudPuddleY, mudPuddleWidth, mudPuddleHeight);
}

void drawCleanPuddle()
{
    fill(155, 245, 210);
    rectMode(CENTER);
    ellipse(soapyPuddleX, soapyPuddleY, soapyPuddleWidth, soapyPuddleHeight);  
}

void drawRobo(int robotX, int robotY, int robotSize, float roboDirection)
{
    fill(150);
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

void drawBeacon()
{
    fill(0);
    circle(beaconX, beaconY, beaconSize);
}
