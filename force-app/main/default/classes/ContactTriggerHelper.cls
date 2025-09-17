/**
 * @description     :   ContactTriggerHelper is  used11 to handle contact trigger logic.
 *
 **/
@SuppressWarnings('PMD.ApexCRUDViolation')
public without sharing class ContactTriggerHelper {
  /**
   * @description Process contact records.
   * @param contactList List of contacts.
   **/
  public static void processContacts(List<Contact> contactList) {
    List<Task> tasksToInsert = new List<Task>();
    List<Account> accounts = [
      SELECT Id
      FROM Account
      WHERE Name = 'Burlington Textiles Corp of America'
    ];

    for (Contact c : contactList) {
      if (c.LastName == 'Test') {
        c.Email = 'test@gmail.com';
        c.AccountId = accounts[0].Id;
      }

      if (c.Email == null) {
        tasksToInsert.add(new Task(Subject = 'Follow up', WhoId = c.Id));
      }
    }

    if (!tasksToInsert.isEmpty()) {
      insert tasksToInsert; // Bulkified DML outside loop
    }
  }
}
