public  class Planets {
    public string name;
    public integer planetNumber;
    integer numberOfMoon;
  
    public Planets(){this.details();}
  
    public Planets(string name, integer planetNumber,integer numberOfMoon){
  
      this.name=name;
      this.planetNumber=planetNumber;
      this.numberOfMoon=numberOfMoon;
      this.details();
  
    }
  
   
  
    public void details(){
      system.debug('planet name '+ name+' gunes ssteminde '+planetNumber+ 'siradadir.'+numberOfMoon+' tane uydusu vardir');
  
    }
  }