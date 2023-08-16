/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_int.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/15 20:55:59 by arabelo-          #+#    #+#             */
/*   Updated: 2023/06/29 11:48:16 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

u_int16_t	ft_print_int(int nbr)
{
	u_int16_t	len;
	char		*n;

	n = ft_itoa(nbr);
	len = ft_print_str(n);
	free(n);
	return (len);
}
