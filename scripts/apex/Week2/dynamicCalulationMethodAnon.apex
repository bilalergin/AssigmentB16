Calculator c = new Calculator();
system.debug(c.dynamicCalulationMethod(30, 30.60, 'ADDITION'));
system.debug(c.dynamicCalulationMethod(90, 60, 'SUBTRACTION'));
system.debug(c.dynamicCalulationMethod(8, 2, 'DIVISION'));
system.debug(c.dynamicCalulationMethod(6, 4, 'MULTIPLICATION'));


//Statiklerde yeni instance oluşturmuyoruz.
Calculator.calculateDiscount(1000);
Calculator.calculateDiscount(800);
Calculator.calculateDiscount(300);
Calculator.calculateDiscount(80);


Calculator.calculateNetPrice(1000, 3.5);