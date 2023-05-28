@isTest
public class RankHandlerTest {
    @isTest
   private static void rankPrizeTest() {
    RankHandler r = new RankHandler();
    String prize1= r.rankPrize(1);
    assert.areEqual('Gold', prize1);
    String prize2= r.rankPrize(2);
    assert.areEqual('Silver', prize2);
    String prize3= r.rankPrize(3);
    assert.areEqual('Bronze', prize3);
    String prize4= r.rankPrize(4);
    assert.areEqual('Top 10', prize4);
    String prize5= r.rankPrize(12);//12.sıradakini denedik
    assert.areEqual('Participation certificate', prize5);
   }

   @isTest
   private static void rankPrizeSwitchTest() {
    RankHandler r = new RankHandler();
    String prize1= r.rankPrizeSwitch(1);
    assert.areEqual('Gold', prize1);
    String prize2= r.rankPrizeSwitch(2);
    assert.areEqual('Silver', prize2);
    String prize3= r.rankPrizeSwitch(3);
    assert.areEqual('Bronze', prize3);
    String prize4= r.rankPrizeSwitch(4);
    assert.areEqual('Top 10', prize4);
    String prize5= r.rankPrizeSwitch(12);//12.sıradakini denedik
    assert.areEqual('thank you for participating', prize5);
    
   }
}