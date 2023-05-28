@isTest
public class OperationsHelperTest {
    @isTest
    private static void largestOutOfTwoNumbersTest() {
        OperationsHelper a = new OperationsHelper();
        Decimal largestA = a.largestOutOfTwoNumbers(5,9);//d2 d1 den büyükseyi test ediyoruz.
        assert.areEqual(9, largestA);//en büyük sayıyı yazdık
        
    }
    @isTest
    private static void smallestOutOfThreeNumbers() {
        OperationsHelper a = new OperationsHelper();
        Decimal smallestA = a.smallestOutOfThreeNumbers(10,15,9);//en küçük sayıyı test ettik
        assert.areEqual(9, smallestA);//en küçük rakamı yazdık
    }
    @IsTest
    private static void sumOfPositiveIntegerTest() {
        OperationsHelper a = new OperationsHelper();
        Decimal sum = a.sumOfPositiveInteger(2);//0,1,2 yi topladık. buraya yazdığımız sayıyı 0 dan başlayarak topluyor
        assert.areEqual(3, sum);
        
    }
}