List<string> colorList = new List<string>{'Red','Green'};//içine değer koyduğumuz için süslü parantez yazıyoruz.
System.debug(colorList);
colorList.add('Green');//ya da bu şekilde ekleyebiliriz
colorList.add('Purple');
colorList.add('Yellow');
colorList.add('White');
colorList.add('Black');
System.debug(colorList);

//a. Print the size of the above-created List.
System.debug('Listedeki eleman sayisi : ' + colorList.size());//listedeki elemanların sayısı

//b. Check if the coloursList contains ‘Red’ color in it or not
Boolean red = colorList.contains('Red');
System.debug(red);

//c. Retrieve the last element of the List and print it in the upper case
Integer size1= colorList.size();
String sonEleman = colorList.get(size1 - 1);
System.debug('Son eleman ' + sonEleman.toUpperCase());//bu dinamik şekli
String lastElement = colorList.get(6);
System.debug('last element is ' + lastElement.toUpperCase());//bu dinamik olmayan şekli

//d. Make the fourth element in the List as Upper case
String fourthElement = colorList.get(3);//index 0 dan başladığı için 3 yazdık
System.debug('Fourth element is ' + fourthElement.toUpperCase());

//f. Compare if the two lists colourCodesList and coloursList are equal or not.
List<string> colorCodeList = new List<string>{'#ff0000','#ffff00','#ffffff'};
Boolean esitMi = colorCodeList.equals(colorList); 
System.debug('Esit mi ' +esitMi);//false gelir üstteki 7 bu 3 elemanlı olduğu için


//g. Merge the two Lists (colourCodesList, coloursList) and print the newly created list.
List<String>birlestirilmisListe = new List<String>();
birlestirilmisListe.addAll(colorCodeList);
birlestirilmisListe.addAll(colorList);
system.debug(birlestirilmisListe);