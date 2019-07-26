Grass grass[] = new Grass[3000];

void setup() 
{
    size(512, 512);
    int bladeNum = 0; 
    while (bladeNum < grass.length)
    {
        grass[bladeNum] = new Grass();
        grass[bladeNum].x = random(25, width-25);
        grass[bladeNum].y = random(25, height-25);
        grass[bladeNum].colour = color(0 , random(0,255), 0);
        grass[bladeNum].maxHeight = (int)random(10, 20);
        grass[bladeNum].height = 0;

        bladeNum++;
    }
}

void draw() 
{
    background(100);
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
  final int width =3;
}

class LawnMower
{
    float x;
    float y; 
    float width;
    float height;
}

void drawGrass(Grass bladeOfGrass)
{
    fill(bladeOfGrass.colour);
    rect(bladeOfGrass.x, bladeOfGrass.y, bladeOfGrass.width, -bladeOfGrass.height);
}
 
// Not true growth growse in both directions. Nead to convert to Grow only upward. 
void growGrass(Grass bladeOfGrass)
{
    if (frameCount% 10 == 0) 
    {
        if (bladeOfGrass.height < bladeOfGrass.maxHeight)
        {
            bladeOfGrass.height++;
        }
    }
}

void cutGrass(Grass bladeOfGrass)
{   
    bladeOfGrass.height = 0; 
}

void mouseClicked()
{
    int bladeNum = 0;
    while (bladeNum < grass.length)
    {
        if (mouseX <= grass[bladeNum].x + grass[bladeNum].width/2 && mouseX >= grass[bladeNum].x - grass[bladeNum].width/2)
        {
            if (mouseY <= grass[bladeNum].y + grass[bladeNum].height/2 && mouseY >= grass[bladeNum].y - grass[bladeNum].height/2)
            {
                cutGrass(grass[bladeNum]);
                break;
            }
        }
        bladeNum++;
    }
}

void mouseMoved()
{
    int bladeNum = 0;
    while (bladeNum < grass.length)
    {
        if (mouseX -25 <= grass[bladeNum].x  && mouseX +25 >= grass[bladeNum].x )
        {
            if (mouseY -25 <= grass[bladeNum].y && mouseY +25 >= grass[bladeNum].y)
            {
                cutGrass(grass[bladeNum]);
            }
        }
        bladeNum++;
    }
}