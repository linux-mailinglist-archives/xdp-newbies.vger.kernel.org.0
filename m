Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB8CF167952
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Feb 2020 10:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgBUJX4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Feb 2020 04:23:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35110 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726244AbgBUJX4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Feb 2020 04:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582277034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2rhoNnc3jOFBITBZDlvscekWU+6LRd+LygplTMVh4Ns=;
        b=Xn+wsgRUqIJlnVHEYPhIVBxldXn4aY3F9Ng6vIj4/9kfKk0AG0VPyc1ICBTmUyCl8IbkRC
        9IM4boWLvURCPfLxKqcojGFjADwdeKpTnz+LKNRHPFmKDUKT6JH2MQAoZvEDszrSbZ/ng6
        aHUaSRwO28ZD2kQC5QoWhyq5+qrdKRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-kCfNMWdfPlaGuNIt6m2aCA-1; Fri, 21 Feb 2020 04:23:51 -0500
X-MC-Unique: kCfNMWdfPlaGuNIt6m2aCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E6401005F89;
        Fri, 21 Feb 2020 09:23:49 +0000 (UTC)
Received: from [10.36.117.6] (ovpn-117-6.ams2.redhat.com [10.36.117.6])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 77CE28B57D;
        Fri, 21 Feb 2020 09:23:48 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Magnus Karlsson" <magnus.karlsson@gmail.com>
Cc:     "William Tu" <u9012063@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        "=?utf-8?b?QmrDtnJuIFTDtnBlbA==?=" <bjorn.topel@intel.com>
Subject: Re: xdpsock poll syscall CPU 100%
Date:   Fri, 21 Feb 2020 10:23:46 +0100
Message-ID: <95ABE3EC-8398-4928-B42B-086DE58CD8A2@redhat.com>
In-Reply-To: <CAJ8uoz3cGwP4xsCxxv=pvqP3hJw9LBL1u=Jivba2xRBTs6vmgA@mail.gmail.com>
References: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
 <28C7C59E-0ED6-4331-8547-952419F20D1F@redhat.com>
 <CAJ8uoz3t6mKVr+aHx_WDkPg66_wTSsMNySzWny9JhCR1VG7mBA@mail.gmail.com>
 <FA00F7E2-E4E2-413B-9CC0-93AB2BA861A2@redhat.com>
 <CAJ8uoz3cGwP4xsCxxv=pvqP3hJw9LBL1u=Jivba2xRBTs6vmgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 21 Feb 2020, at 9:46, Magnus Karlsson wrote:

> On Fri, Feb 21, 2020 at 9:40 AM Eelco Chaudron <echaudro@redhat.com> =

> wrote:
>>
>>
>>
>> On 21 Feb 2020, at 9:33, Magnus Karlsson wrote:
>>
>>> On Fri, Feb 21, 2020 at 9:30 AM Eelco Chaudron <echaudro@redhat.com>
>>> wrote:
>>>>
>>>>
>>>>
>>>> On 20 Feb 2020, at 23:49, William Tu wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> I'm trying to save some CPU cycles when there is no packet =

>>>>> arrives.
>>>>> I enable the poll syscall option of xdpsock, by doing
>>>>>
>>>>> $ ./xdpsock -r -p -S -i ens16
>>>>>  sock0@ens160:0 rxdrop xdp-skb poll()
>>>>>                 pps         pkts        1.00
>>>>> rx              0           0
>>>>> tx              0           0
>>>>>
>>>>> Since there is no packet coming, I though by calling poll()
>>>>> system call, the xdpsock process will be blocked and CPU =

>>>>> utilization
>>>>> should be way under 100%. However, I'm still seeing 100%
>>>>> CPU utilization. Am I understanding this correctly?
>>>>
>>>> Hi William, I can remember I saw this in the past two with this =

>>>> code.
>>>> It
>>>> had something to do with the way xdpsock waits for the buffers to =

>>>> be
>>>> free=E2=80=99 ed by the kernel. What I can remember it had something=
 to =

>>>> do
>>>> with the veth interfaces also.
>>>>
>>>> I do remember that I fixed it in the tutorial for AF_XDP:
>>>> https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-A=
F_XDP/af_xdp_user.c
>>>
>>> Eelco,
>>>
>>> Do you remember exactly what you had to fix in the xdpsock sample?
>>> Your tutorial is quite a rewrite so it is hard for me to tell =

>>> exactly
>>> which of all the changes that fix this problem. The reason I ask is
>>> that it would be nice to fix this in the sample too.
>>>
>>> Thanks: Magnus
>>
>>  From an earlier email conversation we had this is where it looped in =

>> my
>> case:
>
> Thanks Eelco. Yes, the xdpsock sample is too simplistic in this case.
> I will put this on my backlog to fix so that we do not have this
> problem in the future. I might take some inspiration from your code
> :-). Hope you do not mind.

Its GPL so take whatever you need ;)

