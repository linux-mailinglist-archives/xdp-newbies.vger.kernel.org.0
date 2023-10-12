Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3800A7C734E
	for <lists+xdp-newbies@lfdr.de>; Thu, 12 Oct 2023 18:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347311AbjJLQnX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 12 Oct 2023 12:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344029AbjJLQnW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 12 Oct 2023 12:43:22 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FFFA9
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Oct 2023 09:43:21 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d9ac31cb021so1025503276.1
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Oct 2023 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697129000; x=1697733800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW+OF/LmLuo7QUhPOjsfxReXb9QDDYn/v+ZZIEDLDmA=;
        b=kLRjEdbklCNNiY/P8vDa0p4merQtX1fTkvrLmbZNDZf8WUAcomEPZTw+kfCuF3PCV0
         /JeNEfKDqUF2ZpcWhIryL8bvSZkLSSa4TTVMh6/nYfVyzsbpHG+O6sRiIsT3sP1VUiPx
         hGal+OlxTtPHsw22vTYynJx0qi+zLcz12h2pewq2gOILPL0ltGlI/Ce465wc33vSnj8b
         DZuuIcYcXLH0X+GCS9OuoM74iPMqjA02/C1lEU9Cdl6hLVmMnW7rbtehr5o2lBr7GIQE
         IVuJESNWQrOh3/2cPNtw95M9LUzMJmj1irNFihRYTWupzVglZXykgLvg0EGEQ2fnfK7l
         nDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697129000; x=1697733800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vW+OF/LmLuo7QUhPOjsfxReXb9QDDYn/v+ZZIEDLDmA=;
        b=KFsxo7lfCrVPRgfUyhwdh/leVKVLTAkrVVNtFiXel1DzgUN50n+kAOIOUBVwSuRJr9
         W4Ei36Vc7Pi6Wn5buUsOPEJq6TN3kwue78QjxC1HVvDPcLeeivexXF4/fDkK2FrJhpTr
         UUgerBToiCW/owy3qyxRZ5S+P8P4F1fzz7v0cghRYyFp/IdST6o4RFm0yXkCarUwGuVL
         SDmvDLAAoTDHMhZK8UtTrgH/GQ3LgaNPtKigL8FRY0nJFQzx5gl0yv2djiD9x9stUf1+
         y23JViDSvRQ+xn/02N5CBpPwqtKbVXcqY8Ai214vIurEnTKLM+YD9n+Hp6CdniIIK2eB
         ksJg==
X-Gm-Message-State: AOJu0Yz549tkJWyJigxJlHudXUVsXOKxlCu94+G3o96rnMbaNkidw55z
        9pufq3E9EBZZsGJ2R5KoNxSOL3GYD2NuVYLZK2Y=
X-Google-Smtp-Source: AGHT+IH5k9nW6IJ+85eBAhZErgOp0YPjCZ9/6+y/HwfECeiKLkskLet1HQJNum31/ZznE6bscK8R9Ss947I4kUoWfnU=
X-Received: by 2002:a25:508a:0:b0:d9a:ce05:37b with SMTP id
 e132-20020a25508a000000b00d9ace05037bmr2070704ybb.56.1697129000251; Thu, 12
 Oct 2023 09:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5-9PCbE-brUL+xbRnJr+8ZaUJDCLVAJmxO=gnkR3MxBQg@mail.gmail.com>
 <CAJ8uoz3g7Pw1rfRPsU8Z0QcvxK3_E7c6CJBa=c7tYvoZDyZr4g@mail.gmail.com>
In-Reply-To: <CAJ8uoz3g7Pw1rfRPsU8Z0QcvxK3_E7c6CJBa=c7tYvoZDyZr4g@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Thu, 12 Oct 2023 22:12:43 +0530
Message-ID: <CANzUK5_rqe6ND+3J9acEnZj-bbTFNzdA3zNsnHd0YgQKFSYEsQ@mail.gmail.com>
Subject: Re: ixgbe: xdpsock txonly hangs and does not complete
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Oct 11, 2023 at 1:56=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Wed, 11 Oct 2023 at 08:06, Srivats P <pstavirs@gmail.com> wrote:
> >
> > Hi,
> >
> > While debugging a TX problem with my AF_XDP app it seems that there
> > might be a bug in the ixgbe driver (see thread:
> > https://www.spinics.net/lists/xdp-newbies/msg02406.html)
> >
> > So I decided to try xdpsock txonly and I see a similar behaviour as my
> > app with xdpsock as well.
> >
> > Essentially, after sending 'n' packets on Tx ring, the app (or xdpsock
> > for that matter) expects to free 'n' packets from the completion ring,
> > but it either gets less or sometimes more packets/descriptors from the
> > completion ring.
> >
> > Please see the log below.
> >
> > <log>
> > root@tditwtga002:~# ./xdpsock -t -i eno49
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 7,388,073      7,390,400
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,689,548      17,082,880
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,660,591      26,745,152
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,690,513      36,437,184
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,684,898      46,123,840
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,688,898      55,815,168
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,654,194      65,471,488
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,681,793      75,154,880
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,664,164      84,821,376
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,681,688      94,504,768
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,637,019      104,143,552
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 9,684,780      113,830,720
> > ^Coutstanding 2466 (-64)
> > outstanding 2402 (-64)
> > outstanding 2338 (-64)
> > outstanding 2274 (-64)
> > outstanding 2210 (-64)
> > outstanding 2146 (-64)
> > outstanding 2082 (-64)
> > outstanding 2020 (-62)
> > outstanding 1956 (-64)
> > outstanding 1892 (-64)
> > outstanding 1828 (-64)
> > outstanding 1764 (-64)
> > outstanding 1700 (-64)
> > outstanding 1636 (-64)
> > outstanding 1572 (-64)
> > outstanding 1510 (-62)
> > outstanding 1446 (-64)
> > outstanding 1382 (-64)
> > outstanding 1318 (-64)
> > outstanding 1254 (-64)
> > outstanding 1190 (-64)
> > outstanding 1126 (-64)
> > outstanding 1062 (-64)
> > outstanding 1000 (-62)
> > outstanding 936 (-64)
> > outstanding 872 (-64)
> > outstanding 808 (-64)
> > outstanding 744 (-64)
> > outstanding 680 (-64)
> > outstanding 616 (-64)
> > outstanding 552 (-64)
> > outstanding 490 (-62)
> > outstanding 426 (-64)
> > outstanding 362 (-64)
> > outstanding 298 (-64)
> > outstanding 234 (-64)
> > outstanding 170 (-64)
> > outstanding 106 (-64)
> > outstanding 42 (-64)
> > outstanding 1 (-41)
> >
> >  sock0@eno49:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 5,625,834      119,457,536
> >
> > ^C
> >
> > ^C
> >
> > ^C
> > ^[[A^H^H^H^H^C
> > ^C
> > ^C
> > ^C^Z
> > [1]+  Stopped                 ./xdpsock -t -i eno49
> > root@tditwtga002:~#
> > </log>
> >
> > As you can see, the code gets into a infinite loop waiting for 1
> > descriptor which never appears on the completion ring.
> >
> > Note that I added the code to print the outstanding count and also
> > call complete_tx_only_all() in case of Ctrl-C also and not just when
> > number of packets were specified. Here's the exact diff (the sample
> > code was taken from 5.15 Linux kernel tree) -
> >
> > <diff>
> > --- xdpsock_user.c.orig 2023-10-11 11:20:47.553580604 +0530
> > +++ xdpsock_user.c      2023-10-07 12:18:33.849399960 +0530
> > @@ -1174,7 +1174,7 @@ static inline void complete_tx_l2fwd(str
> >  }
> >
> >  static inline void complete_tx_only(struct xsk_socket_info *xsk,
> > -                                   int batch_size)
> > +                                   int batch_size, bool print)
> >  {
> >         unsigned int rcvd;
> >         u32 idx;
> > @@ -1191,6 +1191,9 @@ static inline void complete_tx_only(stru
> >         if (rcvd > 0) {
> >                 xsk_ring_cons__release(&xsk->umem->cq, rcvd);
> >                 xsk->outstanding_tx -=3D rcvd;
> > +                if (print)
> > +                    fprintf(stderr, "outstanding %u (-%02u) \n",
> > +                            xsk->outstanding_tx, rcvd);
> >         }
> >  }
> >
> > @@ -1271,7 +1274,7 @@ static void tx_only(struct xsk_socket_in
> >
> >         while (xsk_ring_prod__reserve(&xsk->tx, batch_size, &idx) <
> >                                       batch_size) {
> > -               complete_tx_only(xsk, batch_size);
> > +               complete_tx_only(xsk, batch_size, false);
> >                 if (benchmark_done)
> >                         return;
> >         }
> > @@ -1288,7 +1291,7 @@ static void tx_only(struct xsk_socket_in
> >         xsk->outstanding_tx +=3D batch_size;
> >         *frame_nb +=3D batch_size;
> >         *frame_nb %=3D NUM_FRAMES;
> > -       complete_tx_only(xsk, batch_size);
> > +       complete_tx_only(xsk, batch_size, false);
> >  }
> >
> >  static inline int get_batch_size(int pkt_cnt)
> > @@ -1311,7 +1314,7 @@ static void complete_tx_only_all(void)
> >                 pending =3D false;
> >                 for (i =3D 0; i < num_socks; i++) {
> >                         if (xsks[i]->outstanding_tx) {
> > -                               complete_tx_only(xsks[i], opt_batch_siz=
e);
> > +                               complete_tx_only(xsks[i], opt_batch_siz=
e, true);
> >                                 pending =3D !!xsks[i]->outstanding_tx;
> >                         }
> >                 }
> > @@ -1353,7 +1356,9 @@ static void tx_only_all(void)
> >                         break;
> >         }
> >
> > +#if 0
> >         if (opt_pkt_count)
> > +#endif
> >                 complete_tx_only_all();
> >  }
> > </diff>
> >
> > Distro/Kernel:
> > Ubuntu 22.04.3 LTS (GNU/Linux 5.15.0-86-generic x86_64)
>
> Thanks for reporting. Could you please try with a bleeding edge kernel
> please and check if the problem is still there? 6.5 for example.

Unfortunately, I don't have an ixgbe NIC. The problem was reported by
my app's customer. They have rolled back to an older driver version
(that ships as part of the native Ubuntu 22.04 Linux Kernel). The
reason they had upgraded the driver was because with the native driver
they were running into the ixgbe limitation of not being able to
support more than 64 cores - which they have now resolved by disabling
hyper-threading). After disabling hyper threading and rolling back to
the native Ubuntu 22.04 ixgbe driver both xdpsock and our app is
working fine.

Srivats

>
> > Driver:
> > # ethtool -i eno49
> > driver: ixgbe
> > version: 5.19.6
> > firmware-version: 0x80000887, 1.2688.0
> > expansion-rom-version:
> > bus-info: 0000:04:00.0
> > supports-statistics: yes
> > supports-test: yes
> > supports-eeprom-access: yes
> > supports-register-dump: yes
> > supports-priv-flags: yes
> >
> > I would be grateful if someone can try the same and let me know if
> > they see a similar behaviour.
> >
> > Thanks in advance,
> > Srivats
