# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yehara <yehara@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/18 00:42:43 by yehara            #+#    #+#              #
#    Updated: 2024/07/21 16:58:45 by yehara           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_NAME = client
SERVER_NAME = server
CLIENT_NAME_BONUS = client_bonus
SERVER_NAME_BONUS = server_bonus

CC = cc
CFLAGS = -Wall -Wextra -Werror

PRINTF = printf
LIBFT = $(PRINTF)/libft

CLIENT_SOURCE = client.c
SERVER_SOURCE = server.c
CLIENT_SOURCE_BONUS = client_bonus.c
SERVER_SOURCE_BONUS = server_bonus.c

all: $(CLIENT_NAME) $(SERVER_NAME)

$(CLIENT_NAME): $(CLIENT_SOURCE)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

$(SERVER_NAME): $(SERVER_SOURCE)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

bonus: $(CLIENT_NAME_BONUS) $(SERVER_NAME_BONUS)

$(CLIENT_NAME_BONUS): $(CLIENT_SOURCE_BONUS)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf 

$(SERVER_NAME_BONUS): $(SERVER_SOURCE_BONUS)
	make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf 

clean:
	make -C $(PRINTF) clean
	rm -f *.o

fclean: clean
	make -C $(PRINTF) fclean
	rm -f $(CLIENT_NAME) $(SERVER_NAME) $(CLIENT_NAME_BONUS) $(SERVER_NAME_BONUS)
                                           
re: fclean all

.PHONY: all clean fclean re
