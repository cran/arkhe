# Utility predicates ===========================================================
expect_true(is_empty(matrix(nrow = 0, ncol = 0)))
expect_true(is_empty(numeric(0)))
expect_false(is_empty(numeric(1)))

expect_true(has_length(numeric(1)))
expect_true(has_length(numeric(0), n = 0))
expect_false(has_length(numeric(0)))

x <- seq_len(5)
expect_false(has_names(x))
names(x) <- letters[x]
expect_true(has_names(x))

y <- c(1, 2, NA)
z <- c(1, 2, Inf)
expect_true(has_missing(y))
expect_true(has_infinite(z))
expect_false(has_missing(z))
expect_false(has_infinite(y))
expect_false(has_missing(1))
expect_false(has_infinite(1))

a <- c(1, 1, 3)
b <- c(1, 2, 3)
expect_true(has_duplicates(a))
expect_false(has_duplicates(b))

# Type predicates ==============================================================
expect_true(is_list(list()))
expect_false(is_list(numeric(1)))

expect_true(is_atomic(numeric(1)))
expect_false(is_atomic(list()))

expect_true(is_vector(numeric(1)))
expect_true(is_vector(list()))
expect_false(is_vector(expression()))

expect_true(is_numeric(1L))
expect_true(is_numeric(1.5))
expect_false(is_numeric("A"))

expect_true(is_integer(1L))
expect_false(is_integer(1.5))

expect_true(is_double(1.5))
expect_false(is_double(1L))

expect_true(is_character("A"))
expect_false(is_character(1))

expect_true(is_logical(TRUE))
expect_false(is_logical(1))

expect_true(is_error(try(log("X"), silent = TRUE)))
expect_false(is_error(try(log(1), silent = TRUE)))

expect_true(is_message(arkhe:::catch_conditions(message("custom_message"))[[1]]))
expect_true(is_warning(arkhe:::catch_conditions(warning("custom_warning"))[[1]]))

# Scalar type predicates =======================================================
expect_true(is_scalar_list(list(1)))
expect_false(is_scalar_list(list()))
expect_false(is_scalar_list(list(1, 2)))

expect_true(is_scalar_atomic(numeric(1)))
expect_false(is_scalar_atomic(numeric(0)))
expect_false(is_scalar_atomic(numeric(2)))

expect_true(is_scalar_vector(numeric(1)))
expect_false(is_scalar_vector(numeric(0)))
expect_false(is_scalar_vector(numeric(2)))

expect_true(is_scalar_numeric(numeric(1)))
expect_false(is_scalar_numeric(numeric(0)))
expect_false(is_scalar_numeric(numeric(2)))

expect_true(is_scalar_integer(integer(1)))
expect_false(is_scalar_integer(integer(0)))
expect_false(is_scalar_integer(integer(2)))

expect_true(is_scalar_double(double(1)))
expect_false(is_scalar_double(double(0)))
expect_false(is_scalar_double(double(2)))

expect_true(is_scalar_character(character(1)))
expect_false(is_scalar_character(character(0)))
expect_false(is_scalar_character(character(2)))

expect_true(is_scalar_logical(logical(1)))
expect_false(is_scalar_logical(logical(0)))
expect_false(is_scalar_logical(logical(2)))

# Numeric predicates ===========================================================
expect_true(is_zero(0))
expect_false(is_zero(1))

expect_inherits(is_odd(c(1, 3, 5, 7, 9)), "logical")
expect_false(is_odd(2))
expect_false(is_even(1))

expect_inherits(is_positive(c(0, 1, 2, 3, 4)), "logical")
expect_true(all(is_positive(c(0, 1, 2, 3, 4), strict = FALSE)))
expect_false(all(is_positive(c(0, 1, 2, 3, 4), strict = TRUE)))
expect_error(is_positive(LETTERS))

expect_inherits(is_negative(c(0, -1, -2, -3, -4)), "logical")
expect_true(all(is_negative(c(0, -1, -2, -3, -4), strict = FALSE)))
expect_false(all(is_negative(c(0, -1, -2, -3, -4), strict = TRUE)))
expect_error(is_negative(LETTERS))

expect_inherits(is_whole(c(0, 1, 2, 3, 4)), "logical")
expect_true(all(is_whole(c(0, 1, 2, 3, 4))))
expect_true(is_whole(0.1, tolerance = 0.1))
expect_false(is_whole(0.1))
expect_error(is_whole(LETTERS))

# Trend predicates =============================================================
expect_true(is_constant(c(1, 1, 1, 1, 1)))
expect_true(is_constant(c(1, 1.1, 1.2, 1.3, 1.4), tolerance = 0.5))
expect_true(is_constant(c(1, 1, 1, NA, 1), na.rm = TRUE))
expect_equal(is_constant(c(1, 1, 1, NA, 1), na.rm = FALSE), NA)
expect_false(is_constant(c(1, 2, 1, 1, 1)))
expect_error(is_constant(LETTERS))

expect_true(is_increasing(c(1, 2, 3, 4, 5)))
expect_true(is_increasing(c(1, 1, 1, 1, 1)))
expect_true(is_increasing(c(1, 2, 3, NA, 5), na.rm = TRUE))
expect_equal(is_increasing(c(1, 2, 3, NA, 5), na.rm = FALSE), NA)
expect_false(is_increasing(c(5, 4, 3, 2, 1)))
expect_error(is_increasing(LETTERS))

expect_true(is_decreasing(c(5, 4, 3, 2, 1)))
expect_true(is_decreasing(c(1, 1, 1, 1, 1)))
expect_true(is_decreasing(c(5, 4, 3, NA, 1), na.rm = TRUE))
expect_equal(is_decreasing(c(5, 4, 3, NA, 1), na.rm = FALSE), NA)
expect_false(is_decreasing(c(1, 2, 3, 4, 5)))
expect_error(is_decreasing(LETTERS))

x <- c(1, 6, 7, 8, 9)
y <- c(1, 2, 3, 4, 5)
expect_true(is_greater(x, y, strict = FALSE))
expect_false(is_greater(x, y, strict = TRUE))
expect_false(is_greater(y, x, strict = TRUE))
expect_true(is_lower(y, x, strict = FALSE))
expect_false(is_lower(y, x, strict = TRUE))
expect_false(is_lower(x, y, strict = TRUE))
expect_error(is_lower(x, LETTERS))
expect_error(is_lower(LETTERS, y))

# Matrix predicates ============================================================
expect_true(is_square(matrix(nrow = 3, ncol = 3)))
expect_false(is_square(matrix(nrow = 1, ncol = 3)))
expect_false(is_square(c(1, 2, 3)))

mtx1 <- matrix(sample(seq_len(25), size = 25), nrow = 5, ncol = 5)
mtx2 <- t(mtx1)
mtx2[lower.tri(mtx2)] <- mtx1[lower.tri(mtx1)]
expect_true(is_symmetric(mtx2))
expect_false(is_symmetric(mtx1))
expect_false(is_symmetric(c(1, 2, 3)))
