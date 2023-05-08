public class Circle {
    static decimal radius;
    string color;
    
    public Circle(){

    }
    public Circle(decimal r){
        radius = r;//static variablelarda this yazmıyoruz.

    }
    public Circle (decimal r, string c){
        radius = r;
        this.color = c;//static olmadığı için this kullandık.

    }
    public static void setRadius(Decimal r){
        radius =r;//sette parametre var
    }
    public static decimal getRadius(){
        return radius;//gette return var
    }
    public void setColor(String c){
        this.color = c;    
    }
    public string getColor(){
        return color;
    }

    public static decimal calculateArea(){
        return (Math.PI*radius*radius).setScale(2);//daire alan hesaplama pi r kare
    }

    public static Decimal calculateCircumference(){
        return 2*(math.PI*radius).setScale(3);
    }

    
}