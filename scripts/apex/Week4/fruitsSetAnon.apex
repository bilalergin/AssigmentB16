/*
1. In a new anonymous apex file, create a Set named as fruitsSet, store at least 4 fruits name in it.
a. Print fruits name from fruitsSet one by one.
b. Print the size of the fruitsSet.
c. Add a fruit name “Apricot” to the fruitsSet and print the fruitsSet.
d. Check if the fruitsSet contains the fruit ‘Apricot’
e. Check if the fruitsSet is empty?
*/

//1. In a new anonymous apex file, create a Set named as fruitsSet, store at least 4 fruits name in it.
Set<string> fruitSet = new Set<string>();
fruitSet.add('Apple');
fruitSet.add('Strawberry');
fruitSet.add('Orange');
fruitSet.add('Watermelon');
System.debug(fruitSet);//ile yazdırırsak liste içinde sonuç gelir

//a. Print fruits name from fruitsSet one by one.
for (string fruit : fruitSet) {
    System.debug('Fruit name is ' + fruit);//tek tek yazdırmak için for each yaptık. 

}

//b. Print the size of the fruitsSet.
Integer size = fruitSet.size();
System.debug('Size of fruitSet ' + size);

//c. Add a fruit name “Apricot” to the fruitsSet and print the fruitsSet.
fruitSet.add('Apricot');
System.debug('After apricot ' + fruitSet);

//d. Check if the fruitsSet contains the fruit ‘Apricot’
Boolean fruitCheck = fruitSet.contains('Apricot');
System.debug('Check apricot ' + fruitCheck);

//e. Check if the fruitsSet is empty?
Boolean checkEmpty = fruitSet.isEmpty();
System.debug('fruitSet is empty? ' + checkEmpty);

Boolean checksEmpty = !fruitSet.isEmpty();
System.debug('fruitSet is empty? ' + checksEmpty);
