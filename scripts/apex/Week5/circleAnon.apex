Circle c1 = new circle();
System.debug(c1);
c1.setColor('Blue');
System.debug(c1.getColor());
// c1.setRadius(5.5);
// System.debug(c1.getRadius());// böyle çağırırsak new intancedan dolayı çalışır
Circle.setRadius(5.5);
System.debug(Circle.getRadius());

System.debug(c1);

Decimal area1= Circle.calculateArea();
System.debug(area1);

Decimal circumference = Circle.calculateCircumference();
System.debug(circumference);


