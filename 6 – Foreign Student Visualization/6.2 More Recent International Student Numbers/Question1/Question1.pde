
String[] countryOfCitizenship;
int[] numYear2006;
int[] numYear2007;
int[] numYear2008;
int[] numYear2009;
int[] numYear2010;
int[] numYear2011;
int[] numYear2012;
int[] numYear2013;
int[] numYear2014;
int[] numYear2015;
int[] numYearQ1_Q32016;

final String filename = "CleanedUpData.csv";

void setup() 
{
  String[] lines = loadStrings(filename);
  int numCountries =  lines.length -3 -(249-192); 

  countryOfCitizenship = new String[numCountries];
  numYear2006 = new int[numCountries]; 
  numYear2007 = new int[numCountries];
  numYear2008 = new int[numCountries];
  numYear2009 = new int[numCountries];
  numYear2010 = new int[numCountries];
  numYear2011 = new int[numCountries];
  numYear2012 = new int[numCountries];
  numYear2013 = new int[numCountries];
  numYear2014 = new int[numCountries];
  numYear2015 = new int[numCountries];
  numYearQ1_Q32016 = new int[numCountries];


  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    if (lineIndex < 3 || lineIndex >= lines.length - (249-190)) 
    {  
      lineIndex++;
      continue;
    }

    int countryNum = lineIndex -3;
    String[] splitLine = lines[lineIndex].split(",");

    countryOfCitizenship[countryNum] = splitLine[0];
    numYear2006[countryNum] = Integer.parseInt(splitLine[1]); 
    numYear2007[countryNum] = Integer.parseInt(splitLine[2]);
    numYear2008[countryNum] = Integer.parseInt(splitLine[3]);
    numYear2009[countryNum] = Integer.parseInt(splitLine[4]);
    numYear2010[countryNum] = Integer.parseInt(splitLine[5]);
    numYear2011[countryNum] = Integer.parseInt(splitLine[6]);
    numYear2012[countryNum] = Integer.parseInt(splitLine[7]);
    numYear2013[countryNum] = Integer.parseInt(splitLine[8]);
    numYear2014[countryNum] = Integer.parseInt(splitLine[9]);
    numYear2015[countryNum] = Integer.parseInt(splitLine[10]);
    numYearQ1_Q32016[countryNum] = Integer.parseInt(splitLine[11]);
      
    lineIndex++;
  }

  int countryNum = 0;
  while (countryNum < numCountries)
  {
    println(countryOfCitizenship[countryNum]);
    countryNum++;
  }
  
  countryNum = 0;
  while (countryNum < numCountries)
  {
    println(numYear2006[countryNum]);
    countryNum++;
  }
}