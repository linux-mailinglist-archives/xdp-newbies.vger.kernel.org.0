Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F72E58DA9F
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Aug 2022 16:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244645AbiHIO6N (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Aug 2022 10:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244597AbiHIO6M (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 9 Aug 2022 10:58:12 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B50A15A2D
        for <xdp-newbies@vger.kernel.org>; Tue,  9 Aug 2022 07:58:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id m2so11581942pls.4
        for <xdp-newbies@vger.kernel.org>; Tue, 09 Aug 2022 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=42B4x2elCZ8Uas/oVdfBmGMPVWvnI9PKFOO2lV9RERw=;
        b=O+Sk1efNyuOS/uogFeoVVXQl1FkQWp8NDG7AnHzoFBwdR/ynGphxKAOMmi3j1S8gzy
         GaA5ACqBmnFqlDSz8GIC+Yp3z6+lrb9VqRvx4YLixlaHmZXzJ02IBRe4IuPi+TUKCnRN
         6WJf+GddqFqQx5A9owTtcQbww/Hgh6u74cidfQkfosB3W4z3y584PTHJdhhGwVdsH3J9
         xOe1hftsXMGgKdGybCdnEgSGbUovtfkdqtVdSHn+gc+0qKxzEKCUyZQ7vPzt8k+nqLDN
         cVhjlseaaYmdBN9X65GLFJBZu6CY/Q1PNjBfeItemuUEmObt4VIVIQqmd5UsFVwBtxIH
         MVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=42B4x2elCZ8Uas/oVdfBmGMPVWvnI9PKFOO2lV9RERw=;
        b=7qHbAC0A9Tq7USYwxFX19yNj96g8mnFOhtuSUrlRbYpXQFFYweEhKm+SPemrIpMBy2
         hkpFIfKcWOdtk1NRiqTwV6MBbReFFXqkB5+DASnOWYuYd2IOx31qC+ZDPsQhJlvpTNru
         GwV7ZRGomeynU870KqQOxMVeoIZK1BAt9W43IgXj3l16XcNrHi+/Rarsx/kIbwtZdBec
         CZCe5XBGyozzalbPXCq5IDP42rAgAtU5owwfG/xJd4uhuEqq+FYt2elcaltdpW7aYtLF
         huRJ6eB29TUsLRT3on+GZXz4HAfCmTHtHk8t3xm/kNhpJnljgvC21T8U0hiSRKwJpOYS
         416g==
X-Gm-Message-State: ACgBeo3H/KWAs2kRL7Obx7/qvGpP1UkpuuKWkRUGtVfcyrkuzboQXo02
        iBYkfGYBnzuR1X5TVXkJUs74yO+LunmCMp+EFvlWF0r6CHRADIy9
X-Google-Smtp-Source: AA6agR6ExH/Kcx+RcdZl3HkQ5/8AX6+MOhYsqneaDphPU7kzTv/S95a3lSUoWrZjpnPtNc3Q8O1JW+qCPo3pWP6L+Go=
X-Received: by 2002:a17:902:9f87:b0:170:c7fc:388c with SMTP id
 g7-20020a1709029f8700b00170c7fc388cmr7577246plq.168.1660057090827; Tue, 09
 Aug 2022 07:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <6205E10C-292E-4995-9D10-409649354226@outlook.com>
 <CAJ8uoz0a_q8T99=rHny2L+wVUgCd0jNYQd1f=LLd-2WncrAiuw@mail.gmail.com> <CB1ACD33-ED8B-44FC-956A-36662D54D0B8@outlook.com>
In-Reply-To: <CB1ACD33-ED8B-44FC-956A-36662D54D0B8@outlook.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 9 Aug 2022 16:58:00 +0200
Message-ID: <CAJ8uoz3-vC7RCU3gG=CWTT6=z_r21G8ujo9eGFzfiVa0EPfMeA@mail.gmail.com>
Subject: Re: XSK + ZC, shared UMEM and multiple Fill/Completion queues - broken?
To:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Aug 9, 2022 at 4:50 PM Alasdair McWilliam
<alasdair.mcwilliam@outlook.com> wrote:
>
> Hi Magus,
>
> We=E2=80=99ve actually reported it via our hardware vendor team as well. =
You might find my name=E2=80=99s on the other end of that bug report!
>
> The repo went live this morning so I just posted it here for further visi=
bility/review really. If we can help in any way, hit me up!

I can reach it thanks. Could you please send me the command line you
use to trigger the problem so I can try out exactly that on my system?
And I guess it is the "multi FCQ" build that breaks.

> Many thanks
> Alasdair
>
>
> > On 9 Aug 2022, at 15:43, Magnus Karlsson <magnus.karlsson@gmail.com> wr=
ote:
> >
> > On Tue, Aug 9, 2022 at 4:27 PM Alasdair McWilliam
> > <alasdair.mcwilliam@outlook.com> wrote:
> >>
> >> Hi list. This is my first post so be gentle. :-)
> >>
> >> I=E2=80=99m developing a piece of software that uses XSK in zero copy =
mode so we can pick up packets fast, do some work on them, then either tran=
smit them back to a network or drop them. For the sake of this mail, we can=
 say this involves pulling all traffic up into user-space via XSK.
> >>
> >> The software sits directly on top of libbpf/libxdp, it does not use hi=
gher level abstractions.
> >>
> >> Our current setup uses a multi-threaded user-space process. The proces=
s queries the system for the number of channels on a NIC (num_channels) and=
 allocates enough UMEM to accommodate (num_channels * num_frames * frame_si=
ze). The umem is divided into a number of buckets before it loads its eBPF =
program into the kernel and creates its worker threads.
> >>
> >> There are an equal number of threads to channels, and each thread rece=
ives a number of umem buckets as well as its own AF_XDP socket to work on. =
Structurally, each XSK has its own umem FQ/CQ as well as TXQ/RXQ by virtue =
of the xsk_socket__create_shared() API, and RSS facilitates a nice distribu=
tion of packets over each NIC channel and worker thread.
> >>
> >> We=E2=80=99ve had a lot of success scaling across multi-core servers w=
ith Intel E800 cards, with synthetic tests getting up to 20-30Mpps data rat=
es. Over the last few months we=E2=80=99ve also inserted the software into =
a production network for test runs with customer workloads, whereby the sof=
tware is forwarding gigabits of legitimate traffic across an array of diffe=
rent workloads, with no impact to the U/X of customer traffic flows. Ultima=
tely, to date, we've been quite confident as to the mechanics of the packet=
 forwarding pipeline implemented with XSK.
> >>
> >> But we=E2=80=99ve hit a snag. Everything=E2=80=99s worked great up to =
Linux 5.15, and from 5.16 onwards, it=E2=80=99s quite broken. If I could su=
mmarise the behaviour of this on kernel 5.16 onwards, I would say the main =
issues are:
> >>
> >> * Channel 0 receives traffic but channel 1+ may not. (In this case, ch=
annel 0 tends to receive the right amount of traffic, e.g. 4 channels with =
RSS means channel 0 sees 1/4th the total ingress).
> >>
> >> * Channels can stall. Superficially it looks like they only process fr=
ames up to the number of descriptors initially pushed onto the FQ, and then=
 stops.
> >>
> >> * eBPF programs running for frames via channel 0 work as expected. Tha=
t is, if one is parsing layer 3 and 4 headers to identify certain traffic t=
ypes, headers are where you would expect them to be in memory. However, thi=
s isn=E2=80=99t true for frames via channel 1+; headers don=E2=80=99t seem =
to be at the right position relative to the data pointer in the eBPF progra=
m. It could be there=E2=80=99s actually nothing in the descriptor, but this=
 is experienced by the software as parser errors, because we can=E2=80=99t =
decode the IP frames properly.
> >>
> >> We=E2=80=99ve been debugging this for some time and concluded the best=
 way was to take our software out the equation, and use xdpsock from the ke=
rnel tree. In doing so, we realised that while xdpsock does test shared ume=
m, it=E2=80=99s still a single thread, and maintains a single FQ/CQ despite=
 opening 8x XSK sockets.
> >>
> >> To move forward and validate with multiple FQ/CQ via the xsk_socket__c=
reate_shared() API, we=E2=80=99ve tweaked the xdpsock app to scale out umem=
 allocation by num_channels, then split it into num_channels regions (by vi=
rtue of an offset), open multiple XSK sockets bound to num_channels NIC cha=
nnels, insert the XSK FD=E2=80=99s into an XSK map indexed by channel numbe=
r, and tweak xdpsock_kern to lookup rx_channel for redirect, vs. the RR app=
roach in the original sample. And, on the whole, surprisingly, we *think* w=
e can reproduce the issues.
> >>
> >> We need to be a bit more scientific about our testing but I wanted to =
know if anyone else has had odd behaviour/experiences with XSK using shared=
 umem, with multiple fill/completion queues, on kernel 5.16 and above?
> >>
> >> We were under the impression that multi-FQ/CQ is a supported configura=
tion - it worked perfectly in 5.15. Is this something that is actually goin=
g away, and we need to re-think our approach?
> >
> > It is not supposed to go away ever, so this is most likely a bug.
> > Thank you for reporting it and posting a program I can use to
> > reproduce it. I will get back when I have reproduced it, or failed to.
> > But let us hope it is the former.
> >
> > BTW, there is one more person/company that has reported a similar
> > issue as you are stating, so it is likely real. But in that case, we
> > were not able to reproduce it on our end.
> >
> > /Magnus
> >
> >> In all test cases we=E2=80=99ve been on x86_64 (Xeon E5=E2=80=99s or X=
eon Platinum), on E810 or MLX Connect-X 4 cards. Tested on a range of diffe=
rent kernels, up to 5.19-rc4. In all cases we=E2=80=99re using aligned memo=
ry mode and the L2fwd behaviour of xdpsock.
> >>
> >> In tracing back kernel commits we have actually found where the proble=
ms start to occur. ICE breaks from commit 57f7f8b6bc0bc80d94443f94fe5f21f26=
6499a2b ("ice: Use xdp_buf instead of rx_buf for xsk zero-copy=E2=80=9D) [1=
], and testing suggests MLX5 is broken from commit 94033cd8e73b8632bab7c8b7=
bb54caa4f5616db7 ("xsk: Optimize for aligned case=E2=80=9D) [2]. I apprecia=
te MLX5 don=E2=80=99t support XSK Z/C + RSS, but there are ways we can test=
 multiple queues with some flow steering, and we see the same behaviour.
> >>
> >> We=E2=80=99ve actually just published our modified xdpsock code at our=
 open source repository [3] because we noticed the xdpsock code got removed=
 from the tree a while ago. Our modifications are compile-time enabled/disa=
bled because we wanted to be explicit in where we=E2=80=99ve changed logic =
in xdpsock. But the repo is available for peer review to see if there=E2=80=
=99s issues in how we=E2=80=99ve approached testing the logic.
> >>
> >> Any and all feedback welcomed/appreciated - we=E2=80=99re a bit stumpe=
d!
> >>
> >> Thanks
> >> Alasdair
> >>
> >> [1] https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%=
2Fcommit%2F%3Fid%3D57f7f8b6bc0bc80d94443f94fe5f21f266499a2b&amp;data=3D05%7=
C01%7C%7C9bb4ea3f876a45048d6608da7a158e69%7C84df9e7fe9f640afb435aaaaaaaaaaa=
a%7C1%7C0%7C637956530246796785%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D=
ynHKVYAffY2K2bAm8cmbEFFF651eJ6cOlTvZLmI%2Fj7Y%3D&amp;reserved=3D0
> >>
> >> [2] https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%=
2Fcommit%2F%3Fid%3D94033cd8e73b8632bab7c8b7bb54caa4f5616db7&amp;data=3D05%7=
C01%7C%7C9bb4ea3f876a45048d6608da7a158e69%7C84df9e7fe9f640afb435aaaaaaaaaaa=
a%7C1%7C0%7C637956530246796785%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D=
8uFHROythMvWn0f4VzKQSPE310eE7r8guggJrRM%2FEKU%3D&amp;reserved=3D0
> >>
> >> [3] https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgithub.com%2FOpenSource-THG%2Fxdpsock-sample&amp;data=3D05%7C01%7C%7C9bb4=
ea3f876a45048d6608da7a158e69%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C6=
37956530246796785%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DfTezXtq4T0Cme=
xRuru%2FBZmMOyc5Eyym1ONdaIFi53Ac%3D&amp;reserved=3D0
>
