public class ValidateAddress {
    public void validateHomeAddress(){
        String house = 'Akaylar Apt.';
        Integer hNo = 25;
        String street = 'Altan Sokak';
        String city = 'Kirklareli';
        String state = 'Luleburgaz';
        String stateIso = 'TR 39';
        String country = 'Turkiye';
        String countryIso= 'TR 39';

        Integer streetLength = street.length();
        System.debug(streetLength);
        Boolean checkName =street.contains(house);
        System.debug(checkName);
        Boolean checkIso = street.contains(stateIso);
        System.debug(stateIso.toUpperCase());
        System.debug(countryIso.toUpperCase());
        System.debug(country.toUpperCase());
        System.debug(city.toLowerCase());
        System.debug(state.toLowerCase());

        String fullAdress= house + ' '+  hno +  ' '+ street + ' ' + city + ' ' + state + ' ' + country;
        System.debug(fullAdress);







    }
}