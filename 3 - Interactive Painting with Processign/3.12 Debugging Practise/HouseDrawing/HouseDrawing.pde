size(500,500);
background(255);

int houseWidth = 200;
int houseHeight = 150;
int houseX = width/2;
int houseY = height*2/3;

fill(70, 162, 31);
rect(0, height*2/3, width, height/3);

fill(234,210,121);

rectMode(CENTER);
rect(houseX, houseY, houseHeight, houseWidth);

fill(234, 121, 125);
triangle(houseX + houseWidth/2, //x1
         houseY - houseHeight/2, //x2
         houseX - houseWidth/2, //x2
         houseY - houseHeight/2, //y2
         houseY + houseWidth/2, //x3
         houseY - houseHeight/2 - 100);//y3