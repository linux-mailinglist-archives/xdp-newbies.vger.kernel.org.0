Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6149A1F56FE
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 16:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgFJOs4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 10:48:56 -0400
Received: from mail-db8eur05olkn2042.outbound.protection.outlook.com ([40.92.89.42]:40486
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726081AbgFJOsz (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 10:48:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mon0kwadG/IqLkXSpY2hm9/aBA8+rxH2E0sIFOXK96YF3dS1rm+Ktqd3rewQD5wJa/wDTLmeHHq7oSqzdGudDHb6TwnNiHC341K/I2qhD+hTdHmsrEtQgIPgVYl064AXB6nx02bH+EGzfzIaOYMBZUrUlnna+SiyzgC5PgjARBWYdEI6/52+k/xMI6ofRo5U7sf5Kto03xF8dFtwpmkPZKh2drWUahFn2piiZC8Sj9Mq9AXsXjA0oQUMqGHm3O+2FRperADNcEwkcT4nCi77o6T6Bh3ls0VYdXRDJA13KCy3FnLJBQTTXnUEOG2PGroZhmPni5jiL9YQkLf/p1o8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPxNdAwlvDGSc/17J6dI5JfPCyHixX9CCdYsrMmPtfo=;
 b=Xv/Lz/rFFtz3gynOX3f+deGQ9ouMUHNN3yqvS2Khk5xuWmX5KsbrIeCfQLtX+zjIfccRyDiGYSzzHH+qJBPRT6OVVKiyxAsYcDkN2XgtuzYMrJ4Pm5YOQoNlEMw3krj/4zFJ1tILxUaEJCTCoRB1nIdvC1Nbq7/WjsLjOpoIEIgSFkULvsDCUgIZsyUctJUMUAdU11z1T5+ZbowutV3gj/4F62SRU8Q8dyEJ+dlGQ7zu6qYw+biLtzXqBQAar8PYlUT3UQEFr5D4ds1Qcy7tcRhcixNWsJqzfP4aBorvb+pnpb085Hubbp60wI9BGGXe3eY7O5FjQecJFlVqDE+j8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6EUR05FT032.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::50) by
 AM6EUR05HT113.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::287)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 14:48:52 +0000
Received: from DB7PR08MB3130.eurprd08.prod.outlook.com
 (2a01:111:e400:fc11::51) by AM6EUR05FT032.mail.protection.outlook.com
 (2a01:111:e400:fc11::101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Wed, 10 Jun 2020 14:48:52 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D1B64A7A6BA5079C4E84B80D2AE497F2E91A59EA106417597F982069D32E83E6;UpperCasedChecksum:6511ADE6F40B40A81B4422BA649D1A10844B355B75D9E1DCACE932F85C719183;SizeAsReceived:8971;Count:49
Received: from DB7PR08MB3130.eurprd08.prod.outlook.com
 ([fe80::1096:7af0:893c:6f59]) by DB7PR08MB3130.eurprd08.prod.outlook.com
 ([fe80::1096:7af0:893c:6f59%4]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 14:48:52 +0000
Subject: Re: Lightweight packet timestamping
To:     xdp-newbies@vger.kernel.org
References: <DB7PR08MB3130BDD01387627E7FAD775F9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <DB7PR08MB3130C02AB04133E07146F40D9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <DB7PR08MB3130BA2C0F90E0819577C5289E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <b712de09-fd35-1d5e-1842-31bb3b2e163d@gmail.com>
From:   Federico Parola <fede.parola@hotmail.it>
Message-ID: <DB7PR08MB31304BCD517885F0E1C063F69E830@DB7PR08MB3130.eurprd08.prod.outlook.com>
Date:   Wed, 10 Jun 2020 16:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <b712de09-fd35-1d5e-1842-31bb3b2e163d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: GV0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28::23) To DB7PR08MB3130.eurprd08.prod.outlook.com
 (2603:10a6:5:24::15)
X-Microsoft-Original-Message-ID: <4504717f-4de7-0ce8-b45c-4232a07cfb0f@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by GV0P278CA0036.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:28::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 14:48:52 +0000
X-Microsoft-Original-Message-ID: <4504717f-4de7-0ce8-b45c-4232a07cfb0f@hotmail.it>
X-TMN:  [xxIgUbfKiXNMiYZQKZxQeV6oSD0ipOOg]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bf144b4a-541d-41db-6154-08d80d4d646f
X-MS-TrafficTypeDiagnostic: AM6EUR05HT113:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiEYj2TGHgAQhIGeOL8w3w1GBvrtvIj14IaLMXZIzJPPiMWEwAWbqkS1DmNCwOAWTOVPxogPqDhXy8jmbj79jV8Gn6+6bXlPYCOjF6KKCRiotEJDGAnrJ0QX6G675p5N8krBGyxVIT2xmIoTkxkwQnyRFvrYZ54zsFbi9PpURg8TysGQUp/DjCMXdliCN3nuvsDtL3IHrBRFUOAsGSMHZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3130.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: yrQGJk2GawhHrT29/Cr3GjH0i+aM+kPKmdGN1waWVh8N33qq2l7E0LDZc8qyapuCPCQutlDVj1P0cRU1wPvvhpu7+0k2AYp9KUCeGB62CehnMysoXVnXpWVzwzXtPcaZipf5/zMqYmK/ONohYfIu7A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf144b4a-541d-41db-6154-08d80d4d646f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:48:52.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT113
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 06/06/20 01:34, David Ahern wrote:
> On 6/4/20 7:30 AM, Federico Parola wrote:
>> Hello everybody,
>> I'm implementing a token bucket algorithm to apply rate limit to traffic and I need the timestamp of packets to update the bucket. To get this information I'm using the bpf_ktime_get_ns() helper but I've discovered it has a non negligible impact on performance. I've seen there is work in progress to make hardware timestamps available to XDP programs, but I don't know if this feature is already available. Is there a faster way to retrieve this information?
>> Thanks for your attention.
>>
> bpf_ktime_get_ns should be fairly light. What kind of performance loss
> are you seeing with it?
I've run some tests on a program forwarding packets between two 
interfaces and applying rate limit: using the bpf_ktime_get_ns() I can 
process up to 3.84 Mpps, if I replace the helper with a lookup on a map 
containing the current timestamp updated in user space I go up to 4.48 Mpps.
> XDP does not support access to h/w timestamps at the moment.

I see, I think I'll keep the map solution for now, since I don't need 
nanoseconds precision. Thank you.


Federico

