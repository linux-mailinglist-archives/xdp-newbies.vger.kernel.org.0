Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A25227FF8
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Jul 2020 14:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgGUMdz (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 21 Jul 2020 08:33:55 -0400
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164]:47566 "EHLO
        dispatch1-us1.ppe-hosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726904AbgGUMdy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 21 Jul 2020 08:33:54 -0400
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.50.137])
        by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id D385E20055;
        Tue, 21 Jul 2020 12:33:53 +0000 (UTC)
Received: from us4-mdac16-28.at1.mdlocal (unknown [10.110.49.210])
        by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id D28B66009B;
        Tue, 21 Jul 2020 12:33:53 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.49.107])
        by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 6681922004D;
        Tue, 21 Jul 2020 12:33:53 +0000 (UTC)
Received: from webmail.solarflare.com (uk.solarflare.com [193.34.186.16])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 2D7FB280073;
        Tue, 21 Jul 2020 12:33:53 +0000 (UTC)
Received: from [10.17.20.203] (10.17.20.203) by ukex01.SolarFlarecom.com
 (10.17.10.4) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 21 Jul
 2020 13:33:49 +0100
Subject: Re: IP fragmentation
To:     Alexander Petrovsky <askjuise@gmail.com>
CC:     <xdp-newbies@vger.kernel.org>
References: <CAH57y_Rxm9_eB5jyjJ2OryLd6HB6mXSG8s-MR3BWs-99PVNG0g@mail.gmail.com>
 <6de242a4-263a-bbde-7af4-68532904e4b3@solarflare.com>
 <CAH57y_T9_K0L_cGjBQ+2C9UuRtw28Nqjk1FUB+F+3=WJVVZaqg@mail.gmail.com>
From:   Edward Cree <ecree@solarflare.com>
Message-ID: <8b809ac6-9e12-527c-d39e-0bab9dc743e2@solarflare.com>
Date:   Tue, 21 Jul 2020 13:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAH57y_T9_K0L_cGjBQ+2C9UuRtw28Nqjk1FUB+F+3=WJVVZaqg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.17.20.203]
X-ClientProxiedBy: ocex03.SolarFlarecom.com (10.20.40.36) To
 ukex01.SolarFlarecom.com (10.17.10.4)
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.6.1012-25554.003
X-TM-AS-Result: No-7.494400-8.000000-10
X-TMASE-MatchedRID: 9zTThWtzImvmLzc6AOD8DfHkpkyUphL9Bha8voHItvs52X8YwVUEWz2j
        /N8mMgrkZVjyUGpX40tkqbtr29UAtPFRSoBCNktyfY+iJfFQBxcEa8g1x8eqF4DpStszePepfch
        1j1sC/Zp5ppC82zAKlu085wUDvKVH0XHdPjDglDqqNnzrkU+2mjQAl7cHmp8GEt/W/Pt5w8c+/G
        6N86d0S+LzNWBegCW2RYvisGWbbS+No+PRbWqfRDsAVzN+Ov/sd74X0Xo0NB5h52MfLGRAuo6te
        y9u8PN2y39sHH1nfDDr6ewAyxZtJg==
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.494400-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.6.1012-25554.003
X-MDID: 1595334833-szcG6nH602jQ
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 20/07/2020 15:47, Alexander Petrovsky wrote:
> Unfortunately, for UDP I can't pick some _random_ host in case the
> first _seen_ fragment it's not a First Fragment (frag_off=0, MF=1). In
> this case, I have to accumulate ALL fragments in map. And on each
> received fragment check, is all fragments are collected. I did it in
> my PoC with AF_XDP, but in PoC all seems unreliable.

That's why I say punt in that case (XDP_PASS and then have something
 else downstream of it to handle the slowpath.  However people did LB
 before XDP came along.  Idk, netfilter?  Does that have hooks post-
 reassembly?)
And probably when punting also record a map entry saying "we punted
 this IPID" so that when the First Frag shows up, the slowpath gets
 to see that one too and can do its reassembly.
So the map doesn't have to accumulate the fragments (the slowpath does
 that), just their offsets and lengths so XDP can tell when all frags
 have been passed to the slowpath and delete the map entry.

-ed
