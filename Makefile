# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yehara <yehara@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/18 00:42:43 by yehara            #+#    #+#              #
#    Updated: 2024/07/18 15:03:07 by yehara           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_NAME = client
SERVER_NAME = server

CC = cc
CFLAGS = -Wall -Wextra -Werror

PRINTF = printf
LIBFT = $(PRINTF)/libft

CLIENT_SOURCE = client.c
SERVER_SOURCE = server.c

all: $(CLIENT_NAME) $(SERVER_NAME)

$(CLIENT_NAME): $(CLIENT_SOURCE)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

$(SERVER_NAME): $(SERVER_SOURCE)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

clean:
	make -C $(PRINTF) clean
	rm -f *.o

fclean: clean
	make -C $(PRINTF) fclean
	rm -f $(CLIENT_NAME) $(SERVER_NAME)

re: fclean all

.PHONY: all clean fclean re
