Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24DBBC982D
	for <lists+xdp-newbies@lfdr.de>; Thu,  3 Oct 2019 08:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbfJCGRF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 3 Oct 2019 02:17:05 -0400
Received: from lb.pantheon.sk ([46.229.239.20]:41249 "EHLO lb.pantheon.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbfJCGRF (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 3 Oct 2019 02:17:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by lb.pantheon.sk (Postfix) with ESMTP id 2B7EB6B18E;
        Thu,  3 Oct 2019 08:17:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at siecit.sk
Received: from lb.pantheon.sk ([127.0.0.1])
        by localhost (lb.pantheon.sk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5p5JgIt_03NW; Thu,  3 Oct 2019 08:17:01 +0200 (CEST)
Received: from mail.pantheon.sk (srvw-ptex1.pantheon.local [10.101.4.5])
        by lb.pantheon.sk (Postfix) with ESMTPS id 2A9866B155;
        Thu,  3 Oct 2019 08:17:01 +0200 (CEST)
Received: from srvw-ptex1.pantheon.local (10.101.4.5) by
 srvw-ptex1.pantheon.local (10.101.4.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 3 Oct 2019 08:17:00 +0200
Received: from srvw-ptex1.pantheon.local ([::1]) by srvw-ptex1.pantheon.local
 ([fe80::409e:7148:12ab:5c7a%7]) with mapi id 15.01.1779.002; Thu, 3 Oct 2019
 08:17:00 +0200
From:   =?iso-8859-2?Q?J=FAlius_Milan?= <Julius.Milan@pantheon.tech>
To:     Maciej Fijalkowski <maciejromanfijalkowski@gmail.com>,
        =?iso-8859-2?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
CC:     Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?iso-8859-2?Q?Marek_Z=E1vodsk=FD?= <marek.zavodsky@pantheon.tech>
Subject: RE: xdpsock problem testing multiple queues
Thread-Topic: xdpsock problem testing multiple queues
Thread-Index: AdV5DFponigxaU4pTXybWUUY2UuB8gAC3SAAAAV6poAAIRUr0A==
Date:   Thu, 3 Oct 2019 06:17:00 +0000
Message-ID: <b3c1c0fb82ba4f65b71958130fd7f70c@pantheon.tech>
References: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
        <CAJ+HfNh58fN=BU5ADzTs=vbCD1j5fs0i1EKhAQQdByjiVHz4BQ@mail.gmail.com>
 <20191002182755.00000657@gmail.com>
In-Reply-To: <20191002182755.00000657@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.4.10]
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Many Thanks folks

>On Wed, 2 Oct 2019 15:52:04 +0200
>Björn Töpel <bjorn.topel@gmail.com> wrote:
>
>>On Wed, 2 Oct 2019 at 14:11, Július Milan <Julius.Milan@pantheon.tech> wrote:
>>>
>>> Hi all
>>>
>>> We are trying to test multiple RX queues with sample program xdpsock from kernel on vmware virtual machine with 2 queues.
>>> The driver on the NIC is:
>>> # ethtool -i ens192
>>> driver: vmxnet3
>>> version: 1.4.16.0-k-NAPI
>>>
>>> NIC has 2 queues, I can check it by ethtool -S.
>>>
>>> But when I try to use queue 1, I am getting following:
>>> # ./xdpsock -i ens192 -q 1
>>> /home/jmilan/ws/pt-xdp/linux/samples/bpf/xdpsock_user.c:xsk_configure_socket:315: errno: 1/"Operation not permitted"
>>>
>>> Any ideas what the problem could be? Maybe vmxnet3 driver does not support some necessary operations related to queues?
>>>
>>
>> XDP support is missing for that driver, but the XDP_SKB/generic mode 
>> is available, and should work.
>>
>> Can you run the xdp1 application in the samples directory, to rule out 
>> that you can run XDP.
>
> Xdp1 should work fine but I think the reason for a reported failure is because
> Vmxnet3 driver doesn't expose the {set,get}_channels ethtool API (at least I don't see it?) which is used by libbpf's xsk part for querying the underlying driver how many queues does it has and use that info for creating that many entries in XSKMAP.
>
> So in that case you're limited to use queue 0 because the XSKMAP map has only single entry.
>
> Maciej
>
>>
>>
>> Björn
>>
>>> Best Regards
>>> Július
