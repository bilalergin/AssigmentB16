public class PlayingWithDates {
    /*1. Create a class name as ‘PlayingWithDates’ and inside this class create a method name as
‘printDateOutput’. Inside the printDateOutput method do the following:
a. Print today's date.
b. Create an instance of a date for 5th November 2789.
c. Create an instance of a date for 4th March 1459.
d. Create three Integer variables (dayInt, monthInt, yearInt) for storing day, month, year
respectively, and provide some default values. Using the three Integer variables (dayInt,
monthInt, yearInt) create a new date instance and save it in a new variable */
    public void printDateOutput() {
        Date a = date.today();
        System.debug(a);
        Date b = Date.newInstance(2789, 11, 05);
        System.debug(b);
        Date c = Date.newInstance(1459, 03, 03);
        system.debug(c);

        integer dayInt = 09;
        Integer monthInt = 05;
        Integer yearInt = 2023;
        date newDate = Date.newInstance(yearInt, monthInt, dayInt);
        System.debug(newDate);
        
    }
    /* 2.Create a method ‘getMonthName’ in class PlayingWithDates
getMonthName takes one parameter DATE. Returns String.
We have to return ‘Month name’ from this method by getting month from full date.
Ex:
i) input: 2020-05-15
method should return May
ii) input: 2025-09-25
method should return September*/
    public string getMonthName(Date myDate){
        integer month = myDate.month(); //bu method bize tarihin içinden ayı çekip alır
        String gMonth ;
        switch on month {
            when 1{
                gMonth = 'January';
            }
            when 2{
                gMonth = 'February';
            }
            when 3{
                gMonth = 'March';
            }
            when 4{
                gMonth = 'April';
            }
            when 5{
                gMonth = 'May';
            }
            when 6{
                gMonth = 'June';
            }
            when 7{
                gMonth = 'July';
            }
            when 8{
                gMonth = 'August';
            }
            when 9{
                gMonth = 'September';
            }
            when 10{
                gMonth = 'October';
            }
            when 11{
                gMonth = 'Nowember';
            }           
            when else{
                gMonth = 'December';
            }
            
        }
        System.debug(gMonth);
        return gmonth;

    }

}