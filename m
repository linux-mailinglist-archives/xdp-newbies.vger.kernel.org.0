Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F456167588
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Feb 2020 09:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbgBUI3I (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Feb 2020 03:29:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55980 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730626AbgBUI3H (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Feb 2020 03:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582273746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YWPCoMrq5XE9o2pJ3r3zt2FNlFa1j21CRkdb6oMC6Jo=;
        b=CJN0adH7QE60gx6KTJmW1c9ltC5eFIYqu/8bpQYu4oH5HxYwVjBzwPWYXFyYhDJnCCQCzM
        A1Oca3Q/5xCS/kkt0MvFYZFC9kpso3LNrlaclx07KWcT1uR0josg/JyQjzhnP9oZP0Lgh2
        nUbZuFYWue86CpjyKSZIaP8uznMkESw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-N7zcb0VwPiiaUziwgJ6meA-1; Fri, 21 Feb 2020 03:29:04 -0500
X-MC-Unique: N7zcb0VwPiiaUziwgJ6meA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3A93107ACC7;
        Fri, 21 Feb 2020 08:29:02 +0000 (UTC)
Received: from [10.36.117.6] (ovpn-117-6.ams2.redhat.com [10.36.117.6])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A3048B568;
        Fri, 21 Feb 2020 08:29:01 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "William Tu" <u9012063@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        "=?utf-8?b?QmrDtnJuIFTDtnBlbA==?=" <bjorn.topel@intel.com>
Subject: Re: xdpsock poll syscall CPU 100%
Date:   Fri, 21 Feb 2020 09:28:59 +0100
Message-ID: <28C7C59E-0ED6-4331-8547-952419F20D1F@redhat.com>
In-Reply-To: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
References: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; markup=markdown
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 20 Feb 2020, at 23:49, William Tu wrote:

> Hi,
>
> I'm trying to save some CPU cycles when there is no packet arrives.
> I enable the poll syscall option of xdpsock, by doing
>
> $ ./xdpsock -r -p -S -i ens16
>  sock0@ens160:0 rxdrop xdp-skb poll()
>                 pps         pkts        1.00
> rx              0           0
> tx              0           0
>
> Since there is no packet coming, I though by calling poll()
> system call, the xdpsock process will be blocked and CPU utilization
> should be way under 100%. However, I'm still seeing 100%
> CPU utilization. Am I understanding this correctly?

Hi William, I can remember I saw this in the past two with this code. It =

had something to do with the way xdpsock waits for the buffers to be =

free=E2=80=99 ed by the kernel. What I can remember it had something to d=
o =

with the veth interfaces also.

I do remember that I fixed it in the tutorial for AF_XDP: =

https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP=
/af_xdp_user.c

Maybe you can see if you have the same problem with this example.

//Eelco


> Thanks,
> William

