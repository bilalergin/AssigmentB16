Students student1 = new Students();
student1.setFirstName('Mike');
student1.setLastName('Ross');
student1.setMarks(95);
student1.setClassYear(2010);
student1.setMajor('Law');

String sonuc = student1.generateReport();
System.debug('Final grade is ' + student1.getFirstName()+ ' '+ sonuc );