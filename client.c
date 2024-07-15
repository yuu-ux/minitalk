/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yehara <yehara@student.42tokyo.jp>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/14 23:45:17 by yehara            #+#    #+#             */
/*   Updated: 2024/07/15 22:12:06 by yehara           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./printf/ft_printf.h"
#include <stdlib.h>

static void error_handling()

}

static void send_bit()

}

static int check_pid(char *s)

}

int main(int argc, char **argv)
{	
	size_t i;
	int len;
        pid_t i_pid;
	if (argc != 3) {
		ft_printf("./client PID String");
		exit(EXIT_FAILURE);
	}
	
	if (argv[1] <= 1) {


	}
	len = ft_strlen(argv[2]);
	
}
// クライアント側でPIDと文字列を受け取ってサーバ側に渡す。
// サーバ側に受け取った文字を表示する
// 引数の数をチェックする->error_handling
// PIDが正しいか確認する1以下（PIDの範囲は要確認）であればerror_handling
// 文字列の長さを求める
// 文字列をビット単位に変換しながらサーバー側に送信する
// bitをずらしながら下一桁目を取り出す。&1をすることで下一桁以外すべて0になる
