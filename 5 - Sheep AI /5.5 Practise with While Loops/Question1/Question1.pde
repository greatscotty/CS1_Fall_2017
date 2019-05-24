
int number;
int numberSpacing;

void setup() 
{
    number = 1;
    numberSpacing = width/27;
    size(512, 512);
    background(0);
}

void draw() 
{

    while (number <= 25) 
    {
        fill(255);
        text(number, numberSpacing, height/2);
        numberSpacing += width/26 ;
        number++;
    }
}
