Grass grass[] = new Grass[150];

void setup() 
{
    size(512, 512);
    int bladeNum = 0; 
    while (bladeNum < grass.length)
    {
        grass[bladeNum] = new Grass();
        grass[bladeNum].x = random(width);
        grass[bladeNum].y = random(height);
        grass[bladeNum].colour = color(0 , random(0,255), 0);
        grass[bladeNum].maxHeight = (int)random(-1, 20);
        grass[bladeNum].height = 0;

        bladeNum++;
    }
}

void draw() 
{
    int bladeNum = 0; 
    while (bladeNum < grass.length)
    {
        drawGrass(grass[bladeNum]);
        growGrass(grass[bladeNum]);

        bladeNum++;
    }
}

class Grass
{
  float x;
  float y;
  color colour;
  int height;
  int maxHeight;
}

void drawGrass(Grass bladeOfGrass)
{
    rectMode(CENTER);
    fill(bladeOfGrass.colour);
    rect(bladeOfGrass.x, bladeOfGrass.y, 3, bladeOfGrass.height);
}

void growGrass(Grass bladeOfGrass)
{
    if (bladeOfGrass.height < bladeOfGrass.maxHeight)
    {
        bladeOfGrass.height++;
    }
}