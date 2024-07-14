/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yehara <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/14 22:34:43 by yehara            #+#    #+#             */
/*   Updated: 2024/07/14 22:34:58 by yehara           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>

void    send_char(pid_t pid, char c)
{
    int             bit;
    int             i;
    unsigned char   uc;

    uc = (unsigned char)c;
    i = 0;
    while (i < 8)
    {
        usleep(50);
        bit = (uc >> i) & 0x01;
        if (kill(pid, SIGUSR1 + bit) == -1)
            fatal("kill error");
        i++;
    }
}

int main(int ac, char **av)
{
    (void)ac;
    kill((pid_t)atoi(av[1]), SIGSEGV);
    return 0;
}
