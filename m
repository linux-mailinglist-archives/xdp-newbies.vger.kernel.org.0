Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 103661140EE
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Dec 2019 13:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfLEMkg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 5 Dec 2019 07:40:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26622 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729099AbfLEMkg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 5 Dec 2019 07:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575549635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XpLxceFJg2U3J6ZX5pMfEYnwzKDy9xwAZ+uNSz/L0AA=;
        b=cTygzJZZJ2o6QbybR5MtsBFKgdj8wsj81eyLN6iQFZjkjnP6viFYIS8dnUH3hgJoSeR7Ec
        ZCjGCBrBqtx0B5PcnczIrYYLze398DWHcTcVGh/skrr3PwDoIE3cmQHihlT0E90/O/VBEM
        InQdb2lmrYUSxddpEUE1t5IpzOjhksw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-mRgeQYcSNMWRme6nk2-qxw-1; Thu, 05 Dec 2019 07:40:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EEA518557C2;
        Thu,  5 Dec 2019 12:40:27 +0000 (UTC)
Received: from [10.36.116.191] (ovpn-116-191.ams2.redhat.com [10.36.116.191])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D31B1D1;
        Thu,  5 Dec 2019 12:40:25 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Yonghong Song" <yhs@fb.com>
Cc:     "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Subject: Re: Trying the bpf trace a bpf xdp program
Date:   Thu, 05 Dec 2019 13:40:24 +0100
Message-ID: <F8CFD537-7907-4259-9C91-4649F799216B@redhat.com>
In-Reply-To: <E08A0006-E254-492C-92AB-408B58E456C0@redhat.com>
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
 <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com>
 <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
 <4BBF99E4-9554-44F7-8505-D4B8416554C4@redhat.com>
 <d588c894-a4e0-8b99-72a9-4429b27091df@fb.com>
 <056E9F5E-4FDD-4636-A43A-EC98A06E84D3@redhat.com>
 <aa59532b-34a9-7887-f550-ef2859f0c9f1@fb.com>
 <B7E0062E-37ED-46E6-AE64-EE3E2A0294EA@redhat.com>
 <7062345a-1060-89f6-0c02-eef2fe0d835a@fb.com>
 <b8d80047-3bc1-5393-76a1-7517cb2b7280@fb.com>
 <E08A0006-E254-492C-92AB-408B58E456C0@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: mRgeQYcSNMWRme6nk2-qxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 4 Dec 2019, at 19:52, Eelco Chaudron wrote:

> On 4 Dec 2019, at 19:01, Yonghong Song wrote:
>
> <SNIP>
>
>>>> I=E2=80=99ve put my code on GitHub, maybe it=E2=80=99s just something =
stupid=E2=80=A6
>>
>> Thanks for the test case. This indeed a kernel bug.
>> The following change fixed the issue:
>>
>>
>> -bash-4.4$ git diff
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index a0482e1c4a77..034ef81f935b 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -9636,7 +9636,10 @@ static int check_attach_btf_id(struct
>> bpf_verifier_env *env)
>>                                  ret =3D -EINVAL;
>>                                  goto out;
>>                          }
>> -                       addr =3D (long)
>> tgt_prog->aux->func[subprog]->bpf_func;
>> +                       if (subprog =3D=3D 0)
>> +                               addr =3D (long) tgt_prog->bpf_func;
>> +                       else
>> +                               addr =3D (long)
>> tgt_prog->aux->func[subprog]->bpf_func;
>>                  } else {
>>                          addr =3D kallsyms_lookup_name(tname);
>>                          if (!addr) {
>> -bash-4.4$
>>
>> The reason is for a bpf program without any additional subprogram
>> (callees), tgt_prog->aux->func is not populated and is a NULL=20
>> pointer,
>> so the access tgt_prog->aux->func[0]->bpf_func will segfault.
>>
>> With the above change, your test works properly.
>
> Thanks for the quick response, and as you mention the test passes with=20
> the patch above.
>
> I will continue my experiments later this week, and let you know if I=20
> run into any other problems.
>

With the following program I get some access errors:

#define bpf_debug(fmt, ...)                         \
{                                                   \
   char __fmt[] =3D fmt;                               \
   bpf_trace_printk(__fmt, sizeof(__fmt),            \
                    ##__VA_ARGS__);                  \
}

BPF_TRACE_2("fexit/xdp_prog_simple", trace_on_exit,
             struct xdp_md *, xdp, int, ret)
{
   __u32 rx_queue;

   __builtin_preserve_access_index(({
         rx_queue =3D xdp->rx_queue_index;
       }));

   bpf_debug("fexit: queue =3D %u, ret =3D %d\n", rx_queue, ret);

   return 0;
}

I assume the XDP context has not been vetted?

libbpf: -- BEGIN DUMP LOG ---
libbpf:
func#0 @0
BPF program ctx type is not a struct
Type info disagrees with actual arguments due to compiler optimizations
0: R1=3Dctx(id=3D0,off=3D0,imm=3D0) R10=3Dfp0
; BPF_TRACE_2("fexit/xdp_prog_simple", trace_on_exit,
0: (b7) r2 =3D 16
1: R1=3Dctx(id=3D0,off=3D0,imm=3D0) R2_w=3Dinv16 R10=3Dfp0
; BPF_TRACE_2("fexit/xdp_prog_simple", trace_on_exit,
1: (79) r3 =3D *(u64 *)(r1 +0)
2: R1=3Dctx(id=3D0,off=3D0,imm=3D0) R2_w=3Dinv16=20
R3_w=3Dptr_xdp_buff(id=3D0,off=3D0,imm=3D0) R10=3Dfp0
2: (0f) r3 +=3D r2
last_idx 2 first_idx 0
regs=3D4 stack=3D0 before 1: (79) r3 =3D *(u64 *)(r1 +0)
regs=3D4 stack=3D0 before 0: (b7) r2 =3D 16
3: R1=3Dctx(id=3D0,off=3D0,imm=3D0) R2_w=3DinvP16=20
R3_w=3Dptr_xdp_buff(id=3D0,off=3D16,imm=3D0) R10=3Dfp0
; rx_queue =3D xdp->rx_queue_index;
3: (61) r3 =3D *(u32 *)(r3 +0)
cannot access ptr member data_meta with moff 16 in struct xdp_buff with=20
off 16 size 4
verification time 102 usec
stack depth 0
processed 4 insns (limit 1000000) max_states_per_insn 0 total_states 0=20
peak_states 0 mark_read 0
libbpf: -- END LOG --


Trying to use the helpers, passes verification, however, it=E2=80=99s dumpi=
ng=20
invalid content:

BPF_TRACE_2("fexit/xdp_prog_simple", trace_on_exit,
             struct xdp_md *, xdp, int, ret)
{
   __u32 rx_queue;

   bpf_probe_read_kernel(&rx_queue, sizeof(rx_queue),
                         __builtin_preserve_access_index(&xdp->rx_queue_ind=
ex));

   bpf_debug("fexit: queue =3D %u, ret =3D %d\n", rx_queue, ret);
   return 0;
}

Debug output:

    ping6-2752  [004] ..s1 60763.917790: 0: SIMPLE: [ifindex =3D 4, queue=
=20
=3D  0]
    ping6-2752  [004] ..s1 60763.917800: 0: fexit: queue =3D 2969379072,=20
ret =3D 2
    ping6-2752  [004] ..s1 60764.941817: 0: SIMPLE: [ifindex =3D 4, queue=
=20
=3D  0]
    ping6-2752  [004] ..s1 60764.941828: 0: fexit: queue =3D 2969379072,=20
ret =3D 2
    ping6-2752  [004] ..s1 60765.965835: 0: SIMPLE: [ifindex =3D 4, queue=
=20
=3D  0]


Tried the same with fentry for this function, but the same results as=20
fexit.

Any hints?

Thanks,


Eelco

