Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EF527B58C
	for <lists+xdp-newbies@lfdr.de>; Mon, 28 Sep 2020 21:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgI1Tlo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 28 Sep 2020 15:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42257 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726621AbgI1Tlo (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 28 Sep 2020 15:41:44 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601322101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WYGDCBVyVNakDh7qCABEdfW6ghqd4N7uA5vorgPVxtc=;
        b=O7wnnEl9emYT9FnXQszpv18fKjcRM0vGrbjRicBGn8qYtx0UctgWr7NnSPgcGOnOenNvxn
        UJ9+mNpyIkPBnH8PaL6yqEStoJjwcpQ+fqlwGesLP6CYFkgUwR2okBdn501AAg6X8GUNnd
        BjgeR925Gq0OKp9ZH7kO/D8RDd7i57I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-g0zitIU1PTOCmary8_1xTQ-1; Mon, 28 Sep 2020 15:41:36 -0400
X-MC-Unique: g0zitIU1PTOCmary8_1xTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DF4D802B46;
        Mon, 28 Sep 2020 19:41:35 +0000 (UTC)
Received: from [192.168.241.128] (ovpn-112-113.ams2.redhat.com [10.36.112.113])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F47310013C4;
        Mon, 28 Sep 2020 19:41:24 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     andriin@fb.com, "Alexei Starovoitov" <ast@kernel.org>,
        "Toke =?utf-8?b?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=" <toke@redhat.com>,
        "Jesper Dangaard Brouer" <brouer@redhat.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        Jiri <jolsa@redhat.com>,
        "Arnaldo Carvalho de Melo" <acme@redhat.com>,
        "=?utf-8?b?QmrDtnJuIFTDtnBlbA==?=" <bjorn.topel@gmail.com>,
        "Eelco Chaudron" <echaudro@redhat.com>
Subject: Re: XDP/eBPF/jit problem, system crash, with some ctx access changes
Date:   Mon, 28 Sep 2020 21:41:23 +0200
Message-ID: <B587E451-F749-4E48-8621-CC9FBB15FEEA@redhat.com>
In-Reply-To: <153DBF54-2F39-48B0-872A-4C21A4544BB7@redhat.com>
References: <153DBF54-2F39-48B0-872A-4C21A4544BB7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all once more…

I got an offline email from Bjorn decoding the first backtrace which 
made it all clear (I was looking at the second one :).

Here is a fragment of the xlated code:

; data = (void *)(long)xdp->data;
  604: (79) r1 = *(u64 *)(r1 +56)
  605: (55) if r1 != 0x0 goto pc+1
  606: (79) r1 = *(u64 *)(r1 +0)


Now the jited code:

; data = (void *)(long)xdp->data;
  595:   mov    0x38(%rdi),%rdi
  599:   test   %rdi,%rdi
  59c:   jne    0x00000000000005a2
  59e:   mov    0x0(%rdi),%rdi

It might not be obvious, but in this case, both the source and 
destination registers are the same!!

Briefly looking at some other code in the filter.c code, I found some 
instances where they check for this and copy the content to a temp 
region in the ctx structure.

However, SOCK_ADDR_STORE_NESTED_FIELD_OFF might have the same problem as 
my code!

I’ll rework my code to deal with the src=dst part. But more code might 
exist that has the same problem…

Cheers,

Eelco

On 28 Sep 2020, at 17:19, Eelco Chaudron wrote:

> Hi all,
>
> I'm working on a PoC for some XDP multi-buffer access, but I'm running 
> into some jit/eBPF problem.
>
> Here is a piece of code I added in bpf_convert_ctx_access(), on 
> net-next:
>
>   @@ -8496,9 +8531,17 @@ static u32 xdp_convert_ctx_access(enum b
>
>       switch (si->off) {
>       case offsetof(struct xdp_md, data):
>   -		*insn++ = BPF_LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_buff, data),
>   +		*insn++ = BPF_LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_buff,
>   +						       mb_data),
>   +				      si->dst_reg, si->src_reg,
>   +				      offsetof(struct xdp_buff, mb_data));
>   +		/* if (dst_reg != NULL) goto A */
>   +		*insn++ = BPF_JMP_IMM(BPF_JNE, si->dst_reg, 0, 1);
>   +		*insn++ = BPF_LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_buff,
>   +						       data),
>                         si->dst_reg, si->src_reg,
>                         offsetof(struct xdp_buff, data));
>   +		/* A: */
>           break;
>
> However, when executing the xdp_noinline self-test I get a segfault 
> (and yes, I'm 100% sure mb_data is always NULL):
>
> $ sudo ./test_progs --name xdp_noinline
> Killed
>
> [   19.333353] BUG: kernel NULL pointer dereference, address: 
> 0000000000000000
> [   19.333376] #PF: supervisor read access in kernel mode
> [   19.333383] #PF: error_code(0x0000) - not-present page
> [   19.333391] PGD 7b756067 P4D 7b756067 PUD 7850b067 PMD 0
> [   19.333401] Oops: 0000 [#1] SMP NOPTI
> [   19.333408] CPU: 1 PID: 1579 Comm: test_progs Not tainted 
> 5.9.0-rc6+ #70
> [   19.333416] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
> BIOS 1.13.0-2.fc32 04/01/2014
> [   19.333428] RIP: 0010:bpf_prog_2a72cd80d0b49e12_F+0x59a/0x6d8
> [   19.333436] Code: ff ff 48 8b 78 08 48 83 c7 01 48 89 78 08 48 8b 
> 78 00 4c 01 ef 48 89 78 00 48 8b 7d 90 48 8b 77 08 48 8b 7f 38 48 85 
> ff 75 04 <48> 8b 7f 00 48 89 fa 48 83 c2 04 48 39 f2 0f 87 28 fb ff ff 
> 8b 73
> [   19.333457] RSP: 0018:ffffb7330099fc70 EFLAGS: 00010246
> [   19.333465] RAX: ffffd732ffc8adf0 RBX: ffff9575b73d6958 RCX: 
> 0000000000000020
> [   19.333474] RDX: ffff9575b6c4d000 RSI: ffff9575b6c4d136 RDI: 
> 0000000000000000
> [   19.333483] RBP: ffffb7330099fd08 R08: ffff9575b6c4d0ec R09: 
> 0000000000000000
> [   19.333491] R10: 40bf273800000000 R11: 0000000000000003 R12: 
> 0000000000000000
> [   19.333500] R13: 000000000000007b R14: 4343917700000001 R15: 
> ffffb7330098dff8
> [   19.333510] FS:  00007f7274403740(0000) GS:ffff9575bdc80000(0000) 
> knlGS:0000000000000000
> [   19.333520] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   19.333527] CR2: 0000000000000000 CR3: 0000000076d22006 CR4: 
> 0000000000370ee0
> [   19.333538] Call Trace:
> [   19.333547]  bpf_prog_32ab9add9cf981b8_F+0x9e/0x7d8
> [   19.333562]  bpf_test_run+0xc4/0x270
> [   19.333585]  ? __bpf_arch_text_poke+0xaf/0x170
> [   19.333593]  bpf_prog_test_run_xdp+0x11a/0x250
> [   19.333607]  __do_sys_bpf+0x8fe/0x1e60
> [   19.333628]  do_syscall_64+0x33/0x40
> [   19.333647]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   19.333661] RIP: 0033:0x7f727450437d
> [   19.333667] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e 
> fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 
> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d eb 6a 0c 00 f7 d8 64 89 
> 01 48
> [   19.333688] RSP: 002b:00007ffd8b7a8888 EFLAGS: 00000206 ORIG_RAX: 
> 0000000000000141
> [   19.333698] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 
> 00007f727450437d
> [   19.333707] RDX: 0000000000000078 RSI: 00007ffd8b7a88e0 RDI: 
> 000000000000000a
> [   19.333716] RBP: 00007ffd8b7a88a0 R08: 00007ffd8b7a89e8 R09: 
> 00007ffd8b7a88e0
> [   19.333725] R10: 00007ffd8b7a8a40 R11: 0000000000000206 R12: 
> 00007f72744036b8
> [   19.333734] R13: 00007ffd8b7a8980 R14: 00007ffd8b7a89c0 R15: 
> 00007ffd8b7a89e0
> [   19.333743] Modules linked in: fuse nft_fib_inet nft_fib_ipv4 
> nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 
> nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
> nf_defrag_ipv4 ip6_tables nft_compat ip_set rfkill nf_tables nfnetlink 
> intel_rapl_msr intel_rapl_common cirrus kvm_intel kvm drm_kms_helper 
> joydev virtio_net irqbypass net_failover failover virtio_balloon 
> i2c_piix4 drm ip_tables xfs libcrc32c crct10dif_pclmul crc32_pclmul 
> crc32c_intel ghash_clmulni_intel serio_raw ata_generic qemu_fw_cfg 
> pata_acpi
> [   19.333811] CR2: 0000000000000000
>
> Quickly looking at the xlated and jit code the transformation looks 
> fine.
>
>
> As an experiment, I just tried to load the register twice, and this 
> has the same kind of weird effect on the xdp_noinline selftest:
>
>   @@ -8496,9 +8531,21 @@ static u32 xdp_convert_ctx_access(enum b
>
>       switch (si->off) {
>       case offsetof(struct xdp_md, data):-		*insn++ = 
> BPF_LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_buff, data),
>                         si->dst_reg, si->src_reg,
>                         offsetof(struct xdp_buff, data));
>   +		*insn++ = BPF_LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_buff,
>   +						       data),
>   +				      si->dst_reg, si->src_reg,
>   +				      offsetof(struct xdp_buff, data));
>           break;
>
> segfault:
>
> [ 3038.299210] general protection fault, probably for non-canonical 
> address 0x298691604040000: 0000 [#5] SMP NOPTI
> [ 3038.301016] CPU: 0 PID: 8629 Comm: test_progs Tainted: G      D     
>       5.9.0-rc6+ #71
> [ 3038.301795] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
> BIOS 1.13.0-2.fc32 04/01/2014
> [ 3038.302334] RIP: 0010:bpf_prog_162f3a446f46ea21_F+0x5bf/0xbe4
> [ 3038.302876] Code: 08 48 8b 7f 00 48 8b 7f 00 48 89 fa 48 83 c2 04 
> 48 39 f2 0f 87 2b fb ff ff 8b 73 00 49 c7 c2 59 8f 60 ad 49 c1 e2 20 
> 4c 09 d6 <89> 77 00 e9 12 fb ff ff cc cc cc cc cc cc cc cc cc cc cc cc 
> cc cc
> [ 3038.303951] RSP: 0018:ffff98bfc0ab3c70 EFLAGS: 00010282
> [ 3038.304496] RAX: ffffb8bfbfc14460 RBX: ffff8cf8f8c1b158 RCX: 
> 0000000000000020
> [ 3038.305015] RDX: 0298691604040004 RSI: ad608f5900001234 RDI: 
> 0298691604040000
> [ 3038.305542] RBP: ffff98bfc0ab3d08 R08: ffff8cf8b4de90ec R09: 
> 0000000000000000
> [ 3038.306037] R10: ad608f5900000000 R11: 0000000000000003 R12: 
> ffff8cf8b5168000
> [ 3038.306526] R13: 000000000000007b R14: d88f9de400000001 R15: 
> ffff98bfc0ac3758
> [ 3038.307018] FS:  00007fa431a63740(0000) GS:ffff8cf8fdc00000(0000) 
> knlGS:0000000000000000
> [ 3038.307527] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3038.308012] CR2: 000055f843d74790 CR3: 0000000078a6c003 CR4: 
> 0000000000370ef0
> [ 3038.308512] Call Trace:
> [ 3038.308986]  bpf_prog_fe85f1fb8b720358_F+0x99/0x7f0
> [ 3038.309460]  bpf_test_run.cold+0x35/0x9d
> [ 3038.309939]  ? __bpf_arch_text_poke+0xaf/0x170
> [ 3038.310420]  bpf_prog_test_run_xdp+0x11a/0x250
> [ 3038.310878]  __do_sys_bpf+0x8fe/0x1e60
> [ 3038.311323]  do_syscall_64+0x33/0x40
> [ 3038.311758]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [ 3038.312189] RIP: 0033:0x7fa431b6437d
> [ 3038.312622] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e 
> fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 
> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d eb 6a 0c 00 f7 d8 64 89 
> 01 48
> [ 3038.313471] RSP: 002b:00007ffc8b6cea28 EFLAGS: 00000206 ORIG_RAX: 
> 0000000000000141
> [ 3038.313907] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 
> 00007fa431b6437d
> [ 3038.314361] RDX: 0000000000000078 RSI: 00007ffc8b6cea80 RDI: 
> 000000000000000a
> [ 3038.314775] RBP: 00007ffc8b6cea40 R08: 00007ffc8b6ceb88 R09: 
> 00007ffc8b6cea80
> [ 3038.315182] R10: 00007ffc8b6cebe0 R11: 0000000000000206 R12: 
> 00007fa431a636b8
> [ 3038.315589] R13: 00007ffc8b6ceb20 R14: 00007ffc8b6ceb60 R15: 
> 0000000000000000
> [ 3038.315970] Modules linked in: fuse nft_fib_inet nft_fib_ipv4 
> nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 
> nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
> nf_defrag_ipv4 ip6_tables nft_compat ip_set rfkill nf_tables nfnetlink 
> intel_rapl_msr intel_rapl_common kvm_intel kvm virtio_net net_failover 
> joydev irqbypass virtio_balloon cirrus failover drm_kms_helper 
> i2c_piix4 drm ip_tables xfs libcrc32c crct10dif_pclmul crc32_pclmul 
> crc32c_intel serio_raw ghash_clmulni_intel ata_generic qemu_fw_cfg 
> pata_acpi
> [ 3038.317936] ---[ end trace bcf61aee1cf2ba1f ]---
>
>
> If I look at the translated code, it looks fine, I see a couple of 
> references that look like:
>
> ; void *data = (void *)(long)ctx->data;
>    3: (79) r1 = *(u64 *)(r4 +0)
>    4: (79) r1 = *(u64 *)(r4 +0)
>
> When I look at the jited code I see the same:
>
> ; void *data = (void *)(long)ctx->data;
>   25:   mov    0x0(%rcx),%rdi
>   29:   mov    0x0(%rcx),%rdi
>
>
> If I try to find the “bpf_prog_fe85f1fb8b720358” in the “bpftool 
> prog dump jited id 88” output I can not find it :( Any idea where I 
> should look for it?
>
>
> Anyone any idea before I start digging into the world of jit?
>
>
> Thanks,
>
> Eelco

