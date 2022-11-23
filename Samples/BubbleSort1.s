
./BubbleSort1:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000000968 <_init>:
 968:	d503201f 	nop
 96c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 970:	910003fd 	mov	x29, sp
 974:	94000050 	bl	ab4 <call_weak_fn>
 978:	a8c17bfd 	ldp	x29, x30, [sp], #16
 97c:	d65f03c0 	ret

Disassembly of section .plt:

0000000000000980 <.plt>:
 980:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 984:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 988:	f947a611 	ldr	x17, [x16, #3912]
 98c:	913d2210 	add	x16, x16, #0xf48
 990:	d61f0220 	br	x17
 994:	d503201f 	nop
 998:	d503201f 	nop
 99c:	d503201f 	nop

00000000000009a0 <__stack_chk_fail@plt>:
 9a0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 9a4:	f947aa11 	ldr	x17, [x16, #3920]
 9a8:	913d4210 	add	x16, x16, #0xf50
 9ac:	d61f0220 	br	x17

00000000000009b0 <rand@plt>:
 9b0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 9b4:	f947ae11 	ldr	x17, [x16, #3928]
 9b8:	913d6210 	add	x16, x16, #0xf58
 9bc:	d61f0220 	br	x17

00000000000009c0 <__cxa_finalize@plt>:
 9c0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 9c4:	f947b211 	ldr	x17, [x16, #3936]
 9c8:	913d8210 	add	x16, x16, #0xf60
 9cc:	d61f0220 	br	x17

00000000000009d0 <__libc_start_main@plt>:
 9d0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 9d4:	f947b611 	ldr	x17, [x16, #3944]
 9d8:	913da210 	add	x16, x16, #0xf68
 9dc:	d61f0220 	br	x17

00000000000009e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
 9e0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 9e4:	f947ba11 	ldr	x17, [x16, #3952]
 9e8:	913dc210 	add	x16, x16, #0xf70
 9ec:	d61f0220 	br	x17

00000000000009f0 <_ZNSolsEPFRSoS_E@plt>:
 9f0:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 9f4:	f947be11 	ldr	x17, [x16, #3960]
 9f8:	913de210 	add	x16, x16, #0xf78
 9fc:	d61f0220 	br	x17

0000000000000a00 <__cxa_atexit@plt>:
 a00:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 a04:	f947c211 	ldr	x17, [x16, #3968]
 a08:	913e0210 	add	x16, x16, #0xf80
 a0c:	d61f0220 	br	x17

0000000000000a10 <_ZNSt8ios_base4InitC1Ev@plt>:
 a10:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 a14:	f947c611 	ldr	x17, [x16, #3976]
 a18:	913e2210 	add	x16, x16, #0xf88
 a1c:	d61f0220 	br	x17

0000000000000a20 <abort@plt>:
 a20:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 a24:	f947ca11 	ldr	x17, [x16, #3984]
 a28:	913e4210 	add	x16, x16, #0xf90
 a2c:	d61f0220 	br	x17

0000000000000a30 <_ZNSolsEi@plt>:
 a30:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 a34:	f947ce11 	ldr	x17, [x16, #3992]
 a38:	913e6210 	add	x16, x16, #0xf98
 a3c:	d61f0220 	br	x17

0000000000000a40 <_ZNSolsEl@plt>:
 a40:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 a44:	f947d211 	ldr	x17, [x16, #4000]
 a48:	913e8210 	add	x16, x16, #0xfa0
 a4c:	d61f0220 	br	x17

0000000000000a50 <__gmon_start__@plt>:
 a50:	b0000090 	adrp	x16, 11000 <__FRAME_END__+0xfeac>
 a54:	f947d611 	ldr	x17, [x16, #4008]
 a58:	913ea210 	add	x16, x16, #0xfa8
 a5c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000a80 <_start>:
 a80:	d503201f 	nop
 a84:	d280001d 	mov	x29, #0x0                   	// #0
 a88:	d280001e 	mov	x30, #0x0                   	// #0
 a8c:	aa0003e5 	mov	x5, x0
 a90:	f94003e1 	ldr	x1, [sp]
 a94:	910023e2 	add	x2, sp, #0x8
 a98:	910003e6 	mov	x6, sp
 a9c:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 aa0:	f947e000 	ldr	x0, [x0, #4032]
 aa4:	d2800003 	mov	x3, #0x0                   	// #0
 aa8:	d2800004 	mov	x4, #0x0                   	// #0
 aac:	97ffffc9 	bl	9d0 <__libc_start_main@plt>
 ab0:	97ffffdc 	bl	a20 <abort@plt>

0000000000000ab4 <call_weak_fn>:
 ab4:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 ab8:	f947f400 	ldr	x0, [x0, #4072]
 abc:	b4000040 	cbz	x0, ac4 <call_weak_fn+0x10>
 ac0:	17ffffe4 	b	a50 <__gmon_start__@plt>
 ac4:	d65f03c0 	ret
 ac8:	d503201f 	nop
 acc:	d503201f 	nop

0000000000000ad0 <deregister_tm_clones>:
 ad0:	d0000080 	adrp	x0, 12000 <__data_start>
 ad4:	91004000 	add	x0, x0, #0x10
 ad8:	d0000081 	adrp	x1, 12000 <__data_start>
 adc:	91004021 	add	x1, x1, #0x10
 ae0:	eb00003f 	cmp	x1, x0
 ae4:	540000c0 	b.eq	afc <deregister_tm_clones+0x2c>  // b.none
 ae8:	b0000081 	adrp	x1, 11000 <__FRAME_END__+0xfeac>
 aec:	f947f021 	ldr	x1, [x1, #4064]
 af0:	b4000061 	cbz	x1, afc <deregister_tm_clones+0x2c>
 af4:	aa0103f0 	mov	x16, x1
 af8:	d61f0200 	br	x16
 afc:	d65f03c0 	ret

0000000000000b00 <register_tm_clones>:
 b00:	d0000080 	adrp	x0, 12000 <__data_start>
 b04:	91004000 	add	x0, x0, #0x10
 b08:	d0000081 	adrp	x1, 12000 <__data_start>
 b0c:	91004021 	add	x1, x1, #0x10
 b10:	cb000021 	sub	x1, x1, x0
 b14:	d37ffc22 	lsr	x2, x1, #63
 b18:	8b810c41 	add	x1, x2, x1, asr #3
 b1c:	9341fc21 	asr	x1, x1, #1
 b20:	b40000c1 	cbz	x1, b38 <register_tm_clones+0x38>
 b24:	b0000082 	adrp	x2, 11000 <__FRAME_END__+0xfeac>
 b28:	f947f842 	ldr	x2, [x2, #4080]
 b2c:	b4000062 	cbz	x2, b38 <register_tm_clones+0x38>
 b30:	aa0203f0 	mov	x16, x2
 b34:	d61f0200 	br	x16
 b38:	d65f03c0 	ret
 b3c:	d503201f 	nop

0000000000000b40 <__do_global_dtors_aux>:
 b40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 b44:	910003fd 	mov	x29, sp
 b48:	f9000bf3 	str	x19, [sp, #16]
 b4c:	d0000093 	adrp	x19, 12000 <__data_start>
 b50:	39404260 	ldrb	w0, [x19, #16]
 b54:	35000140 	cbnz	w0, b7c <__do_global_dtors_aux+0x3c>
 b58:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 b5c:	f947e800 	ldr	x0, [x0, #4048]
 b60:	b4000080 	cbz	x0, b70 <__do_global_dtors_aux+0x30>
 b64:	d0000080 	adrp	x0, 12000 <__data_start>
 b68:	f9400400 	ldr	x0, [x0, #8]
 b6c:	97ffff95 	bl	9c0 <__cxa_finalize@plt>
 b70:	97ffffd8 	bl	ad0 <deregister_tm_clones>
 b74:	52800020 	mov	w0, #0x1                   	// #1
 b78:	39004260 	strb	w0, [x19, #16]
 b7c:	f9400bf3 	ldr	x19, [sp, #16]
 b80:	a8c27bfd 	ldp	x29, x30, [sp], #32
 b84:	d65f03c0 	ret
 b88:	d503201f 	nop
 b8c:	d503201f 	nop

0000000000000b90 <frame_dummy>:
 b90:	17ffffdc 	b	b00 <register_tm_clones>

0000000000000b94 <_Z4swapPiii>:
#include <iostream>
#include <cstdlib>
using namespace std;
#define LENGTH 18096 
void swap(int array[], int i, int j)
{
 b94:	d10083ff 	sub	sp, sp, #0x20
 b98:	f90007e0 	str	x0, [sp, #8]
 b9c:	b90007e1 	str	w1, [sp, #4]
 ba0:	b90003e2 	str	w2, [sp]
	int temp = array[i];
 ba4:	b98007e0 	ldrsw	x0, [sp, #4]
 ba8:	d37ef400 	lsl	x0, x0, #2
 bac:	f94007e1 	ldr	x1, [sp, #8]
 bb0:	8b000020 	add	x0, x1, x0
 bb4:	b9400000 	ldr	w0, [x0]
 bb8:	b9001fe0 	str	w0, [sp, #28]
	array[i] = array[j];
 bbc:	b98003e0 	ldrsw	x0, [sp]
 bc0:	d37ef400 	lsl	x0, x0, #2
 bc4:	f94007e1 	ldr	x1, [sp, #8]
 bc8:	8b000021 	add	x1, x1, x0
 bcc:	b98007e0 	ldrsw	x0, [sp, #4]
 bd0:	d37ef400 	lsl	x0, x0, #2
 bd4:	f94007e2 	ldr	x2, [sp, #8]
 bd8:	8b000040 	add	x0, x2, x0
 bdc:	b9400021 	ldr	w1, [x1]
 be0:	b9000001 	str	w1, [x0]
	array[j] = temp;
 be4:	b98003e0 	ldrsw	x0, [sp]
 be8:	d37ef400 	lsl	x0, x0, #2
 bec:	f94007e1 	ldr	x1, [sp, #8]
 bf0:	8b000020 	add	x0, x1, x0
 bf4:	b9401fe1 	ldr	w1, [sp, #28]
 bf8:	b9000001 	str	w1, [x0]
}
 bfc:	d503201f 	nop
 c00:	910083ff 	add	sp, sp, #0x20
 c04:	d65f03c0 	ret

0000000000000c08 <_Z11BubbleSort1Pii>:
void BubbleSort1(int array[], int n)
{
 c08:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 c0c:	910003fd 	mov	x29, sp
 c10:	f9000fe0 	str	x0, [sp, #24]
 c14:	b90017e1 	str	w1, [sp, #20]
	for (int i = 0; i < n-1; i++)
 c18:	b9002bff 	str	wzr, [sp, #40]
 c1c:	14000020 	b	c9c <_Z11BubbleSort1Pii+0x94>
	{
		for (int j = i + 1; j < n-1; j++)
 c20:	b9402be0 	ldr	w0, [sp, #40]
 c24:	11000400 	add	w0, w0, #0x1
 c28:	b9002fe0 	str	w0, [sp, #44]
 c2c:	14000014 	b	c7c <_Z11BubbleSort1Pii+0x74>
		{
			if (array[i]>array[j])
 c30:	b9802be0 	ldrsw	x0, [sp, #40]
 c34:	d37ef400 	lsl	x0, x0, #2
 c38:	f9400fe1 	ldr	x1, [sp, #24]
 c3c:	8b000020 	add	x0, x1, x0
 c40:	b9400001 	ldr	w1, [x0]
 c44:	b9802fe0 	ldrsw	x0, [sp, #44]
 c48:	d37ef400 	lsl	x0, x0, #2
 c4c:	f9400fe2 	ldr	x2, [sp, #24]
 c50:	8b000040 	add	x0, x2, x0
 c54:	b9400000 	ldr	w0, [x0]
 c58:	6b00003f 	cmp	w1, w0
 c5c:	540000ad 	b.le	c70 <_Z11BubbleSort1Pii+0x68>
				swap(array, j, i);//每次i后面的元素比array[i]小就交换。
 c60:	b9402be2 	ldr	w2, [sp, #40]
 c64:	b9402fe1 	ldr	w1, [sp, #44]
 c68:	f9400fe0 	ldr	x0, [sp, #24]
 c6c:	97ffffca 	bl	b94 <_Z4swapPiii>
		for (int j = i + 1; j < n-1; j++)
 c70:	b9402fe0 	ldr	w0, [sp, #44]
 c74:	11000400 	add	w0, w0, #0x1
 c78:	b9002fe0 	str	w0, [sp, #44]
 c7c:	b94017e0 	ldr	w0, [sp, #20]
 c80:	51000400 	sub	w0, w0, #0x1
 c84:	b9402fe1 	ldr	w1, [sp, #44]
 c88:	6b00003f 	cmp	w1, w0
 c8c:	54fffd2b 	b.lt	c30 <_Z11BubbleSort1Pii+0x28>  // b.tstop
	for (int i = 0; i < n-1; i++)
 c90:	b9402be0 	ldr	w0, [sp, #40]
 c94:	11000400 	add	w0, w0, #0x1
 c98:	b9002be0 	str	w0, [sp, #40]
 c9c:	b94017e0 	ldr	w0, [sp, #20]
 ca0:	51000400 	sub	w0, w0, #0x1
 ca4:	b9402be1 	ldr	w1, [sp, #40]
 ca8:	6b00003f 	cmp	w1, w0
 cac:	54fffbab 	b.lt	c20 <_Z11BubbleSort1Pii+0x18>  // b.tstop
		}
	}
}
 cb0:	d503201f 	nop
 cb4:	d503201f 	nop
 cb8:	a8c37bfd 	ldp	x29, x30, [sp], #48
 cbc:	d65f03c0 	ret

0000000000000cc0 <_Z13GenerateArrayPi>:
void GenerateArray(int* myarray){
 cc0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
 cc4:	910003fd 	mov	x29, sp
 cc8:	f9000bf3 	str	x19, [sp, #16]
 ccc:	f90017e0 	str	x0, [sp, #40]
	for (int i = 0; i < LENGTH; i++)
 cd0:	b9003fff 	str	wzr, [sp, #60]
 cd4:	1400000a 	b	cfc <_Z13GenerateArrayPi+0x3c>
	{
		myarray[i]=rand();
 cd8:	b9803fe0 	ldrsw	x0, [sp, #60]
 cdc:	d37ef400 	lsl	x0, x0, #2
 ce0:	f94017e1 	ldr	x1, [sp, #40]
 ce4:	8b000033 	add	x19, x1, x0
 ce8:	97ffff32 	bl	9b0 <rand@plt>
 cec:	b9000260 	str	w0, [x19]
	for (int i = 0; i < LENGTH; i++)
 cf0:	b9403fe0 	ldr	w0, [sp, #60]
 cf4:	11000400 	add	w0, w0, #0x1
 cf8:	b9003fe0 	str	w0, [sp, #60]
 cfc:	b9403fe1 	ldr	w1, [sp, #60]
 d00:	5288d5e0 	mov	w0, #0x46af                	// #18095
 d04:	6b00003f 	cmp	w1, w0
 d08:	54fffe8d 	b.le	cd8 <_Z13GenerateArrayPi+0x18>
	}
}
 d0c:	d503201f 	nop
 d10:	d503201f 	nop
 d14:	f9400bf3 	ldr	x19, [sp, #16]
 d18:	a8c47bfd 	ldp	x29, x30, [sp], #64
 d1c:	d65f03c0 	ret

0000000000000d20 <_Z8SumArrayPi>:

long int SumArray(int * arr){
 d20:	d10083ff 	sub	sp, sp, #0x20
 d24:	f90007e0 	str	x0, [sp, #8]
    long int sums=0;
 d28:	f9000fff 	str	xzr, [sp, #24]
    for (int i = 0; i < LENGTH; i++)
 d2c:	b90017ff 	str	wzr, [sp, #20]
 d30:	1400000d 	b	d64 <_Z8SumArrayPi+0x44>
    {
        sums+=arr[i];
 d34:	b98017e0 	ldrsw	x0, [sp, #20]
 d38:	d37ef400 	lsl	x0, x0, #2
 d3c:	f94007e1 	ldr	x1, [sp, #8]
 d40:	8b000020 	add	x0, x1, x0
 d44:	b9400000 	ldr	w0, [x0]
 d48:	93407c00 	sxtw	x0, w0
 d4c:	f9400fe1 	ldr	x1, [sp, #24]
 d50:	8b000020 	add	x0, x1, x0
 d54:	f9000fe0 	str	x0, [sp, #24]
    for (int i = 0; i < LENGTH; i++)
 d58:	b94017e0 	ldr	w0, [sp, #20]
 d5c:	11000400 	add	w0, w0, #0x1
 d60:	b90017e0 	str	w0, [sp, #20]
 d64:	b94017e1 	ldr	w1, [sp, #20]
 d68:	5288d5e0 	mov	w0, #0x46af                	// #18095
 d6c:	6b00003f 	cmp	w1, w0
 d70:	54fffe2d 	b.le	d34 <_Z8SumArrayPi+0x14>
    }
    return sums;
 d74:	f9400fe0 	ldr	x0, [sp, #24]
}
 d78:	910083ff 	add	sp, sp, #0x20
 d7c:	d65f03c0 	ret

0000000000000d80 <main>:

int main()
{
 d80:	d14043ff 	sub	sp, sp, #0x10, lsl #12
 d84:	f90203ff 	str	xzr, [sp, #1024]
 d88:	d2835c0c 	mov	x12, #0x1ae0                	// #6880
 d8c:	cb2c63ff 	sub	sp, sp, x12
 d90:	a9007bfd 	stp	x29, x30, [sp]
 d94:	910003fd 	mov	x29, sp
 d98:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 d9c:	f947dc00 	ldr	x0, [x0, #4024]
 da0:	914043e1 	add	x1, sp, #0x10, lsl #12
 da4:	f9400002 	ldr	x2, [x0]
 da8:	f90d6c22 	str	x2, [x1, #6872]
 dac:	d2800002 	mov	x2, #0x0                   	// #0
	int arr[LENGTH];
    cout<<"Input array length:"<<LENGTH<<endl;
 db0:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 db4:	913cc001 	add	x1, x0, #0xf30
 db8:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 dbc:	f947ec00 	ldr	x0, [x0, #4056]
 dc0:	97ffff08 	bl	9e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 dc4:	5288d601 	mov	w1, #0x46b0                	// #18096
 dc8:	97ffff1a 	bl	a30 <_ZNSolsEi@plt>
 dcc:	aa0003e2 	mov	x2, x0
 dd0:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 dd4:	f947e401 	ldr	x1, [x0, #4040]
 dd8:	aa0203e0 	mov	x0, x2
 ddc:	97ffff05 	bl	9f0 <_ZNSolsEPFRSoS_E@plt>
    GenerateArray(arr);
 de0:	910063e0 	add	x0, sp, #0x18
 de4:	97ffffb7 	bl	cc0 <_Z13GenerateArrayPi>
    cout<<"Sorting......"<<endl;
 de8:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 dec:	913d2001 	add	x1, x0, #0xf48
 df0:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 df4:	f947ec00 	ldr	x0, [x0, #4056]
 df8:	97fffefa 	bl	9e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 dfc:	aa0003e2 	mov	x2, x0
 e00:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 e04:	f947e401 	ldr	x1, [x0, #4040]
 e08:	aa0203e0 	mov	x0, x2
 e0c:	97fffef9 	bl	9f0 <_ZNSolsEPFRSoS_E@plt>
	BubbleSort1(arr, LENGTH);
 e10:	910063e0 	add	x0, sp, #0x18
 e14:	5288d601 	mov	w1, #0x46b0                	// #18096
 e18:	97ffff7c 	bl	c08 <_Z11BubbleSort1Pii>
    long int sums=SumArray(arr);
 e1c:	910063e0 	add	x0, sp, #0x18
 e20:	97ffffc0 	bl	d20 <_Z8SumArrayPi>
 e24:	f9000be0 	str	x0, [sp, #16]
    cout<<"The result of summing the array:"<<sums<<endl;
 e28:	90000000 	adrp	x0, 0 <__abi_tag-0x278>
 e2c:	913d6001 	add	x1, x0, #0xf58
 e30:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 e34:	f947ec00 	ldr	x0, [x0, #4056]
 e38:	97fffeea 	bl	9e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 e3c:	f9400be1 	ldr	x1, [sp, #16]
 e40:	97ffff00 	bl	a40 <_ZNSolsEl@plt>
 e44:	aa0003e2 	mov	x2, x0
 e48:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 e4c:	f947e401 	ldr	x1, [x0, #4040]
 e50:	aa0203e0 	mov	x0, x2
 e54:	97fffee7 	bl	9f0 <_ZNSolsEPFRSoS_E@plt>
    return 0;
 e58:	52800000 	mov	w0, #0x0                   	// #0
 e5c:	2a0003e1 	mov	w1, w0
 e60:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 e64:	f947dc00 	ldr	x0, [x0, #4024]
 e68:	914043e3 	add	x3, sp, #0x10, lsl #12
 e6c:	f94d6c64 	ldr	x4, [x3, #6872]
 e70:	f9400002 	ldr	x2, [x0]
 e74:	eb020084 	subs	x4, x4, x2
 e78:	d2800002 	mov	x2, #0x0                   	// #0
 e7c:	54000040 	b.eq	e84 <main+0x104>  // b.none
 e80:	97fffec8 	bl	9a0 <__stack_chk_fail@plt>
 e84:	2a0103e0 	mov	w0, w1
 e88:	a9407bfd 	ldp	x29, x30, [sp]
 e8c:	912b83ff 	add	sp, sp, #0xae0
 e90:	914047ff 	add	sp, sp, #0x11, lsl #12
 e94:	d65f03c0 	ret

0000000000000e98 <_Z41__static_initialization_and_destruction_0ii>:
 e98:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 e9c:	910003fd 	mov	x29, sp
 ea0:	b9001fe0 	str	w0, [sp, #28]
 ea4:	b9001be1 	str	w1, [sp, #24]
 ea8:	b9401fe0 	ldr	w0, [sp, #28]
 eac:	7100041f 	cmp	w0, #0x1
 eb0:	540001e1 	b.ne	eec <_Z41__static_initialization_and_destruction_0ii+0x54>  // b.any
 eb4:	b9401be1 	ldr	w1, [sp, #24]
 eb8:	529fffe0 	mov	w0, #0xffff                	// #65535
 ebc:	6b00003f 	cmp	w1, w0
 ec0:	54000161 	b.ne	eec <_Z41__static_initialization_and_destruction_0ii+0x54>  // b.any
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  ///@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
 ec4:	d0000080 	adrp	x0, 12000 <__data_start>
 ec8:	91006000 	add	x0, x0, #0x18
 ecc:	97fffed1 	bl	a10 <_ZNSt8ios_base4InitC1Ev@plt>
 ed0:	d0000080 	adrp	x0, 12000 <__data_start>
 ed4:	91002002 	add	x2, x0, #0x8
 ed8:	d0000080 	adrp	x0, 12000 <__data_start>
 edc:	91006001 	add	x1, x0, #0x18
 ee0:	b0000080 	adrp	x0, 11000 <__FRAME_END__+0xfeac>
 ee4:	f947fc00 	ldr	x0, [x0, #4088]
 ee8:	97fffec6 	bl	a00 <__cxa_atexit@plt>
 eec:	d503201f 	nop
 ef0:	a8c27bfd 	ldp	x29, x30, [sp], #32
 ef4:	d65f03c0 	ret

0000000000000ef8 <_GLOBAL__sub_I__Z4swapPiii>:
 ef8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 efc:	910003fd 	mov	x29, sp
 f00:	529fffe1 	mov	w1, #0xffff                	// #65535
 f04:	52800020 	mov	w0, #0x1                   	// #1
 f08:	97ffffe4 	bl	e98 <_Z41__static_initialization_and_destruction_0ii>
 f0c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 f10:	d65f03c0 	ret

Disassembly of section .fini:

0000000000000f14 <_fini>:
 f14:	d503201f 	nop
 f18:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 f1c:	910003fd 	mov	x29, sp
 f20:	a8c17bfd 	ldp	x29, x30, [sp], #16
 f24:	d65f03c0 	ret
