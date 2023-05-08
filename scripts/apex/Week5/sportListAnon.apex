/*
3. List, set, map
a. sportList
- create list of sports
- check if list is empty or not.
print ‘LIST IS NOT EMPTY’ if it is not empty.
print ‘LIST IS EMPTYYYY’ if it is empty
- add atleast 4 sports you like in the list
example: 'Football', 'Basketball', 'Tennis', 'Golf', 'Cricket', 'Baseball', 'Hockey',
'Soccer', 'Volleyball', 'Rugby'
- check each sport one by one and print if IT is played with ball (sport name
contains ball then it is played with ball)
- ex:
Football is played with Ball
Basketball is played with Ball.
Tennis is NOT played with ball
…
- create another two list. One which are played with ball and other which are NOT
played with ball. Print both list, and its size.
- Find and print the index number of your favorite sport from the list
- remove your least favorite sport from the list and print list and its size again
*/


List<String>listOfSport = new List<String>();
if(listOfSport.isEmpty()){
  system.debug('LIST IS EMPTY');
  
}else{ 
    system.debug('List IS nor Empty');

}
listOfSport.add('Football');
listOfSport.add('Baskeball'); 
listOfSport.add('Tennis'); 
listOfSport.add('Volleyball'); 

for(string eachlistOfSport:listOfSport){
    if (eachlistOfSport.contains('ball')){
        System.debug(eachlistOfSport + ' is played with ball ');

    }else{
         System.debug(eachlistOfSport + ' is not played with ball ');

    }
}

List<String>sportWithBall = new List<String>{'volleyball', ' handball', 'football', ' baseball'};
List<String>sportWithNotBall = new List<String>{'Tennis', 'Soccer', 'Cricket'};
system.debug(sportWithBall);
system.debug(sportWithBall.size());
system.debug(sportWithNotBall);
system.debug(sportWithNotBall.size());

if(sportWithBall.contains('volleyball') ){
    system.debug(sportWithBall.indexOf('voleyball'));

}else{
    System.debug('sport does not contains volleyball');

}
integer b = sportWithNotBall.indexOf('Cricket');
sportWithNotBall.remove(b);
system.debug('list after removing least favorite sport = ' + sportWithNotBall);
system.debug('size of list ' + sportWithNotBall.size());


/*
b. operatingSystemSet
- create set of operating system, by default add ‘Windows, macOS’ in the set.
- add following operating system in the above set.
'Windows', 'macOS', 'Linux', 'Android', 'iOS', 'Chrome OS', 'FreeBSD', 'Ubuntu',
'Debian', 'Fedora'
- print size of set
- print following string by concating all operating systems. Also print size of the
final string
FINAL STRING ⇒ Operating systems added in set are 'Windows' &
'macOS' & 'Linux' & 'Android' & 'iOS' & 'Chrome OS' & 'FreeBSD' &
'Ubuntu' & 'Debian' & 'Fedora'
Size of FINAL STRING is [whateverTheSizeIs]
*/

Set<String> operatingSystemSet = new Set<String>{'Windows','macOS'};
operatingSystemSet.add('Windows');
operatingSystemSet.add('macOS');
operatingSystemSet.add('Linux');
operatingSystemSet.add('Android');
operatingSystemSet.add('iOS');
operatingSystemSet.add('Chrome OS');
operatingSystemSet.add('FreeBSD');
operatingSystemSet.add('Ubuntu');
operatingSystemSet.add('Debian');
operatingSystemSet.add('Fedora');

System.debug(operatingSystemSet.size());//set olduğu için aynı isimde olanları 1 kere yazdırdı.

String final1= '';//sadece final adını sistem kabul etmiyor
for(String eachOpp : operatingSystemSet){
    final1 += '\' '+ eachOpp + '\' &';//  '\ ters slaşın anlamı kesme işaretidir. String ifadelerde bunu kullanıyoruz. Kaçış operatörü anlamına da gelir. Stringde görmezden gel demek.
}
System.debug(final1);

final1 = final1.removeEnd(' &');
System.debug(final1);

