Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 239B0157C8F
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Feb 2020 14:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgBJNn3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Feb 2020 08:43:29 -0500
Received: from mail-am6eur05on2061.outbound.protection.outlook.com ([40.107.22.61]:7258
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727369AbgBJNn3 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Feb 2020 08:43:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMCpKw4MzFXti8q1Sfe/ad2sXlRJiSA8SvJcIY2n1J4+/uktgbREy+2nvKL/fWMn5M0073Av9BWZjwP5CFS3iKB1E0ErJeA66aDl86lhWwqwq9/gFWUCufsC8CXeVDpU7CkLeY9uMGp5b1cT6ISjW3K8x2uyas0vXzeH2T5YyhuDuW9UOSjqoZ4FHAA9TCqF/42Bc6/VmTm3wH/Mx+3cgIgcrQAJhmjCymh8BxQHxpi5YI2cUmFPBhDYAqh4Wy0rVDukcB68kVIy0mcuulfFElhKmRPigEOnt2+U+mjQvPq8P4S8K4OGXj04xoiF6vMzQ80/s3NmNOYoE7PQvHr5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etkjCJGwO+NEfVQp6Ml58j5JPD6y88lZf7dghu1yLrM=;
 b=V5gwIcIJDYBFBHfFvL7EerciReD38A3+iFLnFYIdHQIrwFXP0GpeHuXwK9ev1yQCkyiy76fSEDiyHe696wlPDse5b1f9+iUHYr/RAXQDjChuRVQHvNfPjN3RNHbccmajDE/BYCucyrSsJDXmxVgR8zXVVWtnJKNPjazUOBFev5OnKLfcrQcOvLmqeEYDO0AumtbHuEOWRogYPXuFvnKLxNrzTnicM4B9ReSaceJqT9wz6Z+0r5kza4AD4mLQTPX1NMroPxN5NziaW271LDbJBGANnrn/pQkNNPP1pcMuBl1Yl4VEiXOauKyR5B+vKn8HlIv1c3TBXps4u0eu6Kl5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etkjCJGwO+NEfVQp6Ml58j5JPD6y88lZf7dghu1yLrM=;
 b=BJRlVbRIF/12IsduYTzhIKr2yeM98vbhGRhxs6D3EwG/wTb33M2TJpTH7Jrp/db/Uzvyr9+NtEyTG08kUSLzqGk15L6UEVQAHI8Ec3JZKftKlFH0StLYRTMv2ESsWgg1cKaPkKF/4eUYpK5Yc/b2ajA5Gnyg0OANQB4XcF3Xxzw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=maximmi@mellanox.com; 
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com (10.168.126.17) by
 HE1PR0501MB2299.eurprd05.prod.outlook.com (10.168.35.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 13:43:18 +0000
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::60c4:f0b4:dc7b:c7fc]) by HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::60c4:f0b4:dc7b:c7fc%10]) with mapi id 15.20.2707.028; Mon, 10 Feb
 2020 13:43:18 +0000
Subject: Re: [PATCH bpf] xsk: publish global consumer pointers when NAPI is
 finsihed
To:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Ryan Goodfellow <rgoodfel@isi.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Moshe Shemesh <moshe@mellanox.com>
References: <1581068272-4615-1-git-send-email-magnus.karlsson@intel.com>
 <c5d6fd11-8696-e898-6f05-5fcc087c0065@mellanox.com>
 <95de5e86-8930-5655-62b9-ec60b9952440@iogearbox.net>
 <CAJ8uoz2Qn496NX2Q49_Ct_r4b_NjouqhM8iz+c2yp8y9=e4wSg@mail.gmail.com>
From:   Maxim Mikityanskiy <maximmi@mellanox.com>
Message-ID: <ad324d2e-c9ab-f2fa-c11a-d26bc8d21284@mellanox.com>
Date:   Mon, 10 Feb 2020 15:43:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <CAJ8uoz2Qn496NX2Q49_Ct_r4b_NjouqhM8iz+c2yp8y9=e4wSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::30) To HE1PR0501MB2570.eurprd05.prod.outlook.com
 (2603:10a6:3:6c::17)
MIME-Version: 1.0
Received: from [10.112.41.138] (77.75.144.194) by AM0P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Mon, 10 Feb 2020 13:43:17 +0000
X-Originating-IP: [77.75.144.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86aa255a-5312-4150-d4e8-08d7ae2f2fd8
X-MS-TrafficTypeDiagnostic: HE1PR0501MB2299:|HE1PR0501MB2299:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0501MB2299FB860B032ECBD8CFE579D1190@HE1PR0501MB2299.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(199004)(189003)(36756003)(52116002)(478600001)(31696002)(54906003)(16576012)(110136005)(316002)(8936002)(956004)(2616005)(8676002)(81156014)(4326008)(5660300002)(81166006)(107886003)(31686004)(6486002)(66946007)(66556008)(66476007)(26005)(16526019)(186003)(53546011)(2906002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0501MB2299;H:HE1PR0501MB2570.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QhVDiW0XSJpw5OhtIREYxMJOOiQWIjwXWfN6aCCA5DLrl2TWmQ9VM6A9CL+0JaUCoHYNQyz5qJ9djZ5BNJ/hIkkddqifsKl+oUJhTB7KpFarBSbTuFe86wPOY1hzXVb2ioYN2bc4jzhXj3cVJnnNlVMCr2DtXuh8hoNAVQth6PzqjfzeX+EGQRdTGDj995T2AcEPwrRD68UZMSQI4Eom36zXspLASuo2+VXb5RVU1NcwHkkUnEHpnZ/RwyhfVMUvV8JIv/aTaF8L4lafV8TOTh+cJj7xRVu13364E7ozfAJwsLGYPNUXKNuZCpjM0sHMiKLm+syZ2uS/fOOm17i34bn9rgm6MwQw/Ci410zGhjoalNuk9X8m31FaXcIOTsjN+Z7Kqn5Fk2yuezoRmyBY0twFbnbyf5kFPBuvMT1FNk4jUVvOGja6+FEUoYNi2x9+
X-MS-Exchange-AntiSpam-MessageData: W6BO2VeHr+HnRgV5V76G4cOm7IGaNLd07gFQKEgzqRNU8EPqFMDqZbet9KyVhdYBlQ+n4hTyCCAE+Jf+OMdJ+hvsi318CfZ2DuEfg5kvhZFXsYepfqz5SXu5dMILJjJD27K/YhMV0Ul0dHV4JmI7cQ==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86aa255a-5312-4150-d4e8-08d7ae2f2fd8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 13:43:18.7708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n21riwQmunUTC88myxLlfaZgLb9m8gxE9K1rCXylmotHwYDFCki0YlrB4FWxoYl3HyXM9ZIilVoUUrvqyaeL9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2299
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2020-02-09 11:58, Magnus Karlsson wrote:
> On Fri, Feb 7, 2020 at 10:41 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>>
>> On 2/7/20 1:34 PM, Maxim Mikityanskiy wrote:
>>> On 2020-02-07 11:37, Magnus Karlsson wrote:
>>>> The commit 4b638f13bab4 ("xsk: Eliminate the RX batch size")
>>>> introduced a much more lazy way of updating the global consumer
>>>> pointers from the kernel side, by only doing so when running out of
>>>> entries in the fill or Tx rings (the rings consumed by the
>>>> kernel). This can result in a deadlock with the user application if
>>>> the kernel requires more than one entry to proceed and the application
>>>> cannot put these entries in the fill ring because the kernel has not
>>>> updated the global consumer pointer since the ring is not empty.
>> [...]
>>>
>>> Acked-by: Maxim Mikityanskiy <maximmi@mellanox.com>
>>>
>>> Is it intentional that you didn't send it to bpf and netdev mailing lists?
>>
>> Yep, please resend with Maxim's ACK to bpf + netdev in Cc. Thanks!
> 
> It was intentional, but maybe confusing. In the mail just before this
> patch I suggested that this patch should be part of a patch set that
> we send to bpf and netdev. The purpose of sending it was for you Maxim
> to ok it, and you did with your ack :-). But I will repeat the other
> questions from that mail here.

OK, I see. Sorry, I didn't see the previous email (and still can't find 
it, BTW).

> Does the Mellanox driver set the need_wakeup flag on Rx when it needs
> more buffers in the fill ring to form its stride and the HW Rx ring is
> empty? If yes, great. If not, please submit a patch for this.

Yes, it does (regardless of emptiness of the HW RX ring). If 
xsk_umem_has_addrs_rq returns false, the driver sets the need_wakeup flag.

> I will produce a documentation patch that clarifies that when the
> need_wakeup flag is set for the fill ring, the user need to put more
> packets on the fill ring and wakeup the kernel. It is already
> mentioned in the documentation, but I will make it more explicit.
> 

Great, thanks!

There's still room for optimization here, though: how many is "more"? If 
the application puts them one by one and wakes up the driver every time, 
it's not very effective comparing to the case if it knew the exact 
amount of missing frames. On the other hand, normally the application 
would put enough frames in advance, and it shouldn't get to this point.
