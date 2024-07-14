# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yehara <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/14 23:16:36 by yehara            #+#    #+#              #
#    Updated: 2024/07/14 23:16:47 by yehara           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_NAME = client
SERVER_NAME = server
CLIENT_BONUS_NAME = client_bonus
SERVER_BONUS_NAME = server_bonus

CC = gcc
CFLAGS = -Wall -Werror -Wextra

PRINTF = ft_printf
LIBFT = $(PRINTF)/libft

SERVER_SRCS = server.c
CLIENT_SRCS = client.c
SERVER_BONUS_SRCS = server_bonus.c
CLIENT_BONUS_SRCS = client_bonus.c

all: $(CLIENT_NAME) $(SERVER_NAME)

# Server program
$(SERVER_NAME): $(SERVER_SRCS)
	@make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

# Client program
$(CLIENT_NAME): $(CLIENT_SRCS)
	@make -C $(PRINTF)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

# Server bonus program
$(CLIENT_BONUS_NAME): $(CLIENT_BONUS_SRCS)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

# Client bonus program
$(SERVER_BONUS_NAME): $(SERVER_BONUS_SRCS)
	$(CC) $(CFLAGS) -o $@ $^ -L$(PRINTF) -lftprintf

%.o: %.c
	$(CC) $(CFLAGS) -I$(PRINTF)/headers -c $< -o $@

clean:
	make -C $(PRINTF) clean
	rm -f *.o

fclean: clean
	make -C $(PRINTF) fclean
	rm -f $(CLIENT_NAME) $(SERVER_NAME) $(CLIENT_BONUS_NAME) $(SERVER_BONUS_NAME)

re: fclean all

bonus: $(CLIENT_BONUS_NAME) $(SERVER_BONUS_NAME)

.PHONY: all clean fclean re bonus
