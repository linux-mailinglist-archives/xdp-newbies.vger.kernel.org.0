Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA911D2EEC
	for <lists+xdp-newbies@lfdr.de>; Thu, 14 May 2020 13:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgENL5C (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 14 May 2020 07:57:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31141 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725955AbgENL5B (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 14 May 2020 07:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589457419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T69xOUwZqwk4W+2pR9n8t2pR/vQ5fUckHk5oYHe7EWg=;
        b=iuv9BR/7oBabatF0uwVw5NW27CdPIW7dCI5T5IO3UMprI6ZLJ1d/7JR6VGXxX+3AAb4j4j
        I02+FRW1xvG+YackBZ7JM+K/1zpOxSsu6RucIe6DRbrVbDOFoq7AlKUaLLI3934aCULJ5V
        ftyDk1MYGle6uwc1G8uaazBOs/7A+OY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-4t4oHVAmMDGL9DisQN0tHQ-1; Thu, 14 May 2020 07:56:56 -0400
X-MC-Unique: 4t4oHVAmMDGL9DisQN0tHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00111872FE4;
        Thu, 14 May 2020 11:56:54 +0000 (UTC)
Received: from [10.36.112.234] (ovpn-112-234.ams2.redhat.com [10.36.112.234])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1383A6AD05;
        Thu, 14 May 2020 11:56:49 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Cc:     "Alexei Starovoitov" <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Toke =?utf-8?b?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=" <toke@redhat.com>
Subject: Re: fentry/fexit trace to BPF_PROG_TYPE_EXT BPF program not working
Date:   Thu, 14 May 2020 13:56:47 +0200
Message-ID: <45653D32-C707-4095-B121-DDE1ADA567B8@redhat.com>
In-Reply-To: <917D3B95-2FB0-4785-9B5E-F4AA6B9104BE@redhat.com>
References: <666CF27B-18B4-420B-A0FC-29947DB1682D@redhat.com>
 <CAADnVQJGdEJaW6oQbFOQYJWJxhjY-P=jawYYedb_qDN4zZufQg@mail.gmail.com>
 <917D3B95-2FB0-4785-9B5E-F4AA6B9104BE@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 13 May 2020, at 16:58, Eelco Chaudron wrote:

> On 6 May 2020, at 3:45, Alexei Starovoitov wrote:
>
>> On Wed, Apr 29, 2020 at 4:51 AM Eelco Chaudron <echaudro@redhat.com> 
>> wrote:
>>>
>>> Hi Alexie at al.
>>>
>>> I was trying to attach a fentry/fexit trace to BPF_PROG_TYPE_EXT BPF
>>> program but I'm getting a verifier error, and not sure why. Is this
>>> supported?
>>
>> The intent was to make it possible.
>> The verifier comment says:
>>                         /* Cannot fentry/fexit another fentry/fexit 
>> program.
>>                          * Cannot attach program extension to another 
>> extension.
>>                          * It's ok to attach fentry/fexit to 
>> extension program.
>>                          */
>>
>
> I tried it with the freplace in the fexit_bpf2bpf.c test, and here it 
> works fine.
>
>>> This is the error:
>>>
>>> libbpf: -- BEGIN DUMP LOG ---
>>> libbpf:
>>> arg#0 type is not a struct
>>> Unrecognized arg#0 type PTR
>>
>> looks like verifier got confused here.
>> It should have detected correct btf_id from freplace prog.
>> not sure what's going on.
>
> This is an EXT BPF program using the, struct xdp_md *xdp, so not sure 
> how to connect.
> So I did try both:
>
> - int BPF_PROG(trace_on_entry, struct xdp_md *xdp)
> - int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)
>
> This is the information from bpftool:
>
> ./bpftool prog show id 46
> 46: ext  name xdp_test_I  tag b5a46c6e9935298c  gpl
> 	loaded_at 2020-05-13T08:54:53+0000  uid 0
> 	xlated 136B  jited 108B  memlock 4096B
> 	btf_id 16
>
> ./bpftool btf dump id 16
> [1] PTR '(anon)' type_id=2
> [2] STRUCT 'xdp_md' size=20 vlen=5
> 	'data' type_id=3 bits_offset=0
> 	'data_end' type_id=3 bits_offset=32
> 	'data_meta' type_id=3 bits_offset=64
> 	'ingress_ifindex' type_id=3 bits_offset=96
> 	'rx_queue_index' type_id=3 bits_offset=128
> [3] TYPEDEF '__u32' type_id=4
> [4] INT 'unsigned int' size=4 bits_offset=0 nr_bits=32 encoding=(none)
> [5] FUNC_PROTO '(anon)' ret_type_id=6 vlen=1
> 	'ctx' type_id=1
> [6] INT 'int' size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
> [7] FUNC 'xdp_test_I' type_id=5 linkage=global
> [8] INT 'char' size=1 bits_offset=0 nr_bits=8 encoding=SIGNED
> [9] ARRAY '(anon)' type_id=8 index_type_id=10 nr_elems=4
> [10] INT '__ARRAY_SIZE_TYPE__' size=4 bits_offset=0 nr_bits=32 
> encoding=(none)
> [11] VAR '_license' type_id=9, linkage=global-alloc
> [12] DATASEC 'license' size=4 vlen=1
> 	type_id=11 offset=0 size=4
>
>
> ./bpftool prog dump xlated id 46
> int xdp_test_I(struct xdp_md * ctx):
> ; int xdp_test_I(struct xdp_md *ctx)
>    0: (b7) r2 = 10
> ; bpf_debug("PASS[1]: prog %u\n", ctx->ingress_ifindex);
>    1: (6b) *(u16 *)(r10 -8) = r2
>    2: (18) r2 = 0x752520676f727020
>    4: (7b) *(u64 *)(r10 -16) = r2
>    5: (18) r2 = 0x3a5d315b53534150
>    7: (7b) *(u64 *)(r10 -24) = r2
>    8: (79) r3 = *(u64 *)(r1 +40)
>    9: (79) r3 = *(u64 *)(r3 +0)
>   10: (61) r3 = *(u32 *)(r3 +256)
>   11: (bf) r1 = r10
> ;
>   12: (07) r1 += -24
> ; bpf_debug("PASS[1]: prog %u\n", ctx->ingress_ifindex);
>   13: (b7) r2 = 18
>   14: (85) call bpf_trace_printk#-56048
> ; return XDP_PASS;
>   15: (b7) r0 = 2
>   16: (95) exit
>
> #include <linux/bpf.h>
> #include <bpf/bpf_helpers.h>
> #include <xdp/xdp_helpers.h>
>
> #define bpf_debug(fmt, ...)                         \
>     {                                               \
>         char __fmt[] = fmt;                         \
>         bpf_trace_printk(__fmt, sizeof(__fmt),      \
>                          ##__VA_ARGS__);            \
>     }
>
> SEC("xdp_test_prog_I")
> int xdp_test_I(struct xdp_md *ctx)
> {
>     bpf_debug("PASS[1]: prog %u\n", ctx->ingress_ifindex);
>     return XDP_PASS;
> }

Please ignore the second part, as I cut/pasted the wrong info. Here is 
the info from the actual fexit trace program, and here it’s also a 
pointer:

xdp-fexit]$ bpftool btf dump file xdpdump_bpf.o
[1] PTR '(anon)' type_id=2
[2] INT 'long long unsigned int' size=8 bits_offset=0 nr_bits=64 
encoding=(none)
[3] FUNC_PROTO '(anon)' ret_type_id=4 vlen=1
	'ctx' type_id=1
[4] INT 'int' size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
[5] FUNC 'trace_on_exit' type_id=3
[6] STRUCT 'xdp_buff' size=48 vlen=6
	'data' type_id=7 bits_offset=0
	'data_end' type_id=7 bits_offset=64
	'data_meta' type_id=7 bits_offset=128
	'data_hard_start' type_id=7 bits_offset=192
	'handle' type_id=8 bits_offset=256
	'rxq' type_id=9 bits_offset=320
[7] PTR '(anon)' type_id=0
[8] INT 'long unsigned int' size=8 bits_offset=0 nr_bits=64 
encoding=(none)
[9] PTR '(anon)' type_id=10
[10] STRUCT 'xdp_rxq_info' size=16 vlen=2
	'dev' type_id=11 bits_offset=0
	'queue_index' type_id=12 bits_offset=64
[11] PTR '(anon)' type_id=14
[12] TYPEDEF '__u32' type_id=13
[13] INT 'unsigned int' size=4 bits_offset=0 nr_bits=32 encoding=(none)
[14] STRUCT 'net_device' size=4 vlen=1
	'ifindex' type_id=4 bits_offset=0
[15] INT 'char' size=1 bits_offset=0 nr_bits=8 encoding=SIGNED
[16] ARRAY '(anon)' type_id=15 index_type_id=17 nr_elems=4
[17] INT '__ARRAY_SIZE_TYPE__' size=4 bits_offset=0 nr_bits=32 
encoding=(none)
[18] VAR '_license' type_id=16, linkage=global-alloc
[19] DATASEC 'license' size=0 vlen=1
	type_id=18 offset=0 size=4

Maybe you can take a quick peek why it’s failing as I have no real 
experience with the verifier. I created some sample code that you can 
easily use with the following instructions:

Checkout the xdp tools repo and build it:

   # git clone https://github.com/chaudron/xdp-tools.git
   # cd xdp-tools
   # git checkout dev/xdpdump_multi
   # make

   # ulimit -l unlimited
   # cd xdp-test
   # cp ../lib/libxdp/xdp-dispatcher.o .
   # ../xdp-loader/xdp-loader load -m skb eth0 test_two_bpf.o test_bpf.o 
test_long_func_name.o --force


Bpftool should now show you the programs loaded, look for xdp_test_I:

   # bpftool prog | grep "xdp_test_I "
   199: ext  name xdp_test_I  tag b5a46c6e9935298c  gpl


Now use the id (199) in the xdp-fexit test program

   # cd ../xdp-fexit/
   # git diff

   -    prog_fd = bpf_prog_get_fd_by_id(56);
   +    prog_fd = bpf_prog_get_fd_by_id(199);

   # make


Run it:

   # ./fexit

   - Found prog_fd = 3
   - Opening object file
   - Opened object file: 0xa526b0
   libbpf: load bpf program failed: Permission denied
   libbpf: -- BEGIN DUMP LOG ---
   libbpf:
   func#0 @0
   arg#0 type is not a struct
   Unrecognized arg#0 type PTR
   0: R1=ctx(id=0,off=0,imm=0) R10=fp0
   ; int BPF_PROG(trace_on_exit, struct xdp_buff *xdp, int ret)
   0: (79) r1 = *(u64 *)(r1 +0)
   invalid bpf_context access off=0 size=8
   verification time 145 usec
   stack depth 0
   processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 
0 peak_states 0 mark_read 0

   libbpf: -- END LOG --
   libbpf: failed to load program 'fexit/xdp_test_I'
   libbpf: failed to load object './xdpdump_bpf.o'
   ERROR: Failed to load object file: Permission denied

Any ideas are welcome…

