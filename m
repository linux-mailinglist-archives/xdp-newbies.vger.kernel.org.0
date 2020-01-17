Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA508141005
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 18:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgAQRlF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 12:41:05 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45014 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQRlF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 12:41:05 -0500
Received: by mail-qt1-f196.google.com with SMTP id w8so7959247qts.11
        for <xdp-newbies@vger.kernel.org>; Fri, 17 Jan 2020 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UwZumyJCr6vMc27QM/0eFVTbvcr/gbbMujTXOmyfyP4=;
        b=M2NVJqKw2Gej47p8hSTbKtn0krs6wzp00lpOn3xTTX5EKV0Db97Aabt8DctL0pGJoN
         XGcRd8vfGT6E8+SFPr/K63Nh1kNIOmrg/3u0c/U0j0dNM81GoaVvolZHV06FzB148n34
         tvY9luHIQrMWSkq770BWV1YhSNJnc0NiEqJtNs+AwMxAbSYCkgcRUb1om2XXS/fKBK35
         qWY2Umjd88J6fLuydzIGu/4SStAGRg5QFzLT64odD+RgMGTmf5KOA4UVJDaK+31IGs7/
         uK8dD9Gn4ZUOvqmVHBLg0J7A+x4fOFUqlu5sLiRBhnlWXTxC87E8X3o4WCqKe8bYDTNx
         5AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UwZumyJCr6vMc27QM/0eFVTbvcr/gbbMujTXOmyfyP4=;
        b=WiFcEER/IR2f2ejOZB6sL/vE+zUdMrRh6w8ga8eNGTKds9HIi2PUSxODw1jBOAp9d1
         K87weg77VGYqCK3CbIxvs/ECJ7pLiA+CutGXIHhRU0r3MII2+wT2g9JSaWRb+NIbVtM5
         xul6r3Nx7aG1LsmHD4raA0nfsvxgrqcLYkUcIx25m4mkyckKZ2ED5L8q1sLnKvc0Ru84
         aHu8/A3TNoqd2mZPKmR6f4DGiGrbpdjcqlvjdiW5kDsUhvm9jDgyPoOaj/ta/F5HQ1Xn
         Rtsq0r8/PNO7AqjycfAxaqxhJOZITJjCwoE5CXjpDbKsfqhaxQzrv0ZD/pZ3GjNUEBMV
         CxJw==
X-Gm-Message-State: APjAAAUnyCLbT0tOUHBCUaEPI+1f2A1ErwZKIqOVyBcLR9vuJr0iNFCn
        xRtPgtZnmeMjJC30Q0d0eRGGVjHjMYLs2NfgUYI=
X-Google-Smtp-Source: APXvYqzvrOXUZDjpVBq1MgTNG2x0hhkKmJW68WdAwb8p2szRp8GsvFO5dao8RQwvArzUNzKso5YxPVMDNeGyLtUWZTI=
X-Received: by 2002:ac8:1bd4:: with SMTP id m20mr8778676qtk.301.1579282864078;
 Fri, 17 Jan 2020 09:41:04 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu> <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu>
In-Reply-To: <20200114205250.GA85903@smtp.ads.isi.edu>
From:   William Tu <u9012063@gmail.com>
Date:   Fri, 17 Jan 2020 09:40:27 -0800
Message-ID: <CALDO+SZZdA+te293-kjF_dSUo79D_Wn3Lv2ureB4SKUYVPFF+g@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jan 14, 2020 at 12:53 PM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
>
> On Tue, Jan 14, 2020 at 10:59:19AM +0100, Magnus Karlsson wrote:
> >
> > Just sent out a patch on the mailing list. Would be great if you could
> > try it out.
>
> Thanks for the quick turnaround. I gave this patch a go, both in the bpf-next
> tree and manually applied to the 5.5.0-rc3 branch I've been working with up to
> this point. It does allow for allocating more memory, however packet
> forwarding no longer works. I did not see any complaints from dmesg, but here
> is an example iperf3 session from a client that worked before.
>
> ry@xd2:~$ iperf3 -c 10.1.0.2
> Connecting to host 10.1.0.2, port 5201
> [  5] local 10.1.0.1 port 53304 connected to 10.1.0.2 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec  5.91 MBytes  49.5 Mbits/sec    2   1.41 KBytes
> [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> ^C[  5]  10.00-139.77 sec  0.00 Bytes  0.00 bits/sec    4   1.41 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-139.77 sec  5.91 MBytes   355 Kbits/sec    9             sender
> [  5]   0.00-139.77 sec  0.00 Bytes  0.00 bits/sec                  receiver
> iperf3: interrupt - the client has terminated
>
> I'll continue to investigate and report back with anything that I find.
>
Hi Ryan,

Not sure if this is the same, but we hit something similar in OVS
AF_XDP's implementation.
In our case, it happens when using native-mode, not the driver
zero-copy mode, and
iperf works a couple seconds then down to zero. FYI:
https://mail.openvswitch.org/pipermail/ovs-dev/2019-November/365076.html
and fixes
https://github.com/openvswitch/ovs/commit/161773c72a33a86a23d4892e3c7448cee9946317

Regards,
William
