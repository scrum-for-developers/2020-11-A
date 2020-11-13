package de.codecentric.psd.worblehat.web.validation;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;

import javax.validation.ConstraintValidatorContext;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

class ISBNConstraintValidatorTest {

  private ISBNConstraintValidator isbnConstraintValidator;

  private ConstraintValidatorContext constraintValidatorContext;

  @BeforeEach
  void setUp() {
    isbnConstraintValidator = new ISBNConstraintValidator();
    constraintValidatorContext = mock(ConstraintValidatorContext.class);
  }

  @Test
  void initializeShouldTakeIsbn() {
    ISBN isbn = mock(ISBN.class);
    isbnConstraintValidator.initialize(isbn);
  }

  @ParameterizedTest
  @ValueSource(strings = {"9783499229169", "0132350882", ""})
  void shouldBeValidISBN(String isbn) {
    assertTrue(isbnConstraintValidator.isValid(isbn, constraintValidatorContext));
  }

  @ParameterizedTest
  @ValueSource(strings = {"9783499229168", "0123459789"})
  void shouldBeInvalidISBN(String isbn) {
    assertFalse(isbnConstraintValidator.isValid(isbn, constraintValidatorContext));
  }
}
