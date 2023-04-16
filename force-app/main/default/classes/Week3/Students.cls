public class Students {
    private String firstName;
    private String lastName;
    Integer classYear;
    Integer marks;
    String major;//major/stream: alan

    //set metoduyla değiştirme yapabiliriz
    //get metodunda değiştirme yapamıyoruz sadece görüntüleme yapıyoruz
    //set kullandıysak görmek için de get yazmalıyız
    public void setFirstName(String firstName){
        this.firstName = firstName;    }

    public String getFirstName(){
        return this.firstName;
    }
    public void setLastName(String lastName){
        this.lastName = lastName;
    }
    public String getLastName(){
        return this.lastName;

    }
    public void setMarks(Integer marks){
        if (marks > 0 && marks <= 100) {
            this.marks=marks;
            
        } else {
            this.marks = -1;//0-100 dışında bir değer girerse -1 sonucu görünecek
            System.debug('Please give proper marks. this no joke');
        }
    }
    public void setClassYear(integer classYear){
        integer todayYear = date.today().year();//dinamik yıl yaptık. bulunduğumuz yılı gösterir
        if (classYear <=todayYear && classYear > (todayYear - 100) ) {
            this.classYear = classYear;
            
        } else {
            this.classYear =0;
            System.debug('No such class year exists for us');
            
        }
    }
    public void setMajor(String major){
        if (major.length() > 2) {
            this.major = major;
            
        } else {
            this.major = 'NA';
            System.debug('There is no such major or stream in our uni');
            
        }
    }
    public string generateReport() {
        System.debug('Report Generated for '+ this.firstName + ' '+ this.lastName + ' of '+ this.classYear + ' '+ this.major);
        string grade;//harf notuna grade diyoruz
        if (this.marks >=90) {
            grade = 'A';
            
        } else if (this.marks >= 80) {
            grade = 'B';
            
        }else if (this.marks >=70) {
            grade = 'C';
            
        }else if (this.marks >=60) {
            grade = 'D';

        }else if (this.marks <60 && this.marks >=0) {
            grade = 'F';

        }else {
            grade = 'X';
        }
        return grade;
            
        
        
    }
    
}