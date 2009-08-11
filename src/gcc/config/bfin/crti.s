/* Specialized code needed to support construction and destruction of
   file-scope objects in C++ and Java code, and to support exception handling.
   Copyright (C) 2005, 2008, 2009 Free Software Foundation, Inc.
   Contributed by Analog Devices.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * This file just supplies function prologues for the .init and .fini
 * sections.  It is linked in before crtbegin.o.
 */

	.ident  "GNU C crti.o"

	.section .init
	.globl  __init
	.type   __init,@function
__init:
#if defined __ID_SHARED_LIB__
	[--SP] = P5;
#elif defined __BFIN_FDPIC__
	[--SP] = P3; 
#endif
	LINK 12;
#if defined __ID_SHARED_LIB__
	P5 = [P5 + _current_shared_library_p5_offset_]
#endif	
	.section .fini
	.globl  __fini
	.type   __fini,@function
__fini:
#if defined __ID_SHARED_LIB__
	[--SP] = P5; 
#elif defined __BFIN_FDPIC__
	[--SP] = P3; 
#endif
	LINK 12; 
#if defined __ID_SHARED_LIB__
	P5 = [P5 + _current_shared_library_p5_offset_]
#endif	
