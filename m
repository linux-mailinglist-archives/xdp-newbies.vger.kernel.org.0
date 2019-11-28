Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1A810CEC2
	for <lists+xdp-newbies@lfdr.de>; Thu, 28 Nov 2019 20:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1TQf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 28 Nov 2019 14:16:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36058 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726401AbfK1TQf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 28 Nov 2019 14:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574968593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6DWoBVaiI5V5pkq+LJIad6DnwAO4NNl8bE5nDOosBSw=;
        b=SIz0rI2sD6mLNvvRUemhs8jSBUWqsdmbyvGR6FR6Q2qzcatVEIrX5K0vcL++rKYJTqR/2a
        q8S7FKZeEWont9yBJu8608dj7U8lVMWhPODBmuvheZ16UR7pibYhD6NGa4Xje4Ovvack/A
        CN4EXAQ+IKkHBS7D1RQ5YHVqmluwacc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-5AYeM0B-NES2wi46EDXCPA-1; Thu, 28 Nov 2019 14:16:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FD58DB20;
        Thu, 28 Nov 2019 19:16:31 +0000 (UTC)
Received: from [10.36.116.231] (ovpn-116-231.ams2.redhat.com [10.36.116.231])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 982055D6D0;
        Thu, 28 Nov 2019 19:16:30 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Subject: Re: Trying the bpf trace a bpf xdp program
Date:   Thu, 28 Nov 2019 20:16:28 +0100
Message-ID: <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com>
In-Reply-To: <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 5AYeM0B-NES2wi46EDXCPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"; format=flowed; markup=markdown
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 28 Nov 2019, at 19:18, Alexei Starovoitov wrote:

> On Thu, Nov 28, 2019 at 9:20 AM Eelco Chaudron <echaudro@redhat.com>=20
> wrote:
>>
>> Trying out the BPF trace to trace a BPF program, but I=E2=80=99m already
>> getting stuck loading the object with the fexit  :(
>
> I can take a look after holidays.

Enjoy the Holidays!! I figured out my auto kernel install script failed=20
whiteout me noticing, and I was running an old kernel :(

I will try tomorrow with the correct kernel=E2=80=A6


>> libbpf: load bpf program failed: Argument list too long
>> libbpf: failed to load program 'fexit/xdp_prog_simple'
>> libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
>> ERROR: Failed to load object file: Operation not permitted
>
> please add -vvv and share full output.

