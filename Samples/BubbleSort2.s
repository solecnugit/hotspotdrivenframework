
./BubbleSort2:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000000a38 <_init>:
 a38:	d503201f 	nop
 a3c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 a40:	910003fd 	mov	x29, sp
 a44:	940000dc 	bl	db4 <call_weak_fn>
 a48:	a8c17bfd 	ldp	x29, x30, [sp], #16
 a4c:	d65f03c0 	ret

Disassembly of section .plt:

0000000000000a50 <.plt>:
 a50:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 a54:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 a58:	f9479e11 	ldr	x17, [x16, #3896]
 a5c:	913ce210 	add	x16, x16, #0xf38
 a60:	d61f0220 	br	x17
 a64:	d503201f 	nop
 a68:	d503201f 	nop
 a6c:	d503201f 	nop

0000000000000a70 <_ZNSo3putEc@plt>:
 a70:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 a74:	f947a211 	ldr	x17, [x16, #3904]
 a78:	913d0210 	add	x16, x16, #0xf40
 a7c:	d61f0220 	br	x17

0000000000000a80 <__stack_chk_fail@plt>:
 a80:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 a84:	f947a611 	ldr	x17, [x16, #3912]
 a88:	913d2210 	add	x16, x16, #0xf48
 a8c:	d61f0220 	br	x17

0000000000000a90 <rand@plt>:
 a90:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 a94:	f947aa11 	ldr	x17, [x16, #3920]
 a98:	913d4210 	add	x16, x16, #0xf50
 a9c:	d61f0220 	br	x17

0000000000000aa0 <__cxa_finalize@plt>:
 aa0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 aa4:	f947ae11 	ldr	x17, [x16, #3928]
 aa8:	913d6210 	add	x16, x16, #0xf58
 aac:	d61f0220 	br	x17

0000000000000ab0 <_ZNSo5flushEv@plt>:
 ab0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 ab4:	f947b211 	ldr	x17, [x16, #3936]
 ab8:	913d8210 	add	x16, x16, #0xf60
 abc:	d61f0220 	br	x17

0000000000000ac0 <__libc_start_main@plt>:
 ac0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 ac4:	f947b611 	ldr	x17, [x16, #3944]
 ac8:	913da210 	add	x16, x16, #0xf68
 acc:	d61f0220 	br	x17

0000000000000ad0 <_ZNSo9_M_insertIlEERSoT_@plt>:
 ad0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 ad4:	f947ba11 	ldr	x17, [x16, #3952]
 ad8:	913dc210 	add	x16, x16, #0xf70
 adc:	d61f0220 	br	x17

0000000000000ae0 <__cxa_atexit@plt>:
 ae0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 ae4:	f947be11 	ldr	x17, [x16, #3960]
 ae8:	913de210 	add	x16, x16, #0xf78
 aec:	d61f0220 	br	x17

0000000000000af0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>:
 af0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 af4:	f947c211 	ldr	x17, [x16, #3968]
 af8:	913e0210 	add	x16, x16, #0xf80
 afc:	d61f0220 	br	x17

0000000000000b00 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>:
 b00:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 b04:	f947c611 	ldr	x17, [x16, #3976]
 b08:	913e2210 	add	x16, x16, #0xf88
 b0c:	d61f0220 	br	x17

0000000000000b10 <_ZSt16__throw_bad_castv@plt>:
 b10:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 b14:	f947ca11 	ldr	x17, [x16, #3984]
 b18:	913e4210 	add	x16, x16, #0xf90
 b1c:	d61f0220 	br	x17

0000000000000b20 <_ZNSt8ios_base4InitC1Ev@plt>:
 b20:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 b24:	f947ce11 	ldr	x17, [x16, #3992]
 b28:	913e6210 	add	x16, x16, #0xf98
 b2c:	d61f0220 	br	x17

0000000000000b30 <abort@plt>:
 b30:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 b34:	f947d211 	ldr	x17, [x16, #4000]
 b38:	913e8210 	add	x16, x16, #0xfa0
 b3c:	d61f0220 	br	x17

0000000000000b40 <_ZNSolsEi@plt>:
 b40:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 b44:	f947d611 	ldr	x17, [x16, #4008]
 b48:	913ea210 	add	x16, x16, #0xfa8
 b4c:	d61f0220 	br	x17

0000000000000b50 <__gmon_start__@plt>:
 b50:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfda8>
 b54:	f947da11 	ldr	x17, [x16, #4016]
 b58:	913ec210 	add	x16, x16, #0xfb0
 b5c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000b80 <main>:
    }
    return sums;
}

int main()
{
     b80:	d14043ff 	sub	sp, sp, #0x10, lsl #12
     b84:	f90203ff 	str	xzr, [sp, #1024]
     b88:	d283620c 	mov	x12, #0x1b10                	// #6928
     b8c:	cb2c63ff 	sub	sp, sp, x12
     b90:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfda8>
     b94:	914043e2 	add	x2, sp, #0x10, lsl #12
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
     b98:	b0000001 	adrp	x1, 1000 <_fini>
     b9c:	91008021 	add	x1, x1, #0x20
     ba0:	a9007bfd 	stp	x29, x30, [sp]
     ba4:	910003fd 	mov	x29, sp
     ba8:	f947e000 	ldr	x0, [x0, #4032]
     bac:	a90153f3 	stp	x19, x20, [sp, #16]
     bb0:	914047f4 	add	x20, sp, #0x11, lsl #12
     bb4:	a9025bf5 	stp	x21, x22, [sp, #32]
     bb8:	910103f6 	add	x22, sp, #0x40
     bbc:	aa1603f5 	mov	x21, x22
     bc0:	a90363f7 	stp	x23, x24, [sp, #48]
     bc4:	b0000097 	adrp	x23, 11000 <__FRAME_END__+0xfda8>
	return __pf(*this);
     bc8:	aa1603f3 	mov	x19, x22
     bcc:	f9400003 	ldr	x3, [x0]
     bd0:	f90d8443 	str	x3, [x2, #6920]
     bd4:	d2800003 	mov	x3, #0x0                   	// #0
	__ostream_insert(__out, __s,
     bd8:	d2800262 	mov	x2, #0x13                  	// #19
     bdc:	f947eef8 	ldr	x24, [x23, #4056]
     be0:	912c0294 	add	x20, x20, #0xb00
     be4:	aa1803e0 	mov	x0, x24
     be8:	97ffffc2 	bl	af0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
	int arr[LENGTH];
    cout<<"Input array length:"<<LENGTH<<endl;
     bec:	5288d601 	mov	w1, #0x46b0                	// #18096
     bf0:	aa1803e0 	mov	x0, x24
     bf4:	97ffffd3 	bl	b40 <_ZNSolsEi@plt>
	return __pf(*this);
     bf8:	940000aa 	bl	ea0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0>
	for (int i = 0; i < LENGTH; i++)
     bfc:	d503201f 	nop
		myarray[i]=rand();
     c00:	97ffffa4 	bl	a90 <rand@plt>
     c04:	b8004660 	str	w0, [x19], #4
	for (int i = 0; i < LENGTH; i++)
     c08:	eb14027f 	cmp	x19, x20
     c0c:	54ffffa1 	b.ne	c00 <main+0x80>  // b.any
	__ostream_insert(__out, __s,
     c10:	f947eef3 	ldr	x19, [x23, #4056]
     c14:	b0000001 	adrp	x1, 1000 <_fini>
     c18:	9100e021 	add	x1, x1, #0x38
     c1c:	d28001a2 	mov	x2, #0xd                   	// #13
     c20:	aa1303e0 	mov	x0, x19
     c24:	97ffffb3 	bl	af0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
	return __pf(*this);
     c28:	aa1303e0 	mov	x0, x19
     c2c:	9400009d 	bl	ea0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0>
		for (int j = i + 1; j < n-1; j++)
     c30:	914046c3 	add	x3, x22, #0x11, lsl #12
     c34:	910012c4 	add	x4, x22, #0x4
     c38:	912af063 	add	x3, x3, #0xabc
     c3c:	d2800025 	mov	x5, #0x1                   	// #1
     c40:	d288d5e6 	mov	x6, #0x46af                	// #18095
     c44:	d503201f 	nop
			if (array[i]>array[j])
     c48:	b85fc082 	ldur	w2, [x4, #-4]
     c4c:	aa0403e0 	mov	x0, x4
     c50:	b9400001 	ldr	w1, [x0]
     c54:	6b02003f 	cmp	w1, w2
     c58:	5400008a 	b.ge	c68 <main+0xe8>  // b.tcont
	array[i] = array[j];
     c5c:	b9000002 	str	w2, [x0]
}
     c60:	2a0103e2 	mov	w2, w1
	array[j] = temp;
     c64:	b81fc081 	stur	w1, [x4, #-4]
		for (int j = i + 1; j < n-1; j++)
     c68:	91001000 	add	x0, x0, #0x4
     c6c:	eb03001f 	cmp	x0, x3
     c70:	54ffff01 	b.ne	c50 <main+0xd0>  // b.any
     c74:	910004a5 	add	x5, x5, #0x1
     c78:	91001084 	add	x4, x4, #0x4
     c7c:	eb0600bf 	cmp	x5, x6
     c80:	54fffe41 	b.ne	c48 <main+0xc8>  // b.any
     c84:	4f000400 	movi	v0.4s, #0x0
        sums+=arr[i];
     c88:	3cc106a1 	ldr	q1, [x21], #16
     c8c:	0ea11000 	saddw	v0.2d, v0.2d, v1.2s
     c90:	4ea11000 	saddw2	v0.2d, v0.2d, v1.4s
    for (int i = 0; i < LENGTH; i++)
     c94:	eb1402bf 	cmp	x21, x20
     c98:	54ffff81 	b.ne	c88 <main+0x108>  // b.any
     c9c:	5ef1b800 	addp	d0, v0.2d
	__ostream_insert(__out, __s,
     ca0:	d2800402 	mov	x2, #0x20                  	// #32
     ca4:	f947eef7 	ldr	x23, [x23, #4056]
     ca8:	b0000001 	adrp	x1, 1000 <_fini>
     cac:	91012021 	add	x1, x1, #0x48
     cb0:	9e660013 	fmov	x19, d0
     cb4:	aa1703e0 	mov	x0, x23
     cb8:	97ffff8e 	bl	af0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
      { return _M_insert(__n); }
     cbc:	aa1703e0 	mov	x0, x23
     cc0:	aa1303e1 	mov	x1, x19
     cc4:	97ffff83 	bl	ad0 <_ZNSo9_M_insertIlEERSoT_@plt>
	return __pf(*this);
     cc8:	94000076 	bl	ea0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0>
    cout<<"Sorting......"<<endl;
	BubbleSort1(arr, LENGTH);
    long int sums=SumArray(arr);
    cout<<"The result of summing the array:"<<sums<<endl;
    return 0;
     ccc:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfda8>
     cd0:	914043e2 	add	x2, sp, #0x10, lsl #12
     cd4:	f947e000 	ldr	x0, [x0, #4032]
     cd8:	f94d8443 	ldr	x3, [x2, #6920]
     cdc:	f9400001 	ldr	x1, [x0]
     ce0:	eb010063 	subs	x3, x3, x1
     ce4:	d2800001 	mov	x1, #0x0                   	// #0
     ce8:	54000121 	b.ne	d0c <main+0x18c>  // b.any
     cec:	a9407bfd 	ldp	x29, x30, [sp]
     cf0:	52800000 	mov	w0, #0x0                   	// #0
     cf4:	a94153f3 	ldp	x19, x20, [sp, #16]
     cf8:	a9425bf5 	ldp	x21, x22, [sp, #32]
     cfc:	a94363f7 	ldp	x23, x24, [sp, #48]
     d00:	912c43ff 	add	sp, sp, #0xb10
     d04:	914047ff 	add	sp, sp, #0x11, lsl #12
     d08:	d65f03c0 	ret
     d0c:	97ffff5d 	bl	a80 <__stack_chk_fail@plt>

0000000000000d10 <_GLOBAL__sub_I__Z4swapPiii>:
     d10:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     d14:	910003fd 	mov	x29, sp
     d18:	f9000bf3 	str	x19, [sp, #16]
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  ///@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
     d1c:	d0000093 	adrp	x19, 12000 <__data_start>
     d20:	91006273 	add	x19, x19, #0x18
     d24:	aa1303e0 	mov	x0, x19
     d28:	97ffff7e 	bl	b20 <_ZNSt8ios_base4InitC1Ev@plt>
     d2c:	aa1303e1 	mov	x1, x19
     d30:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfda8>
     d34:	f9400bf3 	ldr	x19, [sp, #16]
     d38:	d0000082 	adrp	x2, 12000 <__data_start>
     d3c:	a8c27bfd 	ldp	x29, x30, [sp], #32
     d40:	91002042 	add	x2, x2, #0x8
     d44:	f947fc00 	ldr	x0, [x0, #4088]
     d48:	17ffff66 	b	ae0 <__cxa_atexit@plt>
     d4c:	d503201f 	nop
     d50:	d503201f 	nop
     d54:	d503201f 	nop
     d58:	d503201f 	nop
     d5c:	d503201f 	nop
     d60:	d503201f 	nop
     d64:	d503201f 	nop
     d68:	d503201f 	nop
     d6c:	d503201f 	nop
     d70:	d503201f 	nop
     d74:	d503201f 	nop
     d78:	d503201f 	nop
     d7c:	d503201f 	nop

0000000000000d80 <_start>:
     d80:	d503201f 	nop
     d84:	d280001d 	mov	x29, #0x0                   	// #0
     d88:	d280001e 	mov	x30, #0x0                   	// #0
     d8c:	aa0003e5 	mov	x5, x0
     d90:	f94003e1 	ldr	x1, [sp]
     d94:	910023e2 	add	x2, sp, #0x8
     d98:	910003e6 	mov	x6, sp
     d9c:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfda8>
     da0:	f947e400 	ldr	x0, [x0, #4040]
     da4:	d2800003 	mov	x3, #0x0                   	// #0
     da8:	d2800004 	mov	x4, #0x0                   	// #0
     dac:	97ffff45 	bl	ac0 <__libc_start_main@plt>
     db0:	97ffff60 	bl	b30 <abort@plt>

0000000000000db4 <call_weak_fn>:
     db4:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfda8>
     db8:	f947f400 	ldr	x0, [x0, #4072]
     dbc:	b4000040 	cbz	x0, dc4 <call_weak_fn+0x10>
     dc0:	17ffff64 	b	b50 <__gmon_start__@plt>
     dc4:	d65f03c0 	ret
     dc8:	d503201f 	nop
     dcc:	d503201f 	nop

0000000000000dd0 <deregister_tm_clones>:
     dd0:	d0000080 	adrp	x0, 12000 <__data_start>
     dd4:	91004000 	add	x0, x0, #0x10
     dd8:	d0000081 	adrp	x1, 12000 <__data_start>
     ddc:	91004021 	add	x1, x1, #0x10
     de0:	eb00003f 	cmp	x1, x0
     de4:	540000c0 	b.eq	dfc <deregister_tm_clones+0x2c>  // b.none
     de8:	b0000081 	adrp	x1, 11000 <__FRAME_END__+0xfda8>
     dec:	f947f021 	ldr	x1, [x1, #4064]
     df0:	b4000061 	cbz	x1, dfc <deregister_tm_clones+0x2c>
     df4:	aa0103f0 	mov	x16, x1
     df8:	d61f0200 	br	x16
     dfc:	d65f03c0 	ret

0000000000000e00 <register_tm_clones>:
     e00:	d0000080 	adrp	x0, 12000 <__data_start>
     e04:	91004000 	add	x0, x0, #0x10
     e08:	d0000081 	adrp	x1, 12000 <__data_start>
     e0c:	91004021 	add	x1, x1, #0x10
     e10:	cb000021 	sub	x1, x1, x0
     e14:	d37ffc22 	lsr	x2, x1, #63
     e18:	8b810c41 	add	x1, x2, x1, asr #3
     e1c:	9341fc21 	asr	x1, x1, #1
     e20:	b40000c1 	cbz	x1, e38 <register_tm_clones+0x38>
     e24:	b0000082 	adrp	x2, 11000 <__FRAME_END__+0xfda8>
     e28:	f947f842 	ldr	x2, [x2, #4080]
     e2c:	b4000062 	cbz	x2, e38 <register_tm_clones+0x38>
     e30:	aa0203f0 	mov	x16, x2
     e34:	d61f0200 	br	x16
     e38:	d65f03c0 	ret
     e3c:	d503201f 	nop

0000000000000e40 <__do_global_dtors_aux>:
     e40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     e44:	910003fd 	mov	x29, sp
     e48:	f9000bf3 	str	x19, [sp, #16]
     e4c:	d0000093 	adrp	x19, 12000 <__data_start>
     e50:	39404260 	ldrb	w0, [x19, #16]
     e54:	35000140 	cbnz	w0, e7c <__do_global_dtors_aux+0x3c>
     e58:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfda8>
     e5c:	f947e800 	ldr	x0, [x0, #4048]
     e60:	b4000080 	cbz	x0, e70 <__do_global_dtors_aux+0x30>
     e64:	d0000080 	adrp	x0, 12000 <__data_start>
     e68:	f9400400 	ldr	x0, [x0, #8]
     e6c:	97ffff0d 	bl	aa0 <__cxa_finalize@plt>
     e70:	97ffffd8 	bl	dd0 <deregister_tm_clones>
     e74:	52800020 	mov	w0, #0x1                   	// #1
     e78:	39004260 	strb	w0, [x19, #16]
     e7c:	f9400bf3 	ldr	x19, [sp, #16]
     e80:	a8c27bfd 	ldp	x29, x30, [sp], #32
     e84:	d65f03c0 	ret
     e88:	d503201f 	nop
     e8c:	d503201f 	nop

0000000000000e90 <frame_dummy>:
     e90:	17ffffdc 	b	e00 <register_tm_clones>
     e94:	d503201f 	nop
     e98:	d503201f 	nop
     e9c:	d503201f 	nop

0000000000000ea0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0>:
   *  https://gcc.gnu.org/onlinedocs/libstdc++/manual/streambufs.html#io.streambuf.buffering
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
     ea0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     ea4:	910003fd 	mov	x29, sp
     ea8:	a90153f3 	stp	x19, x20, [sp, #16]
     eac:	aa0003f3 	mov	x19, x0
    { return flush(__os.put(__os.widen('\n'))); }
     eb0:	f9400000 	ldr	x0, [x0]
     eb4:	f85e8000 	ldur	x0, [x0, #-24]
     eb8:	8b000260 	add	x0, x19, x0
     ebc:	f9407814 	ldr	x20, [x0, #240]

  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
     ec0:	b4000254 	cbz	x20, f08 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0+0x68>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
     ec4:	3940e280 	ldrb	w0, [x20, #56]
     ec8:	340000e0 	cbz	w0, ee4 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0+0x44>
	  return _M_widen[static_cast<unsigned char>(__c)];
     ecc:	39410e81 	ldrb	w1, [x20, #67]
     ed0:	aa1303e0 	mov	x0, x19
     ed4:	97fffee7 	bl	a70 <_ZNSo3putEc@plt>
     ed8:	a94153f3 	ldp	x19, x20, [sp, #16]
     edc:	a8c27bfd 	ldp	x29, x30, [sp], #32
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
     ee0:	17fffef4 	b	ab0 <_ZNSo5flushEv@plt>
	this->_M_widen_init();
     ee4:	aa1403e0 	mov	x0, x20
     ee8:	97ffff06 	bl	b00 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
     eec:	f9400282 	ldr	x2, [x20]
     ef0:	52800141 	mov	w1, #0xa                   	// #10
     ef4:	aa1403e0 	mov	x0, x20
     ef8:	f9401842 	ldr	x2, [x2, #48]
     efc:	d63f0040 	blr	x2
     f00:	12001c01 	and	w1, w0, #0xff
     f04:	17fffff3 	b	ed0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0+0x30>
	__throw_bad_cast();
     f08:	97ffff02 	bl	b10 <_ZSt16__throw_bad_castv@plt>
     f0c:	d503201f 	nop

0000000000000f10 <_Z4swapPiii>:
	array[i] = array[j];
     f10:	93407c42 	sxtw	x2, w2
	int temp = array[i];
     f14:	93407c21 	sxtw	x1, w1
	array[i] = array[j];
     f18:	b8627804 	ldr	w4, [x0, x2, lsl #2]
	int temp = array[i];
     f1c:	b8617803 	ldr	w3, [x0, x1, lsl #2]
	array[i] = array[j];
     f20:	b8217804 	str	w4, [x0, x1, lsl #2]
	array[j] = temp;
     f24:	b8227803 	str	w3, [x0, x2, lsl #2]
}
     f28:	d65f03c0 	ret
     f2c:	d503201f 	nop

0000000000000f30 <_Z11BubbleSort1Pii>:
	for (int i = 0; i < n-1; i++)
     f30:	51000425 	sub	w5, w1, #0x1
     f34:	710000bf 	cmp	w5, #0x0
     f38:	540002cd 	b.le	f90 <_Z11BubbleSort1Pii+0x60>
     f3c:	51000821 	sub	w1, w1, #0x2
     f40:	d1001006 	sub	x6, x0, #0x4
     f44:	91000827 	add	x7, x1, #0x2
     f48:	d2800024 	mov	x4, #0x1                   	// #1
     f4c:	d503201f 	nop
		for (int j = i + 1; j < n-1; j++)
     f50:	6b0400bf 	cmp	w5, w4
     f54:	5400018d 	b.le	f84 <_Z11BubbleSort1Pii+0x54>
			if (array[i]>array[j])
     f58:	b86478c3 	ldr	w3, [x6, x4, lsl #2]
     f5c:	aa0403e1 	mov	x1, x4
     f60:	b8617802 	ldr	w2, [x0, x1, lsl #2]
     f64:	6b03005f 	cmp	w2, w3
     f68:	5400008a 	b.ge	f78 <_Z11BubbleSort1Pii+0x48>  // b.tcont
	array[i] = array[j];
     f6c:	b8217803 	str	w3, [x0, x1, lsl #2]
}
     f70:	2a0203e3 	mov	w3, w2
	array[j] = temp;
     f74:	b82478c2 	str	w2, [x6, x4, lsl #2]
		for (int j = i + 1; j < n-1; j++)
     f78:	91000421 	add	x1, x1, #0x1
     f7c:	6b0100bf 	cmp	w5, w1
     f80:	54ffff0c 	b.gt	f60 <_Z11BubbleSort1Pii+0x30>
	for (int i = 0; i < n-1; i++)
     f84:	91000484 	add	x4, x4, #0x1
     f88:	eb0400ff 	cmp	x7, x4
     f8c:	54fffe21 	b.ne	f50 <_Z11BubbleSort1Pii+0x20>  // b.any
}
     f90:	d65f03c0 	ret

0000000000000f94 <_Z13GenerateArrayPi>:
void GenerateArray(int* myarray){
     f94:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     f98:	910003fd 	mov	x29, sp
     f9c:	a90153f3 	stp	x19, x20, [sp, #16]
     fa0:	91404414 	add	x20, x0, #0x11, lsl #12
     fa4:	aa0003f3 	mov	x19, x0
     fa8:	912b0294 	add	x20, x20, #0xac0
     fac:	d503201f 	nop
		myarray[i]=rand();
     fb0:	97fffeb8 	bl	a90 <rand@plt>
     fb4:	b8004660 	str	w0, [x19], #4
	for (int i = 0; i < LENGTH; i++)
     fb8:	eb14027f 	cmp	x19, x20
     fbc:	54ffffa1 	b.ne	fb0 <_Z13GenerateArrayPi+0x1c>  // b.any
}
     fc0:	a94153f3 	ldp	x19, x20, [sp, #16]
     fc4:	a8c27bfd 	ldp	x29, x30, [sp], #32
     fc8:	d65f03c0 	ret
     fcc:	d503201f 	nop

0000000000000fd0 <_Z8SumArrayPi>:
long int SumArray(int * arr){
     fd0:	4f000400 	movi	v0.4s, #0x0
     fd4:	91404401 	add	x1, x0, #0x11, lsl #12
     fd8:	912b0021 	add	x1, x1, #0xac0
     fdc:	d503201f 	nop
        sums+=arr[i];
     fe0:	3cc10401 	ldr	q1, [x0], #16
     fe4:	0ea11000 	saddw	v0.2d, v0.2d, v1.2s
     fe8:	4ea11000 	saddw2	v0.2d, v0.2d, v1.4s
    for (int i = 0; i < LENGTH; i++)
     fec:	eb00003f 	cmp	x1, x0
     ff0:	54ffff81 	b.ne	fe0 <_Z8SumArrayPi+0x10>  // b.any
    return sums;
     ff4:	5ef1b800 	addp	d0, v0.2d
}
     ff8:	9e660000 	fmov	x0, d0
     ffc:	d65f03c0 	ret

Disassembly of section .fini:

0000000000001000 <_fini>:
    1000:	d503201f 	nop
    1004:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    1008:	910003fd 	mov	x29, sp
    100c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    1010:	d65f03c0 	ret
