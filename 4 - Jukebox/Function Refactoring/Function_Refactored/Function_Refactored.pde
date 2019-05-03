/*
Generalization - The creation of each concentric circle with lighter colour and smaller size
                 is a process. It remains constant throughout the program always behaving the same. 
                 The same process must occur each time with the same events. Variables give clear
                 confines for the pices of the process pieces as their implementation never changes 
                 only the details contained within them. 

Hiding Details - Hiding details takes place in the variables themselves and the function built. The user
                 no longer need understand the full process that the program takes. Only the most basic
                 information of where to place the circles, how big the circle is to be, and the color they want
                 it. Everything else is not nessacary for the user to understand so we can improve 
                 clarity through hiding this information. 
*/

void setup()
{
  size(500,500);
  
}

void draw()
{
  background(255);
  /*
  
  Commented out for comparison.
  
  // Circle 1
  fill(180, 0, 0);
  ellipse(50, 50, 100, 100);
  
  fill(210, 30, 30);
  ellipse(50, 50, 50, 50);
 
  fill(240, 60, 60);
  ellipse(50, 50, 25, 25);
  
  ////
  // Circle 2
  fill(50, 50, 0);
  ellipse(275, 300, 200, 200);
  
  fill(80, 80, 30);
  ellipse(275, 300, 100, 100);
  
  fill(110, 110, 60);
  ellipse(275, 300, 50, 50);
  
  ////
  // Circle 3
  fill(0, 0, 195);
  ellipse(350, 80, 140, 140);
  
  fill(30, 30, 225);
  ellipse(350, 80, 70, 70);
  
  fill(60, 60, 255);
  ellipse(350, 80, 35, 35);
  */
  
  drawConcentricCircles(180, 0, 0, 50, 50, 100);
  drawConcentricCircles(50, 50, 0, 275, 300, 200);
  drawConcentricCircles(0, 0, 195, 350, 80, 140);
}

void drawConcentricCircles(int rValue, int gValue, int bValue, int x, int y, int diameter)
{
 fill(rValue, gValue, bValue);
 ellipse(x, y, diameter, diameter);
 
 fill(rValue +30, gValue +30, bValue +30);
 ellipse(x, y, diameter/2, diameter/2);
 
 fill(rValue +60, gValue +60, bValue +60);
 ellipse(x, y, diameter/4, diameter/4);
}
