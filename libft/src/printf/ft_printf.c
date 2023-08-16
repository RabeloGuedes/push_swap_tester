/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/21 17:15:04 by arabelo-          #+#    #+#             */
/*   Updated: 2023/06/29 11:47:10 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

int	ft_printf(const char *s, ...)
{
	va_list		args;
	size_t		i;
	u_int64_t	len;

	va_start(args, s);
	i = 0;
	len = 0;
	while (s[i])
	{
		if (s[i] == '%')
			len += ft_format_checker(s[++i], args);
		else
			len += ft_print_char(s[i]);
		i++;
	}
	va_end(args);
	return (len);
}
