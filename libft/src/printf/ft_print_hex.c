/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_hex.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/17 18:48:27 by arabelo-          #+#    #+#             */
/*   Updated: 2023/06/29 11:46:27 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

u_int8_t	ft_print_hex(u_int32_t hex, char c)
{
	u_int8_t	len;

	len = 0;
	if (hex > 15)
	{
		len += ft_print_hex(hex / 16, c);
		if (c == 'X')
			len += ft_print_char(HEX_TABLE_UPPER[hex % 16]);
		else
			len += ft_print_char(HEX_TABLE_LOWER[hex % 16]);
	}
	else
	{
		if (c == 'X')
			len += ft_print_char(HEX_TABLE_UPPER[hex % 16]);
		else
			len += ft_print_char(HEX_TABLE_LOWER[hex % 16]);
	}
	return (len);
}
