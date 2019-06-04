
final int numOfCars = 10;

int[] carX = new int[numOfCars];
int[] carY = new int[numOfCars];
int carWidth;
int carHeight;
float[] carV = new float[numOfCars];

int laneSpacing;
int[] laneLines = new int[numOfCars];

void setup() 
{
    size(512, 512);
    rectMode(CENTER);

    int carNum = 0; 

    laneSpacing = width / numOfCars;
    carHeight = laneSpacing / 2;
    carWidth = laneSpacing;
    
    while (carNum < carX.length)
    {
        laneLines[carNum] = carNum * laneSpacing;
        carX[carNum] = carWidth /2 + 5;
        carY[carNum] = (laneSpacing * carNum) + laneSpacing/2;
        carNum++;
    }
}

void draw() 
{   
    int carNum = 0;
    while (carNum < carX.length)
    {
        line(0, laneLines[carNum] , width, laneLines[carNum]);
        rect(carX[carNum], carY[carNum], carWidth, carHeight);
        carNum++;
    }
}
