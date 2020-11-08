Feature: Trendyol Book Api Test

  Background:
    * url baseUrl
    * header content-type = 'application/json'
  # * header Authorization = Token
    * header accept = 'application/json'


  Scenario: API Starts With Empty Store Test
    Given path '/api/books'
    When method GET
    Then status 200
    Then match response = "[]"


  Scenario: Required Fields[Title,Author] Test
    Given path '/api/books'
    When method PUT
    Then status 400
    Then match response = "{ Field Title and Author are required}"

  Scenario: Required Field[Title] Test
    Given path '/api/books'
    And form field author = "Test Author"
    When method PUT
    Then status 400
    Then match response = "{ "error": "Field 'title' is required" } "


  Scenario: Required Field[Author] Test
    Given path '/api/books'
    And form field title = "Test title"
    When method PUT
    Then status 400
    Then match response = "{ "error": "Field 'author' is required" } "


  Scenario: Title and Author Cannot be Empty Test
    Given path '/api/books'
    And form field title = ""
    And form field author = ""
    When method PUT
    Then status 400
    Then match response = "{ Field 'Title' and 'Author' cannot be empty}"


  Scenario: Title Cannot be Empty Test
    Given path '/api/books'
    And form field title = ""
    And form field author = "Test Author"
    When method PUT
    Then status 400
    Then match response = "{ Field 'Title' cannot be empty}"

  Scenario: Author Cannot be Empty Test
    Given path '/api/books'
    And form field title = "Test Title"
    And form field author = ""
    When method PUT
    Then status 400
    Then match response = "{ Field 'Author' cannot be empty}"

  Scenario: ID is Read Only Field Test
    Given path '/api/books'
    And form field id = 1
    And form field title = "Test Title"
    And form field author = "Test Author"
    When method PUT
    Then status 400
    Then match response = "{ ID is Read Only parameter. You cant send to service.}"

  Scenario: Create New Book Test
    Given path '/api/books'
    And form field title = "My Test Title"
    And form field author = "My Test Author"
    When method PUT
    Then status 200
    Then match response[0].author == "My Test Author"
    Then match response[0].title == "My Test Title"

    Given path '/api/books/response[0].id'
    When method GET
    Then status 200
    Then match response[0].author == "My Test Author"
    Then match response[0].title == "My Test Title"


  Scenario: Cant Create Duplicate Book Test
    Given path '/api/books'
    And form field title = "My Test Title"
    And form field author = "My Test Author"
    When method PUT
    Then status 400
    Then match response = " { Another book with similiar title and author already exist."}


  Scenario Outline: Create New Book - <title> Character Test
    Given path 'api/books'
    And form field title = "<title>"
    And form field author = "<author>"
    When method PUT
    Then status 200
    Then match response[0].title == "<title>"
    Then match response[0].author == "<author>"

  Examples:
    |title  |title    |author|
    |Turkish|İ Ş Ğ Ç  | İ Ş Ğ Ç |
    |Arabic |غ ظ ث ف  | غ ظ ث ف  |
    |Special|% ^ ? ' !|% ^ ? ' ! |
    |German |Ä ä ß    |Ä ä ß     |






