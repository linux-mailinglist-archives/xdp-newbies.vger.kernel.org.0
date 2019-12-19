Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85AF4126076
	for <lists+xdp-newbies@lfdr.de>; Thu, 19 Dec 2019 12:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfLSLHD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 19 Dec 2019 06:07:03 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44879 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726701AbfLSLHD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 19 Dec 2019 06:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576753621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HMAsAMp0jRLhLgJ/PuI/xVdZndqWzzNp5YhE5mTtj84=;
        b=cdpQkoIIboekwvE96Ao+2cHs1yS1N3OR+EjNBxyCXPzfsYqYHBh1T3owFMQmtQquBCYo3h
        JbRPLlo/q/DtSKCURG+qErYIdsRA/Uo8gNLClf2c7JPGjRt51NEU9umSJZK+Ffv8t52fY/
        8yXafBK2T782rghoD96xKadwqOAjXfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-uFuyKEurPwiQAi9DCsczvw-1; Thu, 19 Dec 2019 06:06:54 -0500
X-MC-Unique: uFuyKEurPwiQAi9DCsczvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94BA91883521;
        Thu, 19 Dec 2019 11:06:53 +0000 (UTC)
Received: from [10.36.116.227] (ovpn-116-227.ams2.redhat.com [10.36.116.227])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E4321A7E3;
        Thu, 19 Dec 2019 11:06:52 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Cc:     "Y Song" <ys114321@gmail.com>, "Yonghong Song" <yhs@fb.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Subject: Re: Trying the bpf trace a bpf xdp program
Date:   Thu, 19 Dec 2019 12:06:50 +0100
Message-ID: <B2161C36-B1A9-41B8-9D93-A18869649E25@redhat.com>
In-Reply-To: <CAADnVQ+DHuDS2xZbjsEfBYX5t761dbCih6p-=NaCNU9OJEMk8A@mail.gmail.com>
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
 <F8CFD537-7907-4259-9C91-4649F799216B@redhat.com>
 <CAH3MdRXr+3mUfrd8MPH-mDdNwD1szXRhz07s2C4dVQ0EkzDaAg@mail.gmail.com>
 <78D7857B-82E4-42BC-85E1-E3D7C97BF840@redhat.com>
 <CAADnVQ+DHuDS2xZbjsEfBYX5t761dbCih6p-=NaCNU9OJEMk8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 7 Dec 2019, at 17:51, Alexei Starovoitov wrote:

> On Fri, Dec 6, 2019 at 5:05 AM Eelco Chaudron <echaudro@redhat.com> wro=
te:
>>
>> Thanks the hint that it should be the jitted arguments solved it=E2=80=
=A6 And
>> you quick example worked, just in case some one else is playing with i=
t,
>> here is my working example:
>>
<SNIP>

> This is great. Could you submit it as selftests/bpf ?

Good idea, sent a patch out...

> It will help others trying to do the same.
> May be instead of bpf_debug() use global variables so the test will be
> self checking ?
>
> Long term we should teach verifier to understand 'struct xdp_md*'
> in addition to 'struct xdp_buff *'. That will help ease of use.

