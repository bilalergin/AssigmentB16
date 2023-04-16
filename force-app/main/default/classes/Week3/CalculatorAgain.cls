public class CalculatorAgain {
    public static Integer sumofPositiveIntegers(Integer n) {
        Integer sum;
        if (n< 0) {
            System.debug('We are not calculating the sum for negative numbers" and return null value');
            
             
        }else {
            sum =0;
            for (Integer i = 1; i <= n; i++) {
            sum = sum + i;
        }
                    
        }
        return sum;
    }
    public void multiplicationTable(Integer x) {
        Integer x2;
        for (Integer i = 1; i <= 10 ; i++) {
            x2 = x*i;
            System.debug(i+ ' x2 ' + x + ' = ' + x2);
        }
        
    }
    public static Integer sumOfSquares(Integer n) {
        Integer sum =0;
        for (Integer i = 1; i <=n; i++) {
            sum = sum + i*i;
            
        }
        System.debug('Input number = '+ n);
        System.debug('Output number = ' + n + ' is '+ sum);


        return sum;
        
    }
    
}