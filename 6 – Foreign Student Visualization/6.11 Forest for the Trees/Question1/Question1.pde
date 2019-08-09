Tree trees[] = new Tree[10];

class Tree
{
    float x; 
    float y; 
    float width;
    float height;
    float radius; 
    color leafColour;
    color availibleColours[] = {color(0, 255, 0), color(255, 255, 0), color(255, 165, 0), color(255, 0, 0)};

    Tree(float newX, float newY)
    {
        this.x = newX;
        this.y = newY;
        this.radius = random(30, 70);
        // this.width = random(30, 70);
        this.width = 30;
        this.height = random(30, 70);
        this.leafColour = this.availibleColours[(int)random(0, 3)];
        println("this.color: "+this.leafColour);
    }
}

void setup() 
{
    size(512, 512);

    int treeNum = 0;
    while (treeNum < trees.length)
    {
        trees[treeNum] = new Tree(getHorizontalSpacing(treeNum, trees), height/2);
        treeNum++;
    }

}

void draw() 
{
    int treeNum = 0; 
    while (treeNum < trees.length)
    {
        drawTree(trees[treeNum]);
        treeNum++;
    }
}

float getHorizontalSpacing( int treeNum, Tree[] forest)
{
    float spacing = (width / (float)((forest.length*2) +1)) * (float)((2*treeNum) +2); // look into this equation, Why is it nor even spacing.
    return spacing;
}

void drawTree(Tree t)
{
    rectMode(CENTER);
    rect(t.x, t.y, t.width, t.height);
    line(t.x, 0, t.x, height);
}