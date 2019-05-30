
final color[] listOfColours =
{
   color(255, 0, 0), //red 
   color(230, 130 , 50), // orange
   color(245 , 200, 70), //yellow
   color(0, 255, 0), // green
   color(0, 0, 255), // blue
};

final int numberOfButtons = 10; 
int[] buttonColorIndex = new int[numberOfButtons];
int[] buttonX = new int[numberOfButtons];

int buttonSize;
int spacing; 
int buttonY;

void setup() 
{
    size(512, 512 );
    spacing = width/20;
    rectMode(CENTER);
    buttonY = height/2;
    buttonSize =  (width - (spacing * numberOfButtons + 1)) / numberOfButtons;

    buildColorIndexes();
    buildbuttonXArray();
}

void draw()
{
    drawButton();
}

void drawButton()
{   
    int currentButton = 0; 

    while (currentButton < numberOfButtons)
    {
        fill( listOfColours[ buttonColorIndex[currentButton] ] ); 
        rect( buttonX[currentButton], buttonY, buttonSize, buttonSize);
        currentButton++;

    }
}

void mouseClicked()
{
    int  currentButton = 0; 
    
    if (mouseY <= buttonY + buttonSize/2 && mouseY >= buttonY - buttonSize/2)
    { 
        while (currentButton < buttonColorIndex.length)
        {
            if( mouseX >= buttonX[currentButton] - (buttonSize/2) && mouseX <= buttonX[currentButton] + (buttonSize/2))
            {
                if (buttonColorIndex[currentButton] < (listOfColours.length -1))
                {
                    buttonColorIndex[currentButton]++;  
                }
                else
                {
                    buttonColorIndex[currentButton]= 0;
                }
            }
            currentButton++;
        }
    }
}

void buildColorIndexes()
{   
    int arrayIndex = 0;
    while (arrayIndex < buttonColorIndex.length)
    {
        buttonColorIndex[arrayIndex] = int(random(0, 5));
        arrayIndex++;
    }
}

void buildbuttonXArray()
{   
    int arrayIndex = 0;
    while (arrayIndex < buttonX.length)
    {
        buttonX[arrayIndex] = (arrayIndex * buttonSize) + (spacing * (arrayIndex +1));
        arrayIndex++;
    }
}
