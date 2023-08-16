/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/21 17:15:49 by arabelo-          #+#    #+#             */
/*   Updated: 2023/06/28 20:50:53 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H
# define HEX_TABLE_UPPER "0123456789ABCDEF"
# define HEX_TABLE_LOWER "0123456789abcdef"

# include <stdarg.h>
# include "libft.h"

int			ft_printf(const char *s, ...);
u_int64_t	ft_format_checker(int c, va_list args);
u_int8_t	ft_print_char(char c);
u_int64_t	ft_print_str(char *s);
u_int16_t	ft_print_int(int nbr);
u_int16_t	ft_print_uint(u_int32_t nbr);
u_int16_t	uint_len(u_int32_t nbr);
char		*ft_uitoa(u_int32_t nbr);
u_int16_t	ft_print_address(u_int64_t address);
u_int8_t	ft_print_hex(u_int32_t hex, char c);

#endif