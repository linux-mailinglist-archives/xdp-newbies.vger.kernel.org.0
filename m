Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A185828CF72
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Oct 2020 15:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727292AbgJMNtI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Oct 2020 09:49:08 -0400
Received: from mail-oln040092066104.outbound.protection.outlook.com ([40.92.66.104]:37933
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726796AbgJMNtI (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Oct 2020 09:49:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5snVNUD/Vng0JT1siVZ9KSFSpf4YtV91C2+1Fro2zwSszYMB/GYTU5f+xqwDnVE1JGPHsydZgWE6UXzblTIFYxnGCc/pfMwX70/XuPzgNxVVt1dZ8dp0V2yvQs4/CKnPsj+bacWHFliqHdRAG0P3OPC5VdxO1mMrXe9FiWWhppytaUoS7GKInTNsHJMt4BCcoNeyfl3L88W3iUps/zz2rpZEGlUyQp+kDv1n4LvjgAdHTJXnrIR/E5SwAnjSn7m6hszrTReArnEi+yBuvYtOKYAZkMMaiN8C+BKMvk+8I09+JceO2ATCv8Y8f6avlWA1FZMI5ehnov6hAP1FiIEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h44fYM4tLdXD7Sztcoa78+YQtNHnXL4ZfEGkzpVTFk=;
 b=Zljki3o0v54sxURsw61NAu+EYeYZ+kBw+uB/4b0GOKHjhs8rqTpZbZM3R+6APXph3tgE/spO1jx5gcmbi1Xj464YIefI6PxC6dBgRTsOyABgi1ZAk+3xp5tWqSjJQ4spgRIqh+veISI7mokdN0NzUDAVP/APfXTXFE6HEgKOYj3AWuQ2XpaZZkPfl1pLPlgoyfIcnGzHCxsaASG2+/FNBLcEm4bjYsSlqID8xHiAW7VEo9PXqSDq05IsNzP1FCz5veN2zfa+TeTGfv0FTXg3WKwukAA+pwt2X3Yb/iKqpJFHZ8UmMUjNoyzfXWudImDeuXF/px50u6hxE7K6BotvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::50) by
 VE1EUR01HT163.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::488)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 13:49:05 +0000
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 (2a01:111:e400:7e19::4e) by VE1EUR01FT035.mail.protection.outlook.com
 (2a01:111:e400:7e19::236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Tue, 13 Oct 2020 13:49:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3F61FF5858F8F8BDC4AF694CEF81FEFC5119C1D1F1B54997538D3DE16F1C9F51;UpperCasedChecksum:2E6179D3AF22EEF0CCCAA8C8BA691CA077F2D2F3CDF7C93B5F06D459FD9F5073;SizeAsReceived:8457;Count:45
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a]) by VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a%4]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 13:49:05 +0000
To:     xdp-newbies@vger.kernel.org
From:   Federico Parola <fede.parola@hotmail.it>
Subject: Multi-core scalability problems
Message-ID: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
Date:   Tue, 13 Oct 2020 15:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN:  [z3MjPBapkytRLyfWGULdyZfFHbQhqdCW]
X-ClientProxiedBy: ZR0P278CA0119.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::16) To VI1PR04MB3104.eurprd04.prod.outlook.com
 (2603:10a6:802:6::14)
X-Microsoft-Original-Message-ID: <33962ddb-b40f-411b-78e2-c5b9ea9c01dc@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by ZR0P278CA0119.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Tue, 13 Oct 2020 13:49:04 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 43f919df-f5b6-400e-ad6b-08d86f7ebfc8
X-MS-TrafficTypeDiagnostic: VE1EUR01HT163:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYBSuFI/CU5JGkNp8MTgSbWfwxhGnYCeTf09aGPK4RRxmtCGp0f/DHuUHMnLJhiALsftiB/UJeO7QG8VqTRtwfDTmfzgjdJiRj6zMBSxKj9a691p+d7fVKlkqJDUmzUZD3yq91VWewtnD0C8BgRkTLY+YFfMipKjHbtVnrLY1qLfLoDF8uduteiyUEuEq+vzUUjLvXIKitF1jHVEi4h/rc84e4mzl9OggEA3+yj7kbEypR1HTiv6M+4oY5wpb+UP
X-MS-Exchange-AntiSpam-MessageData: Yjkl0RvBj3iabha2W5RdmvNQLvyNTdDlFFSs98PuQSfrpuj4SxVs+NLu0VT14dpCDTJ234qaZsVaxIfxLEeQlbFBglY0wme9aSzYsJqBXxAihYCnygjlBqyVzjwQc5Vq3DwVIcyRz8A1I72PnfT2hA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f919df-f5b6-400e-ad6b-08d86f7ebfc8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 13:49:05.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT163
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,
I'm testing the performance of XDP when dropping packets using multiple 
cores and I'm getting unexpected results.
My machine is equipped with a dual port Intel XL710 40 GbE and an Intel 
Xeon Gold 5120 CPU @ 2.20GHz with 14 cores (HyperThreading disabled), 
running Ubuntu server 18.04 with kernel 5.8.12.
I'm using the xdp_rxq_info program from the kernel tree samples to drop 
packets.
I generate 64 bytes UDP packets with MoonGen for a total of 42 Mpps. 
Packets are uniformly distributed in different flows (different src 
port) and I use flow direction rules on the rx NIC to send these flows 
to different queues/cores.
Here are my results:

1 FLOW:
Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps
XDP-RX CPU      0       17784270    0
XDP-RX CPU      total   17784270

RXQ stats       RXQ:CPU pps         issue-pps
rx_queue_index    0:0   17784270    0
rx_queue_index    0:sum 17784270
---

2 FLOWS:
Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps
XDP-RX CPU      0       7016363     0
XDP-RX CPU      1       7017291     0
XDP-RX CPU      total   14033655

RXQ stats       RXQ:CPU pps         issue-pps
rx_queue_index    0:0   7016366     0
rx_queue_index    0:sum 7016366
rx_queue_index    1:1   7017294     0
rx_queue_index    1:sum 7017294
---

4 FLOWS:
Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps
XDP-RX CPU      0       2359478     0
XDP-RX CPU      1       2358508     0
XDP-RX CPU      2       2357042     0
XDP-RX CPU      3       2355396     0
XDP-RX CPU      total   9430425

RXQ stats       RXQ:CPU pps         issue-pps
rx_queue_index    0:0   2359474     0
rx_queue_index    0:sum 2359474
rx_queue_index    1:1   2358504     0
rx_queue_index    1:sum 2358504
rx_queue_index    2:2   2357040     0
rx_queue_index    2:sum 2357040
rx_queue_index    3:3   2355392     0
rx_queue_index    3:sum 2355392

I don't understand why overall performance is reducing with the number 
of cores, according to [1] I would expect it to increase until reaching 
a maximum value. Is there any parameter I should tune to overcome the 
problem?

Thanks in advance for your help.
Federico Parola

[1] 
https://github.com/tohojo/xdp-paper/blob/master/benchmarks/bench02_xdp_drop.org
