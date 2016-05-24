class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(PVector location, PVector velocity, PVector acceleration){
     this.location = location;
     this.velocity = velocity;
     this.acceleration = acceleration;
  }
  
  Mover()
  {
     location = new PVector(0, 0); 
     velocity = new PVector(0, 0); 
     acceleration = new PVector(0, 0); 
  }
  
  void setLocation(PVector location)
  {
      this.location = location;
  }
  
    void setVelocity(PVector velocity)
  {
      this.velocity = velocity;
  }
  
    void setAcceleration(PVector acceleration)
  {
      this.acceleration = acceleration;
  }
  
  PVector getLocation()
  {
    return location;
  }
  
   PVector getVelocity()
  {
    return velocity;
  }
  
   PVector getAcceleration()
  {
    return acceleration;
  }
  
  void update()
  {
      velocity = PVector.add(velocity, acceleration);
      location = PVector.add(location, velocity);
  }
}

class MassMover extends Mover
{
    PVector center;
    float mass;
    ArrayList<MassMover> others;
    
    
    MassMover(PVector center, float mass, PVector location, ArrayList<MassMover> list)
    {
       super(location, new PVector(0, 0), new PVector(0, 0)); 
       this.center = center;
       this.mass = mass;
       this.others = list;
    }
    
    PVector getCenter()
    {
      return center;
    }
    
    float getMass()
    {
      return mass;
    }
    
    void update()
    {
        velocity = PVector.add(velocity, acceleration);
        location = PVector.add(location, velocity);
        center = PVector.add(center, velocity);
        checkGravity();
    }
    
    void checkGravity()
   {
       for(int i = 0; i < others.size(); i++)
       {
           float m = others.get(i).getMass();
           PVector c = others.get(i).getCenter();
           float distance = PVector.sub(center, c).mag();
           if(distance != 0.0) {
               PVector change = PVector.sub(c,center);
               change.normalize();
               change.mult(m/(1.5*(distance*distance)));
               acceleration = change;
           }
           else {}
       }
   }
}

class Orb extends MassMover
{
  int radius;
  boolean delete = false;
  Orb(PVector location, int radius, ArrayList<MassMover> others)
  {
    super(location, 3.14*(radius*radius*radius), location, others);
    this.radius = radius;
  }
  
   void display()
   {
       stroke(255);
       fill(255);
       ellipse(getLocation().x, getLocation().y, radius, radius);
   }
   
   void checkEdges()
   {
       if(location.x <= 0 || location.y <= 0 || location.x >= 1000 || location.y >= 700)
             delete = true;
           
   }
   
}
