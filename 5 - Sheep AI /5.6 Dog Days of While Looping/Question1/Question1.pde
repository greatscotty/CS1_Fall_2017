
final int grassBladeCOunt = 500;
int currentBlade;

PImage dogImage;

void setup() 
{
    size(512, 512);
    background(0);
    rectMode(CENTER);
    currentBlade = 0;
    dogImage = loadImage("doggo.jpg"); //really dont feel like editing the photo HAHA!
}

void draw() 
{
    drawDog(width/2, height/2);
    drawGrass();
}

void drawGrass()
{
    while (currentBlade < grassBladeCOunt) 
    {
        int grassTipX = int(random(0 , width));
        int grassTipY = int(random(height * 1/2, height));

        fill(0, 255, 0);
        rect(grassTipX, grassTipY, 3, 7);
        currentBlade++;
    }
}

void drawDog( int dogX, int dogY)
{
    image(dogImage, dogX, dogY, width/4, height/4);
}