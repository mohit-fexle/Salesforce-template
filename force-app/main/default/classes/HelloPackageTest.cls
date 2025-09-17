@IsTest
public with sharing class HelloPackageTest {
  @IsTest
  public static void sayHello() {
    System.Assert.areEqual(
      'Hello from package',
      HelloPackage.say(),
      'Expected Hello Package to return Hello from package 1243 testing'
    );
  }
}
