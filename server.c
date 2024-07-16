/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yehara <yehara@student.42tokyo.jp>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/15 00:05:45 by yehara            #+#    #+#             */
/*   Updated: 2024/07/16 23:09:50 by yehara           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include "./printf/ft_printf.h"

void signal_handler(int signum, siginfo_t *info, void *context)
{
	static int		i = 7;
	static unsigned char 	c;

	(void)context;
	(void)info;
	if (signum == SIGUSR1)
		c |= (1 << i);
	i--;
	if (i < 0) {
		write(1, &c, 1);
		c = 0;
		i = 7;
	}

}

int main(void)
{
	struct sigaction	sa;

	sa.sa_sigaction = signal_handler;
	sa.sa_flags = SA_SIGINFO;
	sigemptyset(&sa.sa_mask);
	ft_printf("PID: %d\n", getpid());
	if (sigaction(SIGUSR1, &sa, NULL) == -1 || sigaction(SIGUSR2, &sa, NULL) == -1) {
		ft_printf("Failed to set signal handler");
		exit(EXIT_FAILURE);
	}
	while (1)
		pause();
	return (0);
}

// サーバー側で実行中のPIDを表示する
// sa_sigactionにsignal_handler関数を渡す
// sa_flagsにSA_SIGINFOを渡す
// sa.sa_maskを初期化する
// getid関数をprintする
// シグナルを受け取ったらsigactionを実行する。同時に失敗したときにプログラムを終了させる
// ずっと応答待ちの状態にしておけるようにwhileで無限ループさせてpause関数を実行しておく。
