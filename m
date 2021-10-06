Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A514248E5
	for <lists+xdp-newbies@lfdr.de>; Wed,  6 Oct 2021 23:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239632AbhJFV1t (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 6 Oct 2021 17:27:49 -0400
Received: from telegrapho.inexo.com.br ([187.17.38.24]:51702 "EHLO
        telegrapho.inexo.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239618AbhJFV1s (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 6 Oct 2021 17:27:48 -0400
X-Greylist: delayed 416 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Oct 2021 17:27:48 EDT
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id A70A87ACDEA5; Wed,  6 Oct 2021 18:18:53 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br A70A87ACDEA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1633555133;
        bh=Gq76Gr8ETZISXYh8WUhOhkikz66GtxF90tLYd1CVXRI=;
        h=Date:From:To:Subject:From;
        b=bcn2XdOWJNPXIkRQ6h+SDnDZLTkhE5wrfigDuA9JWabPv45nPn3mGKy0jiFUZYbe6
         CKpuCLUBPibfNqaX/Pnjwcw1cBLLneORbash6xSrvaPt8tGoMlLPn5o1hwDz+kOzL/
         rPCD2nEmqkw9eQd55RiJjSUbSiKvGztEldvbuFujjKvK9Pq84ost/+sCgiro0xcPhg
         nYz6TabcoONGGynfSJntE7HVDsw2u6aaCVe5nqH0oIDSfw2PxajZsZlRFUmuNvvUxD
         UotSLP06uC3VQSYnT0XVER5ymBeaKjb/ROmwMdblk7i5aXwcH17YrAIo0bs3JHIWZj
         yscGBTOBM8PqQ==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.4
Received: from pulsar (unknown [187.17.38.38])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 716987ACDEA3
        for <xdp-newbies@vger.kernel.org>; Wed,  6 Oct 2021 18:18:50 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 716987ACDEA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1633555130;
        bh=Gq76Gr8ETZISXYh8WUhOhkikz66GtxF90tLYd1CVXRI=;
        h=Date:From:To:Subject:From;
        b=iF6ub+IJvuR2hM7GqK6b7iAqU7gyuaDgNijvRYWryFuBy4xrKh+m7zys8kTpxUi/t
         iMolhe7x+f8E8CWGQ2K/taniM7HoX3XVIoAs2pwHz6Scgr4PswXYHuoqBdRZ4z73tC
         OeyPtafPuG80VuGNbuTrSWQuQmHQEkcxdFo8MA4N5lqEnDahrAj2qmxJe50BnNPg9j
         y8nraEAaQSlwnNnIo+CwewQiX7nAafrVKDvrMIERQbkHppfvyr4lba66KxEQHYZbIe
         ee1aCK5upM4frOOLijUw/uTOXspnx/jnv96Aou0lvzeS+NC+QwXfCjvg+NZxQydR3b
         0aMGdhKQ5sdYA==
Date:   Wed, 6 Oct 2021 18:18:48 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     xdp-newbies@vger.kernel.org
Subject: xdp-cpumap-tc multi queue schema and traffic mirroring
Message-ID: <20211006181848.20300152@pulsar>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Hi All

Before I moved to XDP cpumap bandwidth control "philosophy" I used to snoop inside the htb classes (mainly the default one) mirroring traffic to a dummy interface then run tcpdump on that like:

	tc filter add dev eth0 parent 1: protocol all prio 0xffff \
	u32 match u32 0 0 flowid 1:$shp action mirred egress mirror dev dummy0

Then "tcpdump -npi dummy0" used to show me all that classid "1:$shp" was carrying.

Now, with the multi queue environment XDP creates, I can't make mirroring to work.
For instance: I need to see what is going on with HTB classid e:102, so I tried:
	
	tc filter add dev eth0 parent e: ... e:102 action mirred egress ...

and "tcpdump -npi dummy0" prints traffic that has nothing to do with classid e:102. 
I can confirm the traffic is pored thru the class since its bandwidth is
controlled/limited correctly.

I also tried:
		
	tc filter add dev eth0 parent 1: ... e:102 action mirred egress ...

	tc filter add dev eth0 parent e:1 ... e:102 action mirred egress ...

	tc filter add dev eth0 parent 7fff:e: ... e:102 action mirred egress ...
	(tc complaints with error)

with no results that make sense.

Classes were configured as:

	tc qdisc replace dev eth0 root handle 7FFF: mq

	tc qdisc add dev eth0 parent 7FFF:e handle e: htb default fffd

	tc class add dev eth0 parent e: classid e:1 htb \
	rate 6gibit ceil 6gibit 

	tc class add dev eth0 parent e:1 classid e:102 htb prio 2 \
	rate 25mibit ceil 50mibit 

Packets' target class was configured as:

	xdp_iphash_to_cpu_cmdline --add --ip 'A.B.C.D' --classid 'e:102' --cpu 13

And I can't see any packets to or from A.B.C.D in dummy0. 
Only "garbage" form other random hosts.

Do anyone of you guys know how to use "tc filter ... mirred..." in XDP multi queue environment??

Regards

Ethy

