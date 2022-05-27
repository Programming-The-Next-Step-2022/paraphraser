library("project.margarida")

# this line always gives a warning:
# context("Core Translate Functionality")

test_that("translate accepts right input for each argument", {
  expect_error(translate(34, 3))
  expect_error(translate(TRUE, FALSE))
  expect_error(translate("hello", "PT-PT", 3, "less", 1, 0))
  expect_error(translate("hello", "PT-PT", "EN", 3, 1, 0))
  expect_error(translate("hello", "PT-PT", "EN", "more", 1, "hello"))
})

test_that("translate returns a different string from input text", {
  translate_1 <- translate("Praktische instructies voor cursisten.", "EN-GB")
  expect_false(isTRUE(all.equal(translate_1$input_text, translate_1$output_text)))
})

test_that("translate accepts only available language codes", {
  # Non-existing code for second argument
  expect_error(translate("hello", "TH"))
  
  # Code accepted only for third argument as second argument
  expect_error(translate("hello", "EN", "RU"))
  
  # Non-existing code for third argument
  expect_error(translate("hello", "PT-PT", "TH"))
  
  # Code accepted only for second argument as third argument
  expect_error(translate("hello", "EN", "PT-PT"))
  
  # Code from second/third argument as formality argument
  expect_error(translate("hello", "LV", formality = "more"))
})

test_that("translate recognises target_language correctly", {
  translate_2 <- translate("olá a todos", "EN-GB")
  expect_equal(translate_2$source_language, "PT")
  
  translate_3 <- translate("La rata se comió el queso", "EN-GB")
  expect_equal(translate_3$source_language, "ES")
})

test_that("translate returns correctly translated text", {
  translation_4 <- translate("hello world", "PT-PT")
  expect_equal(translation_4$output_text, "olá mundo")
  
  translation_5 <- translate("the brown fox jumped over the black cat", "RU", "EN")
  expect_equal(translation_5$output_text, "коричневая лиса перепрыгнула через черную кошку")
  
  translation_6 <- translate("The rat ate the cheese. It is all gone", "LV", "EN")
  expect_equal(translation_6$output_text, "Žurka apēda sieru. Tas viss ir pazudis")
})

test_that("translate formality level is properly set", {
  translation_7 <- translate("he jumped over the fence", "PT-PT", "EN", "less")
  translation_8 <- translate("he jumped over the fence", "PT-PT", "EN", "more")
  expect_false(isTRUE(all.equal(translation_7$output_text, translation_8$output_text)))
})

test_that("translate split_sentences correctly splits or not sentences", {
  translation_9 <- translate("Hello. 
                             I saw him leave through there", "FR", split_sentences = "1")
  translation_10 <- translate("Hello. 
                              I saw him leave through there", "FR", split_sentences = "0")
  expect_false(isTRUE(all.equal(translation_9$output_text, translation_10$output_text)))
})

test_that("translate preserve_formatting correctly changes formatting", {
  translation_11 <- translate("hi", "FR", preserve_formatting = 1)
  translation_12 <- translate("hi", "FR", preserve_formatting = 0)
  expect_false(isTRUE(all.equal(translation_11$output_text, translation_12$output_text)))
})
