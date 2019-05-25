
final int grassBladeCount = 500;
final int numberOfDogs = 15; 
int currentBlade;
int dogCount;

PImage dogImage;

void setup() 
{
    size(512, 512);
    background(0);
    rectMode(CENTER);
    currentBlade = dogCount = 0;
    dogImage = loadImage("doggo.jpg"); //really dont feel like editing the photo HAHA!
}

void draw() 
{
    drawGrass();
    drawDog();
}

void drawGrass()
{
    while (currentBlade < grassBladeCount) 
    {
        int grassTipX = int(random(0 , width));
        int grassTipY = int(random(height * 1/2, height));

        fill(0, 255, 0);
        rect(grassTipX, grassTipY, 3, 7);
        currentBlade++;
    }
}

void drawDog()
{
    while( dogCount < numberOfDogs )
    {
        image(dogImage, random(0, width), random(0, height), width/4, height/4);
        dogCount++;
    }
    
}