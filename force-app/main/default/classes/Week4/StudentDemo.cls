public class StudentDemo {
    //Class should have below variable three variables
    String admissionNo;
    String studentName;
    Map<String, Decimal> subjectAndMarks;

    //Create a parameterized constructor to assign values to the data members
    public StudentDemo(String admissionNo, String studentName, Map<String, Decimal> subjectAndMarks){
        this.admissionNo = admissionNo;//parametre istediği için this le yukarıdakileri çağırdık ve değer atadık. dinamik oldu
        this.studentName = studentName;
        this.subjectAndMarks = subjectAndMarks;

    }
    /*
    Create the following methods.
 ○ ‘getAdmissionNo’ to return the admission number
 ○ ‘getStudentName’ to return the student name
 ○ ‘getSubjects’ to return the set of subjects
 ○ ‘getMarks’ to return the list of marks’
 ○ ‘getMarks(string sub)’ to return marks of subject we pass in parameter
    */
    public String getAdmissionNo(){
        return admissionNo;
    }
    public String getStudentName(){
        return studentName;
    }
    public set<String> getSubjects(){
        return subjectAndMarks.keySet();//map ten key i keySet metoduyla aldık
    }
    public List<decimal> getMarks(){
        return subjectAndMarks.values();//mapten value ları values metoduyla aldık
    }

    /*
    ‘getMarks(string sub)’ to return marks of subject we pass in parameter
    ■ If no such subject exists then return -1, and print
    ‘[studentName] did not study [sub]  
    */

    public decimal getMarks(string sub) {
        Decimal mark = -1;
        if (subjectAndMarks.containsKey(sub)) {
            mark =subjectAndMarks.get(sub);            
        }else {
            System.debug(this.getStudentName() + ' did not study ' + sub);
        }


        return mark;
       
    }

    /*
    ‘getTotalMarks’ to return the student’s total marks
    ○ ‘getAverageMarks’ to return the student’s average marks.
    ○ ‘getSubjectAndMarksAboveAverage’ to return the map of subject and marks in
    which student is above his/her average
    */
    public Decimal getTotalMarks(){
        Decimal sum =0;
        for (decimal eachMarks : subjectAndMarks.values()) {
            sum += eachMarks;//eachmarkı sumın üzerine ekleyecek
            
        }
        return sum;
    }
    public Decimal getAverageMarks(){
        return this.getTotalMarks()/subjectAndMarks.size();

    }
    public map <String,Decimal> getSubjectAndMarksAboveAverage(){
     Map<String, decimal> newMap = new Map<String, decimal>();
     for (string sub : subjectAndMarks.keySet()) {
        if (subjectAndMarks.get(sub)>this.getAverageMarks()) {
            newMap.put(sub, subjectAndMarks.get(sub));
            
        }
        
     }
     return newMap;
    }
}