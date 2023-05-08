public class ShoppingCart {
    String name;
    Map<String, Decimal> shopItems = new Map<String, Decimal>();
    public static Decimal discount;

    public shoppingCart(){
        this.name = '';
    }
    public ShoppingCart(String name){
        this.name = name;
        System.debug('Hello' + this.name + ', we are glad you are here, what would you like to shop today?');
    }
    public void setName(string name) {
        this.name = name;
    }
    public string getName() {
        return this.name;
        
    }
    public void addItem(string itemName) {
        shopItems.put(itemName, 0.0);
        
    }
    public void addItem(String itemName, Decimal price) {
        shopItems.put(itemName, price);
    }
    public void addItem(map<string, decimal> itemsPrice) {
        shopItems.putAll(itemsPrice);
        
    }
    public String removeItem(string itemName) {
        String message;
        if (shopItems.containsKey(itemName)) {
            shopItems.remove(itemName);
            message= itemName + ' removed successfully';            
        }else {
            message= 'No such item is added in cart, how can I remove it buddy?';
        }
        return message;
        
    }
    public Map<String, Decimal> getShopItems(){
        return shopItems;
    }
    public Decimal getTotalAmount(){
        totalAmount= 0;
        for (decimal eachAmount : shopItems.values()) {
            totalAmount += eachAmount;
        }
        return totalAmount;
        
    }
    public void printSummary() {
        System.debug('You have added ' + shopItems.size()+ ' items in your cart. Each items and its prices are below' );
        for (string singleItem : shopItems.keySet()){
            System.debug('Item name '+singleItem+ 'its prices is '+shopItems.get(singleItem));
            
        }
        System.debug('Total value of cart is ' + getTotalAmount());
        if (getTotalAmount()>=300) {
            System.debug('Final price to pay is '+ getTotalAmount()*(1-discount));
            System.debug('Congratulations, You JUST saved ' + getTotalAmount()*discount);
           
        } else {
            System.debug('Add items worth ' + getTotalAmount()+ ' to get bind blowing discount ' + (300-getTotalAmount()));            
        }
        
    }//kelimeyi seçip ctrl + d ye basrsak o kelmenin aynılarını seçer.
    public void clearCart(){
        shopItems.clear();
            
    }

}