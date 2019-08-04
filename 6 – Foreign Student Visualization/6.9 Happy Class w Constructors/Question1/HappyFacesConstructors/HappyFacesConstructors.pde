// Face testFace;
Face faces[] = new Face[3];


void setup() 
{
    size(512, 512);
    background(150);

    
   int faceNum = 0; 
    while (faceNum < faces.length)
    {
        faces[faceNum] = new Face(int(random(-11, 11)),random(0, width),random(0, height),80.0);
        // faces[faceNum].x = random(0, width);
        // faces[faceNum].y = random(0, height);
        // faces[faceNum].happiness = int(random(-11, 11));
        // faces[faceNum].diameter = 80;

        faceNum++;
    }

    // testFace = new Face();
    // testFace.x = 100;
    // testFace.y = 100;
    // testFace.happiness = -10;
    // testFace.diameter = 80;
}

void draw() 
{
    int faceNum = 0;
    while (faceNum < faces.length)
    {
    drawFace(faces[faceNum]);

    faceNum++;
    }
    // drawFace(testFace);
}

class Face
{
    int happiness;
    float x;
    float y;
    float diameter;

    Face(int happiness, float x, float y, float diameter)
    {
        this.happiness = happiness;
        this.x = x; 
        this.y = y; 
        this.diameter = diameter;
    }
}

void drawFace( Face face)
{    
    fill(150);
    circle(face.x, face.y, face.diameter);
    fill(250); //<>//
    ellipse(face.x - face.diameter/5 , face.y - face.diameter/4, face.diameter/5, face.diameter/3);
    ellipse(face.x + face.diameter/5 , face.y - face.diameter/4, face.diameter/5, face.diameter/3);
    noFill();

    if (face.happiness >= 0) //<>//
    {
        if (face.happiness == 0)
        {
            face.happiness = 1;
        }
        arc(face.x, face.y, face.diameter*3/4, face.diameter*3/4, (PI/2) - PI/2*(float(face.happiness)/10.0), (PI/2) + PI/2*(float(face.happiness)/10.0));
    }
    else
    {
        arc(face.x, face.y + (face.diameter/3), face.diameter*3/4, face.diameter*3/4, (3*PI/2) - PI/2*(float(face.happiness*-1)/10.0), (3*PI/2) + PI/2*(float(face.happiness*-1)/10.0));
    }
}