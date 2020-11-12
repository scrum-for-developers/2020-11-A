Feature: Testing for basic validation when adding new books

  Scenario Outline: Providing invalid input data for new books

    Given an empty library

    When a librarian adds a book with "<title>", "<author>", <edition>, "<year>" and "<isbn>"

    Then the page contains error message for field "<field>"
    And the page contains error message "<field-message>" for field "<field>"
    And The library contains no books

    Examples:

      | isbn       | author          | title    | edition | year | field   | field-message                                                            |
      | 0XXXXXXXX5 | Terry Pratchett | Sourcery | 1       | 1989 | isbn    | Please provide valid ISBN. ISBN must contain 10 digits, e.g.: 1234567890 |
      | 0552131075 | Terry Pratchett | Sourcery | 1       |    1 | year    | Please insert a valid year of four numbers                               |

