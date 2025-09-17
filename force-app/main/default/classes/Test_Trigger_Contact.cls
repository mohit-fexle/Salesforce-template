@isTest(seeAllData=false)
private with sharing class Test_Trigger_Contact {
  @isTest(seeAllData=false)
  private static void testProccessContacts() {
    //Arrange
    List<Account> accounts = new List<Account>();
    accounts.add(new Account(Name = 'Burlington Textiles Corp of America'));
    insert accounts;

    List<Contact> contacts = new List<Contact>();
    contacts.add(
      new Contact(
        LastName = 'Test',
        Email = 'test@gmail.com',
        AccountId = accounts[0].Id
      )
    );

    Test.startTest();
    //Act
    insert contacts;

    //Asserts
    Assert.areEqual(
      'test@gmail.com',
      contacts[0].Email,
      'Contact Email should be same'
    ); //PMD issue: ApexAssertionsShouldIncludeMessage

    Test.stopTest();
  }
}
