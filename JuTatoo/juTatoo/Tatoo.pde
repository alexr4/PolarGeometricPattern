//Tatoo parameters
void initTatoo()
{
  initVariables();
  computeParameters();
}

void initVariables()
{
  center = new PVector(width/2, height/2);
  globalRadius = 250;
  nbCircles = 3;
  nbCirclesInGlobal = 10;
  nbCircleInSecond = nbCirclesInGlobal;
  radiusList = new ArrayList<Float>();
  globalCircles = new ArrayList<PVector>();
  secondCircles = new ArrayList<PVector>();
}

void computeParameters()
{
  //computeRadius
  float rad = globalRadius / 4;
  for (int i=0; i<nbCircles; i++)
  {
    radiusList.add(rad);
  }

  //computeGlobalCircle
  for (int i=0; i<nbCirclesInGlobal; i++)
  {
    float theta = map(i, 0, nbCirclesInGlobal, 0, TWO_PI) - HALF_PI;
    float x = center.x + cos(theta) * globalRadius;
    float y = center.y + sin(theta) * globalRadius;

    globalCircles.add(new PVector(x, y));
  }

  //computeSecondCircle
  for (int i=0; i<nbCircleInSecond; i++)
  {
    float theta = map(i, 0, nbCircleInSecond, 0, TWO_PI) - HALF_PI;
    float x = center.x + cos(theta) * (globalRadius - radiusList.get(1)*2);
    float y = center.y + sin(theta) * (globalRadius - radiusList.get(1)*2);

    secondCircles.add(new PVector(x, y));
  }
}

void drawTatoo()
{
  //innerCircle
  noFill();
  stroke(0);

  ellipse(center.x, center.y, radiusList.get(2)*2, radiusList.get(2)*2);

  //secondInnerCircle
  for (int i = 0; i<secondCircles.size (); i++)
  {
    int i0 = i;
    int i1 = i;

    if (i < secondCircles.size()-1)
    {
      i1 = i+1;
    } else
    {
      i1 = 0;
    }

    PVector l0 = secondCircles.get(i0);
    PVector l1 = secondCircles.get(i1);

    ellipse(l0.x, l0.y, radiusList.get(1)*2, radiusList.get(1)*2);
    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
    //line from center
    line(center.x, center.y, l0.x, l0.y);
  }

  //line1
  for (int i = 0; i<secondCircles.size (); i+=2)
  {
    int i0 = i;
    int i1 = i;

    if (i < secondCircles.size()-2)
    {
      i1 = i+2;
    } else
    {
      i1 = 0;
    }

    PVector l0 = secondCircles.get(i0);
    PVector l1 = secondCircles.get(i1);

    ellipse(l0.x, l0.y, radiusList.get(1)*2, radiusList.get(1)*2);
    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
  }

  //line2
  for (int i = 1; i<secondCircles.size (); i+=2)
  {
    int i0 = i;
    int i1 = i;

    if (i < secondCircles.size()-2)
    {
      i1 = i+2;
    } else
    {
      i1 = 1;
    }

    PVector l0 = secondCircles.get(i0);
    PVector l1 = secondCircles.get(i1);

    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
  }

  //globalCircles
  //secondInnerCircle
  for (int i = 0; i<globalCircles.size (); i++)
  {
    int i0 = i;
    int i1 = i;

    if (i < globalCircles.size()-1)
    {
      i1 = i+1;
    } else
    {
      i1 = 0;
    }

    PVector l0 = globalCircles.get(i0);
    PVector l1 = globalCircles.get(i1);

    ellipse(l0.x, l0.y, radiusList.get(1)*2, radiusList.get(1)*2);
    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
    //line from center
    line(center.x, center.y, l0.x, l0.y);
  }

  //line1
  for (int i = 0; i<globalCircles.size (); i+=2)
  {
    int i0 = i;
    int i1 = i;

    if (i < globalCircles.size()-2)
    {
      i1 = i+2;
    } else
    {
      i1 = 0;
    }

    PVector l0 = globalCircles.get(i0);
    PVector l1 = globalCircles.get(i1);

    ellipse(l0.x, l0.y, radiusList.get(1)*2, radiusList.get(1)*2);
    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
  }

  //line2
  for (int i = 1; i<globalCircles.size (); i+=2)
  {
    int i0 = i;
    int i1 = i;

    if (i < globalCircles.size()-2)
    {
      i1 = i+2;
    } else
    {
      i1 = 1;
    }

    PVector l0 = globalCircles.get(i0);
    PVector l1 = globalCircles.get(i1);

    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
  }
  
  //lines between circles
   //line1
  for (int i = 0; i<globalCircles.size (); i+=2)
  {
    int i0 = i;
    int i1 = i;

    if (i < globalCircles.size()-2)
    {
      i1 = i+2;
    } else
    {
      i1 = 0;
    }

    PVector l0 = globalCircles.get(i0);
    PVector l1 = secondCircles.get(i1);
    PVector l2 = secondCircles.get(i0);
    PVector l3 = globalCircles.get(i1);

    ellipse(l0.x, l0.y, radiusList.get(1)*2, radiusList.get(1)*2);
    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
    line(l2.x, l2.y, l3.x, l3.y);
  }
  
   //line1
  for (int i = 1; i<globalCircles.size (); i+=2)
  {
    int i0 = i;
    int i1 = i;

    if (i < globalCircles.size()-2)
    {
      i1 = i+2;
    } else
    {
      i1 = 1;
    }

    PVector l0 = globalCircles.get(i0);
    PVector l1 = secondCircles.get(i1);
    PVector l2 = secondCircles.get(i0);
    PVector l3 = globalCircles.get(i1);

    ellipse(l0.x, l0.y, radiusList.get(1)*2, radiusList.get(1)*2);
    //line frome each other
    line(l0.x, l0.y, l1.x, l1.y);
    line(l2.x, l2.y, l3.x, l3.y);
  }

}

