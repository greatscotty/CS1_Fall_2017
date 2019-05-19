int beaconX;
int beaconY;
int beaconSize;

void setup()
{
    size(512, 512);
    background(0);

    beaconX = width/2; 
    beaconY = height/2;
    beaconSize = width/8;
    circle(beaconX, beaconY, beaconSize); 
}

void draw() 
{
    background(0);
    circle(beaconX, beaconY, beaconSize); 
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