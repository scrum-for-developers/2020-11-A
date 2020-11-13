Feature: Testing for basic validation when adding new books

  Scenario Outline: Providing invalid input data for new books

    Given an empty library

    When a librarian adds a book with "<title>", "<author>", <edition>, "<year>" and "<isbn>"

    Then the page contains error message for field "<field>"
    And the page contains error message "<field-message>" for field "<field>"
    And The library contains no books

    Examples:

      | isbn       | author          | title    | edition | year | field   | field-message                                                 |
      | 0XXXXXXXX5 | Terry Pratchett | Sourcery | 1       | 1989 | isbn    | Please provide a valid ISBN10 or ISBN13                       |
      | 0552131075 | Terry Pratchett | Sourcery | 1       |    1 | year    | Please enter a valid year of four numbers                     |
      | 0552131075 | Terry Pratchett | Sourcery | 1       | 1800 | year    | Year must be at least 1900 and at most 2020                   |
      | 0552131075 | Terry Pratchett | Sourcery | 1       | 2300 | year    | Year must be at least 1900 and at most 2020                   |
      | 0552131075 | Terry Pratchett | Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, | 1       | 2000 | title    | Please shorten the title to 255 characters or less.|


