import java.util.Calendar;

ArrayList<MassMover> orbs;
Orb biggie;
Orb buddy;
Orb buddy2;
Orb buddy3;
Orb buddy4;
boolean run;

void setup()
{
   size(1000, 700); 
   background(0);
   orbs = new ArrayList<MassMover>();
   biggie = new Orb(new PVector(500, 350), 30, orbs);
   orbs.add(biggie);
   buddy = new Orb(new PVector(650, 350), 10, orbs);
   buddy.setVelocity(new PVector(0, -2));
   buddy2 = new Orb(new PVector(500, 200), 10, orbs);
   buddy2.setVelocity(new PVector(-2, 0));
   buddy3 = new Orb(new PVector(350, 350), 10, orbs);
   buddy3.setVelocity(new PVector(0, 2));
   buddy4 = new Orb(new PVector(500, 500), 10, orbs);
   buddy4.setVelocity(new PVector(2, 0));
   orbs.add(buddy);
   orbs.add(buddy2);
   orbs.add(buddy3);
   orbs.add(buddy4);
   run = true;
}

void draw()
{
  if(run) {
 // background(0);

//   switch (frameCount % 24)
//   {
//     case (0): 
//          {
//            Orb orb = new Orb(new PVector(500, 200), 10, orbs);
//            orb.setVelocity(new PVector(5, 0));
//            orbs.add(orb);
//            break;
//          }
//     case (3): 
//          {
//            Orb orb = new Orb(new PVector(200, 200), 10, orbs);
//            orb.setVelocity(new PVector(0, 0));
//            orbs.add(orb);
//            break;
//          }     
//     case (6):
//          {
//            Orb orb = new Orb(new PVector(350, 350), 10, orbs);
//            orb.setVelocity(new PVector(0, -5));
//            orbs.add(orb);
//            break;
//          }     
//     case (9): 
//          {
//            Orb orb = new Orb(new PVector(800, 200), 10, orbs);
//            orb.setVelocity(new PVector(0, 0));
//            orbs.add(orb);
//            break;
//          }  
//     case (12): 
//          {
//            Orb orb = new Orb(new PVector(650, 350), 10, orbs);
//            orb.setVelocity(new PVector(0, 5));
//            orbs.add(orb);
//            break;
//          }
//     case (15): 
//          {
//            Orb orb = new Orb(new PVector(800, 500), 10, orbs);
//            orb.setVelocity(new PVector(0, 0));
//            orbs.add(orb);
//            break;
//          } 
//     case (18): 
//          {
//            Orb orb = new Orb(new PVector(500, 500), 10, orbs);
//            orb.setVelocity(new PVector(-5, 0));
//            orbs.add(orb);
//            break;
//          }
//     case (21): 
//          {
//            Orb orb = new Orb(new PVector(200, 500), 10, orbs);
//            orb.setVelocity(new PVector(0, 0));
//            orbs.add(orb);
//            break;
//          }     
//     default:
//          { break; }
//   }
  
   switch (frameCount % 2)
   {
     case (0):
     {
       float degree = random(360.0);
       Orb orb = new Orb(new PVector(500+200*sin(degree), 350+200*cos(degree)), 10, orbs);
       orb.setVelocity(new PVector(-5*cos(degree), 5*sin(degree)));
       orbs.add(orb);
       break;
     }
     case (1):
     {
       float degree = random(360.0);
       Orb orb = new Orb(new PVector(500+100*sin(degree), 350+100*cos(degree)), 10, orbs);
       orb.setVelocity(new PVector(-5*cos(degree), 5*sin(degree)));
       orbs.add(orb);
       break;
     }
     case (2):
     {
       float degree = random(360.0);
       Orb orb = new Orb(new PVector(500+50*sin(degree), 350+50*cos(degree)), 10, orbs);
       orb.setVelocity(new PVector(-5*cos(degree), 5*sin(degree)));
       orbs.add(orb);
       break;
     }
     default: 
     {
       break;
     }
   }
   
   Orb lineOrb = (Orb)orbs.get(frameCount % orbs.size());
   for(int i = 0; i < orbs.size(); i++)
   {
       Orb tmp = (Orb)orbs.get(i);
       tmp.update();
       //tmp.display();  
//       fill(255);
//       stroke(255);    
//       ellipse(tmp.location.x, tmp.location.y, 1, 1);
       tmp.checkEdges();
       
       if(tmp.delete == true)
       {
           orbs.remove(i);
           if(i == 0)
           {
               biggie = new Orb(new PVector(500, 350), 30, orbs);
               orbs.add(0, biggie);
           }
           if(i == 1)
           {
               buddy = new Orb(new PVector(650, 350), 10, orbs);
               orbs.add(0, buddy);
           }
           if(i == 2)
           {
               buddy2 = new Orb(new PVector(500, 200), 10, orbs);
               orbs.add(0, buddy2);
           }
           if(i == 3)
           {
               buddy3 = new Orb(new PVector(350, 350), 10, orbs);
               orbs.add(0, buddy3);
           }
           if(i == 4)
           {
               buddy4 = new Orb(new PVector(500, 500), 10, orbs);
               orbs.add(0, buddy4);
           }
           else i--;
       }
           
       
       if(PVector.sub(buddy.location, tmp.location).mag() < 150)
       {
           int c = getColor(buddy, 100);
           stroke(255-c, 155-c, 100-c);
           strokeWeight(0.1);
           line(buddy.getLocation().x, buddy.getLocation().y, tmp.getLocation().x, tmp.getLocation().y);
       }
       if(PVector.sub(buddy2.location, tmp.location).mag() < 150)
       {
           int c = getColor(buddy2, 100);
           stroke(155-c, 100-c, 255-c);
           strokeWeight(0.1);
           line(buddy2.getLocation().x, buddy2.getLocation().y, tmp.getLocation().x, tmp.getLocation().y);
       }
       if(PVector.sub(buddy3.location, tmp.location).mag() < 150)
       {
           int c = getColor(buddy3, 100);
           stroke(255-c, 100-c, 155-c);
           strokeWeight(0.1);
           line(buddy3.getLocation().x, buddy3.getLocation().y, tmp.getLocation().x, tmp.getLocation().y);
       }
       if(PVector.sub(buddy4.location, tmp.location).mag() < 150)
       {
           int c = getColor(buddy4, 100);
           stroke(100-c, 155-c, 255-c);
           strokeWeight(0.1);
           line(buddy4.getLocation().x, buddy4.getLocation().y, tmp.getLocation().x, tmp.getLocation().y);
       }
           
   }
}}

void mouseClicked()
{
    if (run) run = false;
    else run = true;
}

int getColor(Mover m, int range)
{
  PVector center = new PVector(500, 350);
  int d = (int)PVector.sub(center, m.location).mag();
  return (int)map(d, 0, 612, 0, range);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
