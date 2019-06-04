
final int numOfCars = 10;

float[] carX = new float[numOfCars];
int[] carY = new int[numOfCars];
int carWidth;
int carHeight;
float[] carV = new float[numOfCars];

int laneSpacing;
int[] laneLines = new int[numOfCars];

final int speedChangeInterval = 30;

boolean raceWon = false;

void setup() 
{
    size(512, 512);
    background(255);
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
        carV[carNum] = random(0.1, 3.0);
        carNum++;
    }
}

void draw() 
{  
    int carNum = 0;
    background(255);
    while (carNum < carX.length)
    {
        line(0, laneLines[carNum] , width, laneLines[carNum]);
        rect(carX[carNum], carY[carNum], carWidth, carHeight);
        carNum++;
    }
    raceFinished();
    if(raceWon != true)
    {
    movement();
    }
}

void movement()
{
    if (frameCount % speedChangeInterval == 0) // Every 30 frames adjust the car speed by a random value.
    {
        speedRandomizer();
    }
    int carNum = 0;
    while (carNum < carX.length)
    {
    carX[carNum] = carX[carNum] + carV[carNum];
    carNum++;
    }
}

void speedRandomizer()
{
    int carNum = 0;
    float speedDelta;

    while(carNum < carV.length)
    {
        speedDelta = random(-2, 2); //Set a random Speed change.
        if (carV[carNum] + speedDelta <= 0.1) // if the car speed would be negative or base speed, set the speed to the base speed.  
        {
            carV[carNum] = 0.1;
        }
        else 
        {
            carV[carNum] += speedDelta;
        }
        carNum++;
    }
}

void raceFinished()
{
    int carNum = 0;

    while (carNum < carX.length)
    {
        if (carX[carNum] + carWidth/2 >= width)
        {
            raceWon = true;
        }
        carNum++;
    }
}