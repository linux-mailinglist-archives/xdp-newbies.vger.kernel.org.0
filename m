Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C66828DC82
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Oct 2020 11:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgJNJPo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Oct 2020 05:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47211 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726323AbgJNJPn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Oct 2020 05:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602666941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2+ec+ymQqXMOHXlw3iY1tI9SDSIvjkVBN3km1TsO4+E=;
        b=LWkRMeAq9ky5t1bwvtPD4JZPcWgp/yyskOqdEAXT5RC98DL9lXZyEtLPPScjcaxAPnf2XV
        FjK6UfC0LT80RuFJUlNIGy3gnX5VlxiWaGqlbzRyyBuX1mYgeD/F3ZD5DhFbTSE8ycBwbM
        Q3aS4lXSapF8Jz0gPlpDdd5t/B2qwhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-qntF95yIPXepyOI-UnroNA-1; Wed, 14 Oct 2020 05:15:39 -0400
X-MC-Unique: qntF95yIPXepyOI-UnroNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 268071020904;
        Wed, 14 Oct 2020 09:15:38 +0000 (UTC)
Received: from carbon (unknown [10.40.208.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2EC7A75261;
        Wed, 14 Oct 2020 09:15:30 +0000 (UTC)
Date:   Wed, 14 Oct 2020 11:15:29 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Federico Parola <fede.parola@hotmail.it>
Cc:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Multi-core scalability problems
Message-ID: <20201014111529.6e464b4b@carbon>
In-Reply-To: <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <87r1q29ita.fsf@toke.dk>
        <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On Wed, 14 Oct 2020 08:56:43 +0200
Federico Parola <fede.parola@hotmail.it> wrote:

[...]
> >
> > Can you try to use this[2] tool:
> >   ethtool_stats.pl --dev enp101s0f0
> >
> > And notice if there are any strange counters.
> >
> >
> > [2]https://github.com/netoptimizer/network-testing/blob/master/bin/etht=
ool_stats.pl
> > My best guess is that you have Ethernet flow-control enabled.
> > Some ethtool counter might show if that is the case.
> > =20
> Here are the results of the tool:
>=20
>=20
> 1 FLOW:
>=20
> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 35458700 (=C2=A0=C2=A0=
=C2=A0=C2=A0 35,458,700) <=3D port.fdir_sb_match /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0 2729223958 (=C2=A0 2,729,223,958) <=
=3D port.rx_bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7185397 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 7,185,397) <=3D port.rx_dropped /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 42644155 (=C2=A0=C2=A0=
=C2=A0=C2=A0 42,644,155) <=3D port.rx_size_64 /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 42644140 (=C2=A0=C2=A0=
=C2=A0=C2=A0 42,644,140) <=3D port.rx_unicast /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0 1062159456 (=C2=A0 1,062,159,456) <=
=3D rx-0.bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 17702658 (=C2=A0=C2=A0=
=C2=A0=C2=A0 17,702,658) <=3D rx-0.packets /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0 1062155639 (=C2=A0 1,062,155,639) <=
=3D rx_bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 17756128 (=C2=A0=C2=A0=
=C2=A0=C2=A0 17,756,128) <=3D rx_dropped /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 17702594 (=C2=A0=C2=A0=
=C2=A0=C2=A0 17,702,594) <=3D rx_packets /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 35458743 (=C2=A0=C2=A0=
=C2=A0=C2=A0 35,458,743) <=3D rx_unicast /sec
>=20
> ---
>=20
>=20
> 4 FLOWS:
>=20
> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9351001 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 9,351,001) <=3D port.fdir_sb_match /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0 2559136358 (=C2=A0 2,559,136,358) <=
=3D port.rx_bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 30635346 (=C2=A0=C2=A0=
=C2=A0=C2=A0 30,635,346) <=3D port.rx_dropped /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 39986386 (=C2=A0=C2=A0=
=C2=A0=C2=A0 39,986,386) <=3D port.rx_size_64 /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0 39986799 (=C2=A0=C2=A0=
=C2=A0=C2=A0 39,986,799) <=3D port.rx_unicast /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0 140177834 (=C2=A0=C2=A0=C2=A0=
 140,177,834) <=3D rx-0.bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2336297 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2,336,297) <=3D rx-0.packets /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0 140260002 (=C2=A0=C2=A0=C2=A0=
 140,260,002) <=3D rx-1.bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2337667 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2,337,667) <=3D rx-1.packets /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0 140261431 (=C2=A0=C2=A0=C2=A0=
 140,261,431) <=3D rx-2.bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2337691 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2,337,691) <=3D rx-2.packets /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0 140175690 (=C2=A0=C2=A0=C2=A0=
 140,175,690) <=3D rx-3.bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2336262 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2,336,262) <=3D rx-3.packets /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0 560877338 (=C2=A0=C2=A0=C2=A0=
 560,877,338) <=3D rx_bytes /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 3354 (=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3,354) <=3D r=
x_dropped /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9347956 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 9,347,956) <=3D rx_packets /sec
> Ethtool(enp101s0f0) stat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9351183 (=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 9,351,183) <=3D rx_unicast /sec
>=20
>=20
> So if I understand the field port.rx_dropped represents packets dropped=20
> due to a lack of buffer on the NIC while rx_dropped represents packets=20
> dropped because upper layers aren't able to process them, am I right?
>=20
> It seems that the problem is in the NIC.

Yes, it seems that the problem is in the NIC hardware, or config of the
NIC hardware.

Look at the counter "port.fdir_sb_match":
- 1 flow: 35,458,700 =3D port.fdir_sb_match /sec
- 4 flow:  9,351,001 =3D port.fdir_sb_match /sec

I think fdir_sb translates to Flow Director Sideband filter (in the
driver code this is sometimes related to "ATR" (Application Targeted
Routing)). (note: I've seen fdir_match before, but not the "sb"
fdir_sb_match part). This is happening inside the NIC HW/FW that does
filtering on flows and make sure same-flow goes to same RX-queue number
to avoid OOO packets. This looks like the limiting factor in your setup.

Have you installed any filters yourself?

Try to disable Flow Director:

 ethtool -K ethX ntuple <on|off>

--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

