# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yehara <yehara@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/18 00:42:43 by yehara            #+#    #+#              #
#    Updated: 2024/07/20 20:20:06 by ebarayuug        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_NAME = client
SERVER_NAME = server

CC = gcc
CFLAGS = -Wall -Wextra -Werror

PRINTF = printf
LIBFT = $(PRINTF)/libft

CLIENT_SOURCE = client.c
SERVER_SOURCE = server.c
CLIENT_SOURCE_BOUNS = client_bonus.c
SERVER_SOURCE_BONUS = server_bonus.c

all: $(CLIENT_NAME) $(SERVER_NAME)

$(CLIENT_NAME): $(CLIENT_SOURCE)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

$(SERVER_NAME): $(SERVER_SOURCE)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

bonus: $(CLIENT_NAME) $(SERVER_NAME)

$(CLIENT_NAME): $(CLIENT_SOURCE_BOUNS)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf 

$(SERVER_NAME): $(SERVER_SOURCE_BOUNS)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf 

$(SERVER_NAME): $(SERVER_SOURCE_BONUS)
clean:
	make -C $(PRINTF) clean
	rm -f *.o

fclean: clean
	make -C $(PRINTF) fclean
	rm -f $(CLIENT_NAME) $(SERVER_NAME)

re: fclean all

.PHONY: all clean fclean re
