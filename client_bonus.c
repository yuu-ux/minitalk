/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yehara <yehara@student.42tokyo.jp>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/14 23:45:17 by yehara            #+#    #+#             */
/*   Updated: 2024/07/19 21:29:31 by yehara           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./printf/ft_printf.h"
#include <signal.h>

static	void	error_handling(int errno)
{
	if (errno == 1)
		ft_printf("./client PID String");
	if (errno == 2)
		ft_printf("PID is invalid");
	if (errno == 3)
		ft_printf("Kill command error");
	exit(EXIT_FAILURE);
}

static	void	send_bit(pid_t i_pid, char c)
{
	int	sig;
	int	i;

	i = 7;
	while (i >= 0)
	{
		if (c >> i & 1)
			sig = SIGUSR1;
		else
			sig = SIGUSR2;
		if (kill(i_pid, sig) == -1)
			error_handling(3);
		usleep(1000);
		i--;
	}
}

static	int	check_pid(char *s_pid)
{
	int	i_pid;

	i_pid = ft_atoi(s_pid);
	if (i_pid <= 1)
		error_handling(2);
	return (i_pid);
}

int	main(int argc, char **argv)
{	
	size_t	i;
	size_t	len;
	pid_t	i_pid;

	if (argc != 3)
		error_handling(1);
	i_pid = check_pid(argv[1]);
	len = ft_strlen(argv[2]);
	i = 0;
	while (i <= len)
	{
		send_bit(i_pid, argv[2][i]);
		i++;
	}
	return (EXIT_SUCCESS);
}
