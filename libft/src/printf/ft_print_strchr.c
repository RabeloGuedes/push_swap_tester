/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_strchr.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/15 20:45:41 by arabelo-          #+#    #+#             */
/*   Updated: 2023/06/29 11:48:29 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

u_int8_t	ft_print_char(char c)
{
	write(1, &c, 1);
	return (1);
}

u_int64_t	ft_print_str(char *s)
{
	u_int64_t	len;

	len = 0;
	if (!s)
		return (ft_print_str("(null)"));
	while (s[len])
		ft_print_char(s[len++]);
	return (len);
}
