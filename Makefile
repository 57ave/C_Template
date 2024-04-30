##
## EPITECH PROJECT, 2024
## 
## File description:
## Makefile
##

NAME = 

NAME_TEST = unit_tests

CFLAGS += -Wall -Wextra

CPPFLAGS += -iquote "include"

SRC =

SRC_MAIN = src/main.c 	\
		   $(SRC)

SRC_TEST =

OBJ = $(SRC_MAIN:.c=.o)

all: $(NAME)

$(NAME): 	$(OBJ)
			$(CC) -o $(NAME) $(OBJ)

tests_run: 	LDLIBS += --coverage -lcriterion
tests_run:
	$(CC) -o $(NAME_TEST) $(SRC) $(SRC_TEST) $(CPPFLAGS) $(LDLIBS)
	./$(NAME_TEST)
	gcovr --exclude tests/
	gcovr --exclude tests/ --branches

clean:
	$(RM) $(OBJ)
	$(RM) $(OBJ_MAIN)
	$(RM) *.gcno *.gcda

fclean: clean
	$(RM) $(NAME)

debug: CFLAGS += -ggdb3
debug: all

re: fclean
re: all

.PHONY: all clean fclean debug re
