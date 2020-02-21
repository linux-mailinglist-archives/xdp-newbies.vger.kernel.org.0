Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7C3F16773C
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Feb 2020 09:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbgBUIkc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Feb 2020 03:40:32 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26771 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730376AbgBUIkc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Feb 2020 03:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582274431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JTPR20HKTg0mqWm4Km86fJLqhvMfjPlVUGDfn89Erxc=;
        b=E8itxLqavD/UJ/5AhjUw+4QL43e4RVXeaXYD+afk1usztQLFvmI6bIrUo2Zo5FAiRpOlF6
        yt2YsgF8xX2DtIVQQtLbWJTryWH2VNdHr2+2VcBFVHRfcHt7R95e7+QwFpi8g7uUvgZDxC
        0QoXnluFpm71OtPmkwdETm0B4pZ1qNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-i2M8ezjxPoG26QMUGSktXQ-1; Fri, 21 Feb 2020 03:40:27 -0500
X-MC-Unique: i2M8ezjxPoG26QMUGSktXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0467C184B121;
        Fri, 21 Feb 2020 08:40:26 +0000 (UTC)
Received: from [10.36.117.6] (ovpn-117-6.ams2.redhat.com [10.36.117.6])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EF4D59076C;
        Fri, 21 Feb 2020 08:40:24 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Magnus Karlsson" <magnus.karlsson@gmail.com>
Cc:     "William Tu" <u9012063@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        "=?utf-8?b?QmrDtnJuIFTDtnBlbA==?=" <bjorn.topel@intel.com>
Subject: Re: xdpsock poll syscall CPU 100%
Date:   Fri, 21 Feb 2020 09:40:23 +0100
Message-ID: <FA00F7E2-E4E2-413B-9CC0-93AB2BA861A2@redhat.com>
In-Reply-To: <CAJ8uoz3t6mKVr+aHx_WDkPg66_wTSsMNySzWny9JhCR1VG7mBA@mail.gmail.com>
References: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
 <28C7C59E-0ED6-4331-8547-952419F20D1F@redhat.com>
 <CAJ8uoz3t6mKVr+aHx_WDkPg66_wTSsMNySzWny9JhCR1VG7mBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 21 Feb 2020, at 9:33, Magnus Karlsson wrote:

> On Fri, Feb 21, 2020 at 9:30 AM Eelco Chaudron <echaudro@redhat.com> =

> wrote:
>>
>>
>>
>> On 20 Feb 2020, at 23:49, William Tu wrote:
>>
>>> Hi,
>>>
>>> I'm trying to save some CPU cycles when there is no packet arrives.
>>> I enable the poll syscall option of xdpsock, by doing
>>>
>>> $ ./xdpsock -r -p -S -i ens16
>>>  sock0@ens160:0 rxdrop xdp-skb poll()
>>>                 pps         pkts        1.00
>>> rx              0           0
>>> tx              0           0
>>>
>>> Since there is no packet coming, I though by calling poll()
>>> system call, the xdpsock process will be blocked and CPU utilization
>>> should be way under 100%. However, I'm still seeing 100%
>>> CPU utilization. Am I understanding this correctly?
>>
>> Hi William, I can remember I saw this in the past two with this code. =

>> It
>> had something to do with the way xdpsock waits for the buffers to be
>> free=E2=80=99 ed by the kernel. What I can remember it had something t=
o do
>> with the veth interfaces also.
>>
>> I do remember that I fixed it in the tutorial for AF_XDP:
>> https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_=
XDP/af_xdp_user.c
>
> Eelco,
>
> Do you remember exactly what you had to fix in the xdpsock sample?
> Your tutorial is quite a rewrite so it is hard for me to tell exactly
> which of all the changes that fix this problem. The reason I ask is
> that it would be nice to fix this in the sample too.
>
> Thanks: Magnus

 From an earlier email conversation we had this is where it looped in my =

case:

>>>>> One other thing I noticed, which I need to research is that if I
>>>>> use
>>>>> rx_drop() function from /xdpsock_user.c it loops a lot in:
>>>>>
>>>>>   	while (ret !=3D rcvd) {
>>>>>    		if (ret < 0) {
>>>>> 	  			exit(-1);
>>>>> 		}
>>>>>    		ret =3D xsk_ring_prod__reserve(&xsk->umem-
>>> fq, rcvd, &idx_fq);
>>>>>
>>>>>    	}
>>>>>
>>>>> As ret return 0, until (it looks like) I send more packets. So =

>>>>> even
>>>>> in the poll() mode, it uses 100% cpu after sending a single =

>>>>> packet.
>>>>> Note this is with the default Fedora Kernel, as I=E2=80=99m working=
 on =

>>>>> this
>>>>> from my laptop. Does this sound familiar? If not I=E2=80=99ll dig i=
nto =

>>>>> it
>>>>> once I=E2=80=99m back.
>>>>
>>>> The xdpsock test is a busypolling test, to compare against DPDK
>>>> speeds.  For real use-cases, I think people will want to trade-off
>>>> latency vs. burning CPU.
>>>
>>> I understand the use case, but even with the xdpsock test program, =

>>> if
>>> I send a single packet it=E2=80=99s not received, or at least not whe=
n =

>>> it's
>>> sent. It takes 16 (or a multiple of it) before the get
>>> detected/processed. I think it=E2=80=99s because of the
>>> xsk_ring_prod__reserve(), but I=E2=80=99ll try to debug it more today=
 and =

>>> to
>>> understand the APIs better.

