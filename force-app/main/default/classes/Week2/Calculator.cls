public class Calculator {
    /*3. Create a class named Calculator class,
create a method and name it as dynamicCalulationMethod.
dynamicCalulationMethod should have three parameters.
First two parameters are for passing the decimal values and
The third one is for passing the operation that the user wants to do.
For Ex: Calling dynamicCalulationMethod with the following parameters should give the output
shown below.
a. Input → 10, 67.5, ADDITION Output → 77.5
b. Input → 90, 60, SUBTRACTION Output → 30
c. Input → 8, 2, DIVISION Output → 4
d. Input → 6,4, MULTIPLICATION Output → 24
e. dynamicCalulationMethod should return the value after doing the calculation.*/
public decimal dynamicCalulationMethod(decimal d1, decimal d2, string result){
    if (result== 'ADDITION'){
        return d1+d2;
        
    }
    else if (result == 'SUBTRACTION'){
        return d1-d2;
    }
    else if(result== 'DIVISION'){
        return d1/d2;
    }
    else if (result== 'MULTIPLICATION'){
        return d1*d2;
    }
    else return null;

}
/*4. Create a method named calculateDiscount in Calculator class
calculateDiscount method have one parameters. Return type is decimal.
parameter is decimal - totalPrice
Calculate and print following total prize
You have to return discount percentage (decimal) from this method keeping in mind following
discount rule.
- Discount will be 25% ( return0.25) when total Price is more than or equal to 1000.
- Discount will be 15% (return 0.15) when total Price is between 1000 and 800 (including 800)
- Discount will be 10% (return 0.10) when total Price is between 800 and 500 (including 500)
- Discount will be 5% (return 0.05) when total Price is between 500 and 100 (including 100)
- No discount if less than 100.
- call this method from anonymous apex with different values, and print discount in anonymous
apex file.
Example:
input: totalPrice = 899;
print: discount is 0.15*/
public static Decimal calculateDiscount(Decimal price){
    Decimal discount;
    if(price >= 1000){
        discount = 0.25;
    }else if (price  >=800 && price <1000){
        discount = 0.15;
    }else if (price >= 500 && price < 800){
        discount = 0.10;
    }else if (price >=100 && price < 500){
        discount =0.05;
    }else {
        System.debug('No discount');
    }
    System.debug(discount);
    return discount;
}

/*5. Create a method calculateNetPrice in Calculator class
calculateNetPrice method have two parameters. Return type is decimal.
first parameter is integer - quantity
second parameter is decimal - rate
Calculate and print following total prize:
- total price = rate x quantity
- discount price = total price x discount %
hint: use calculateDiscount (created in 4 question) to calculate discount %
- net price = total price - discount price
You have to return net Price (decimal) from this method
- Call this method from anonymous apex with different values and print net price in
anonymous apex
Example:
input: quantity = 1000, rate = 3.5
output:
print following in method
- total price = 3500
- discount price = 350
- net price = 3150
return net price and print in anonymous apex file ‘final price after discount is
3150’*/
public static decimal calculateNetPrice(Integer quantity, Decimal rate){
    Decimal totalPrice = quantity * rate;
    Decimal discountPrice = totalPrice * calculateDiscount(totalPrice);
    Decimal netPrice = totalPrice - discountPrice;
    System.debug('Total price is ' + totalPrice +' discount is ' + calculateDiscount(totalPrice) + ' final price after discount is ' + netPrice);
    return netPrice;
    

}

}