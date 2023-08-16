/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_address.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/15 21:20:28 by arabelo-          #+#    #+#             */
/*   Updated: 2023/06/29 11:46:23 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

u_int16_t	ft_print_address(u_int64_t address)
{
	u_int16_t	len;

	len = 0;
	if (!address)
		return (ft_print_str("(nil)"));
	if (address > 15)
	{
		len += ft_print_address(address / 16);
		len += ft_print_char(HEX_TABLE_LOWER[address % 16]);
	}
	else
	{
		len += ft_print_str("0x");
		len += ft_print_char(HEX_TABLE_LOWER[address % 16]);
	}
	return (len);
}
