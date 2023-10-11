Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92EE07C499C
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Oct 2023 08:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343606AbjJKGFU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 11 Oct 2023 02:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344306AbjJKGFS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 11 Oct 2023 02:05:18 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4C79D
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Oct 2023 23:05:14 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7b92cd0ccso23051477b3.1
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Oct 2023 23:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697004313; x=1697609113; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M0HvaKcs2vjvYzYuKT7T47oddy6m405K/YePmgF4N0I=;
        b=Tx5hNFzVvZnhFIgNZe2F/06eadfMXamnke/7fmvt1yrEGc+/8Q4pyB1uZ3ljpJXm6N
         SONwCAoxMxHBoJH13MCYjvlOhjcK1WgFryi76XZVErDlcgEpf+otObRkru2/0yv4fA5R
         MjT8E1YFjIHUnpnjwtzJq6vWqGCMivuzY1VaSRZMj+AKHXHPoDjdSrRMoWLLlRG7psnJ
         O2S2HxbRBccjuXrOGD59qcooQw8qJf9Jb7yT64TvonagSlatyeLePpMYCozXfq9VkmNF
         Aq0wJbqIgLGg/s9gdWHxESW0LTCTmMpwHN41qjVRCDVCkBtM2xeMIJZ84eLR1jtPJWlb
         mR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697004313; x=1697609113;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0HvaKcs2vjvYzYuKT7T47oddy6m405K/YePmgF4N0I=;
        b=OnC7AB/rSeGybT42oCRbH/Yzp+f+Zyb1knYkRX7Qwo8t1b1waF8u7t7i4z+1dHgBwY
         CD5sX8Lu823DBxSjWFWccvfrevO7duPFIm4caBFi1qgfpMzDYh3TvrlDanPa1Gyxl50k
         sMJ/x/d4n5BiccbbuoDsfm6iEfsu97ag+18VTOW5XLENC6a9tDC9YDAzaPFxRgT92ITx
         sJHv4u7mbmq47mQ5J+rXBgLgwubr+VqZ4BmfCvMFahi0nvt4T0FicG+Lk4JY/OQLIl9W
         ftl7c5BBZNK8vKiA1lw5SAzVyg42sA1H52oKAvfJhq1WCHofySeGwQ5EXkVTOA/AgNB/
         /vCQ==
X-Gm-Message-State: AOJu0YwJYOCl97II/DFjsI106ZZbibO6zDoqyGKzj1F9snNYiHeF89Hl
        ONCMuOBV9F/lg3xFjnhmKELIJfBK2CuEAvfm5y3uIowKF4o=
X-Google-Smtp-Source: AGHT+IFu4Bvn2DQnJz/T+5JTUEfjFcFwZjD8joXDKhHH2pCoV+S1BPs6RO0b7q786n3kWscWrpFtsoXcFuw3wWr0+VY=
X-Received: by 2002:a25:8d90:0:b0:d85:38:4577 with SMTP id o16-20020a258d90000000b00d8500384577mr16764476ybl.19.1697004312353;
 Tue, 10 Oct 2023 23:05:12 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Wed, 11 Oct 2023 11:34:37 +0530
Message-ID: <CANzUK5-9PCbE-brUL+xbRnJr+8ZaUJDCLVAJmxO=gnkR3MxBQg@mail.gmail.com>
Subject: ixgbe: xdpsock txonly hangs and does not complete
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

While debugging a TX problem with my AF_XDP app it seems that there
might be a bug in the ixgbe driver (see thread:
https://www.spinics.net/lists/xdp-newbies/msg02406.html)

So I decided to try xdpsock txonly and I see a similar behaviour as my
app with xdpsock as well.

Essentially, after sending 'n' packets on Tx ring, the app (or xdpsock
for that matter) expects to free 'n' packets from the completion ring,
but it either gets less or sometimes more packets/descriptors from the
completion ring.

Please see the log below.

<log>
root@tditwtga002:~# ./xdpsock -t -i eno49

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 7,388,073      7,390,400

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,689,548      17,082,880

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,660,591      26,745,152

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,690,513      36,437,184

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,684,898      46,123,840

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,688,898      55,815,168

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,654,194      65,471,488

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,681,793      75,154,880

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,664,164      84,821,376

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,681,688      94,504,768

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,637,019      104,143,552

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 9,684,780      113,830,720
^Coutstanding 2466 (-64)
outstanding 2402 (-64)
outstanding 2338 (-64)
outstanding 2274 (-64)
outstanding 2210 (-64)
outstanding 2146 (-64)
outstanding 2082 (-64)
outstanding 2020 (-62)
outstanding 1956 (-64)
outstanding 1892 (-64)
outstanding 1828 (-64)
outstanding 1764 (-64)
outstanding 1700 (-64)
outstanding 1636 (-64)
outstanding 1572 (-64)
outstanding 1510 (-62)
outstanding 1446 (-64)
outstanding 1382 (-64)
outstanding 1318 (-64)
outstanding 1254 (-64)
outstanding 1190 (-64)
outstanding 1126 (-64)
outstanding 1062 (-64)
outstanding 1000 (-62)
outstanding 936 (-64)
outstanding 872 (-64)
outstanding 808 (-64)
outstanding 744 (-64)
outstanding 680 (-64)
outstanding 616 (-64)
outstanding 552 (-64)
outstanding 490 (-62)
outstanding 426 (-64)
outstanding 362 (-64)
outstanding 298 (-64)
outstanding 234 (-64)
outstanding 170 (-64)
outstanding 106 (-64)
outstanding 42 (-64)
outstanding 1 (-41)

 sock0@eno49:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 5,625,834      119,457,536

^C

^C

^C
^[[A^H^H^H^H^C
^C
^C
^C^Z
[1]+  Stopped                 ./xdpsock -t -i eno49
root@tditwtga002:~#
</log>

As you can see, the code gets into a infinite loop waiting for 1
descriptor which never appears on the completion ring.

Note that I added the code to print the outstanding count and also
call complete_tx_only_all() in case of Ctrl-C also and not just when
number of packets were specified. Here's the exact diff (the sample
code was taken from 5.15 Linux kernel tree) -

<diff>
--- xdpsock_user.c.orig 2023-10-11 11:20:47.553580604 +0530
+++ xdpsock_user.c      2023-10-07 12:18:33.849399960 +0530
@@ -1174,7 +1174,7 @@ static inline void complete_tx_l2fwd(str
 }

 static inline void complete_tx_only(struct xsk_socket_info *xsk,
-                                   int batch_size)
+                                   int batch_size, bool print)
 {
        unsigned int rcvd;
        u32 idx;
@@ -1191,6 +1191,9 @@ static inline void complete_tx_only(stru
        if (rcvd > 0) {
                xsk_ring_cons__release(&xsk->umem->cq, rcvd);
                xsk->outstanding_tx -= rcvd;
+                if (print)
+                    fprintf(stderr, "outstanding %u (-%02u) \n",
+                            xsk->outstanding_tx, rcvd);
        }
 }

@@ -1271,7 +1274,7 @@ static void tx_only(struct xsk_socket_in

        while (xsk_ring_prod__reserve(&xsk->tx, batch_size, &idx) <
                                      batch_size) {
-               complete_tx_only(xsk, batch_size);
+               complete_tx_only(xsk, batch_size, false);
                if (benchmark_done)
                        return;
        }
@@ -1288,7 +1291,7 @@ static void tx_only(struct xsk_socket_in
        xsk->outstanding_tx += batch_size;
        *frame_nb += batch_size;
        *frame_nb %= NUM_FRAMES;
-       complete_tx_only(xsk, batch_size);
+       complete_tx_only(xsk, batch_size, false);
 }

 static inline int get_batch_size(int pkt_cnt)
@@ -1311,7 +1314,7 @@ static void complete_tx_only_all(void)
                pending = false;
                for (i = 0; i < num_socks; i++) {
                        if (xsks[i]->outstanding_tx) {
-                               complete_tx_only(xsks[i], opt_batch_size);
+                               complete_tx_only(xsks[i], opt_batch_size, true);
                                pending = !!xsks[i]->outstanding_tx;
                        }
                }
@@ -1353,7 +1356,9 @@ static void tx_only_all(void)
                        break;
        }

+#if 0
        if (opt_pkt_count)
+#endif
                complete_tx_only_all();
 }
</diff>

Distro/Kernel:
Ubuntu 22.04.3 LTS (GNU/Linux 5.15.0-86-generic x86_64)

Driver:
# ethtool -i eno49
driver: ixgbe
version: 5.19.6
firmware-version: 0x80000887, 1.2688.0
expansion-rom-version:
bus-info: 0000:04:00.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes

I would be grateful if someone can try the same and let me know if
they see a similar behaviour.

Thanks in advance,
Srivats
