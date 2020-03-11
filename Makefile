##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Makefile
##

ASM	=	nasm

CC	=	gcc

RM	=	rm -f

ASFLAGS	=	-f elf64

NAME	=	libasm.so

SRCS	=	src/strlen.asm \
			src/strchr.asm \
			src/strcmp.asm \
			src/memset.asm \
			src/memcpy.asm \
			src/memmove.asm \
			src/strncmp.asm \
			src/rindex.asm \
			src/strpbrk.asm \
			src/strstr.asm \
			src/strcspn.asm

OBJS	=	$(SRCS:.asm=.o)



all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -nostdlib -shared -fPIC $(OBJS) -o $(NAME)

lib_test:	$(T_OBJS)
		$(CC) $(T_OBJS) -o $(T_NAME)

%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS) $(T_OBJS)

fclean:		clean
		$(RM) $(NAME) $(T_NAME)
		$(RM) unit-tests

re:		fclean all

.PHONY:		all clean fclean re
