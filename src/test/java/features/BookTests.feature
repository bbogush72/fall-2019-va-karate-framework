Feature: Java interop (karate and java integration)

  Scenario: get new book information
  # point to the class we want to run
    # Java.type --> used to connect to java class
    * def LibraryDataGenerator = Java.type('com.app.utils.LibraryDataGenerator')
    # run the static method in that class and capture the result
    # the return map object is represented as a json
    * def book = LibraryDataGenerator.createBook()
    * print book
    * print book.name
    * print book.author

    Scenario: get user information
    * def LibraryDataGenerator = Java.type('com.app.utils.LibraryDataGenerator')
    * def user = LibraryDataGenerator.createUser(2)
    * print user
    * def user = LibraryDataGenerator.createUser(3)
    * print user

  @fight
  Scenario: create a new book
    * def token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7ImlkIjoiMTY1IiwiZnVsbF9uYW1lIjoiVGVzdCBMaWJyYXJpYW4gMTciLCJlbWFpbCI6ImxpYnJhcmlhbjE3QGxpYnJhcnkiLCJ1c2VyX2dyb3VwX2lkIjoiMiJ9LCJpYXQiOjE1OTE1MDEzOTYsImV4cCI6MTU5NDA5MzM5Nn0.H_oNSW8neGcz7sAoJ8CUlCmp8xmRpK7ihtQgSav1_PM'
    Given url = 'http://library2.cybertekschool.com/rest/v1'
    And path 'add_book'
    And header 'x-library-token' = token