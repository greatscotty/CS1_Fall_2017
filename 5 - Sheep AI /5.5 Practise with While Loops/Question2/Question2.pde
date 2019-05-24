
void setup()
{
    size(512, 512);
}

void draw() 
{
   spitScreen(50); 
}

void  spitScreen(int n)
{
    int segmentSize = width/n;
    int count = 0; 

    while (count <= n) 
    {
        if (count%2 == 0)
        {
            fill(0);
        }
        else
        {
            fill(255);
        }
        rect(count * segmentSize, 0, segmentSize, height);
        count++;
    }
}