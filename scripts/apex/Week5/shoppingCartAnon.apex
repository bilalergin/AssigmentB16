 ShoppingCart sc1=new ShoppingCart();
//ShoppingCart sc1 =new ShoppingCart('Donald Duck');
 ShoppingCart sc5=new ShoppingCart('Bilal');

ShoppingCart.discount=0.05;
sc1.setName('Donald Duck');
sc1.addItem('chips');
sc1.addItems('cookies', 9.99);
sc1.addItems('pancake', 10.20);
Map<String,Decimal> m1=new  Map<String,Decimal>{'ketchub'=>5.55,'tea'=>6.00};
sc1.addItems(m1);
sc1.getShopItems();
system.debug('Total value of cart is '+sc1.getTotalAmount());
sc1.printSummary();
sc1.clearCart();
sc1.getShopItems();

ShoppingCart sc2=new ShoppingCart();
ShoppingCart.discount=0.10;
sc2.setName('Uncle Scrooge');
sc2.addItems('towels', 49.99);
sc2.addItems('Suit', 250.00);
sc2.addItems('watch', 199.00);
sc2.getShopItems();
system.debug('Total value of cart is '+sc2.getTotalAmount());
sc2.printSummary();
sc2.clearCart();
sc2.getShopItems();