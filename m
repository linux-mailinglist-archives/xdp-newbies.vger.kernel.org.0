Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D22A225E43
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Jul 2020 14:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgGTMRs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Jul 2020 08:17:48 -0400
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164]:47170 "EHLO
        dispatch1-us1.ppe-hosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728532AbgGTMRs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Jul 2020 08:17:48 -0400
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.50.144])
        by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 936962007E;
        Mon, 20 Jul 2020 12:17:47 +0000 (UTC)
Received: from us4-mdac16-34.at1.mdlocal (unknown [10.110.49.218])
        by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 91AD0800A4;
        Mon, 20 Jul 2020 12:17:47 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.50.7])
        by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 40E204004D;
        Mon, 20 Jul 2020 12:17:47 +0000 (UTC)
Received: from webmail.solarflare.com (uk.solarflare.com [193.34.186.16])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 0728E4C005E;
        Mon, 20 Jul 2020 12:17:47 +0000 (UTC)
Received: from [10.17.20.203] (10.17.20.203) by ukex01.SolarFlarecom.com
 (10.17.10.4) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Jul
 2020 13:17:43 +0100
Subject: Re: IP fragmentation
To:     Alexander Petrovsky <askjuise@gmail.com>,
        <xdp-newbies@vger.kernel.org>
References: <CAH57y_Rxm9_eB5jyjJ2OryLd6HB6mXSG8s-MR3BWs-99PVNG0g@mail.gmail.com>
From:   Edward Cree <ecree@solarflare.com>
Message-ID: <6de242a4-263a-bbde-7af4-68532904e4b3@solarflare.com>
Date:   Mon, 20 Jul 2020 13:17:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAH57y_Rxm9_eB5jyjJ2OryLd6HB6mXSG8s-MR3BWs-99PVNG0g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [10.17.20.203]
X-ClientProxiedBy: ocex03.SolarFlarecom.com (10.20.40.36) To
 ukex01.SolarFlarecom.com (10.17.10.4)
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.6.1012-25552.003
X-TM-AS-Result: No-11.692800-8.000000-10
X-TMASE-MatchedRID: fE0JoqABJp3mLzc6AOD8DfHkpkyUphL99teeW6UfkyB/Z0SyQdcmEIXv
        teZ/aS6RI+FSNhInfgjAESFkYglj35CYQuZ+UVWDyZHnIMmQ+DiWNdM5p1JdaVIwpPWB00V2eN+
        EUxkPvm/qji2RXtx5fxWsmMhlb+okUOp/60TQFCrFwO/GbRS/4EjCi9tfhPjQy5rJ0Rc+qSYNGh
        B+8uxdKPzyIS7ZPiHyaWUyYQqxTPg0eN59LpSSQW6HurDH4PpP1X0C/DlEJwdpsnGGIgWMmfXBz
        1mm0H5BJ+agEH9ftEa8zT1RN8NS5HwwxS/qCrledXu122+iJtowTuT0jxEjoLlmMfLNiukaBUUc
        EdE+uFE8MwCgiSCug/U8+ceFB7y2G7B2FtuHETtyd1lNXV/6fH2K69afcnwqqJg/l28qaR/rMCw
        60QqlSefOVcxjDhcwPcCXjNqUmkUgBwKKRHe+rw/7QEv5PR25UIdJ0YWWotPgGKRNiAASHn6FVU
        pioCgzoyqgulk9yGg=
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.692800-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.6.1012-25552.003
X-MDID: 1595247467-Jc2JmjHYqh92
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 20/07/2020 09:15, Alexander Petrovsky wrote:
> But, the main problem for us it's fragmented IP packets. Some times
> ago I tried to use for such packets AF_XDP, fast pass them into the
> user space, accumulate and after that pass back to the network, it was
> a PoC.
Not 100% sure this works because I haven't tried it, but as long as
 packets aren't being re-ordered, you can do it without needing to
 save the payload in a map.
All the map needs to store is (for each IPID being tracked) what host
 this connection goes to.
If you receive a First Fragment (frag_off=0, MF=1), you look up the
 tuple through the regular LB to pick a server, and record that host
 in the map entry for the IPID.
For any other fragment, you look up the IPID in the map to get the
 destination host, and if MF=0 you delete the map entry.
 (If the IPID wasn't found, either drop or punt to userspace.)
Then TX/REDIRECT the packet to the appropriate host.
You might want to add some kind of simple ageing to this so that map
 entries from interrupted/spurious fragment chains don't stick around
 and build up over time.

The problem comes when 'middle' fragments can either come after the
 last (MF=0) fragment (technically this can be handled by tracking
 the byte range seen for the IPID, and not deleting from the map
 until all bytes up to the frag_off+total_len of the last-frag have
 been seen), or worse, before the first fragment.  If the frag_off=0
 fragment isn't the first one received, then this doesn't work
 because you don't know at the time of receiving fragments what L4
 ports they belong to.  But I don't know how common that situation is
 and whether having it take the slow-path is acceptable.

HTH,
-ed
