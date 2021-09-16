Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28AE40D2CA
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Sep 2021 07:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhIPFKf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Sep 2021 01:10:35 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:10980 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230193AbhIPFKf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Sep 2021 01:10:35 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FM3vmn010691;
        Wed, 15 Sep 2021 22:09:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=WArruLWm980v5mxHDs3ehTWxZWr7y6PvFcqAdY6lAMg=;
 b=HBDOX2JXMpzE8J4h4lOKTNzSmti3sQoJ7gXCv0IdRnS8ILevyHSnnztLk5rp+KUfhJ4i
 BGXw7msUokpxLh33rWmheJCPoEBQP1SsjSOsItGWCvIYBCI9vx4LHmJC+zgxuVdcb2Mr
 gYF0WCDi5gGnBbPBFUUDwkv2y6AIuSRTdcA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3b3qg12jqs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 15 Sep 2021 22:09:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 15 Sep 2021 22:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgDJXdA6bsG7QHNg3J4tir5MvGu1SbxYDX+en4F30IBCIi9N9MwnlZqaTe0Tdx2r0DoEC4ugxjM/rZDNxqcB1IMCw9q6/pPkHVFWCD0TL4ZO+ZzYoKPUyew6pQrIW+QtV0P9sSvPKtH9yuh9f7gTu2icWoxC0uMaZH33Mk42g92es15ApFSfxBXYHFJzxOtLHhdLIiLIs1HjP0iNK/Syt21GThQQxYm37ZpgSjMfj7vBPNnZmZH9+bYnpRIKfY4jK3izjMxf62krPEJ95ld+LOvgm5o7sSASwrV80ViJxlgSCATKpLhSB4oBZ5l+/0EU75tehZiP2QDDxxXubHdADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Hm41dvtpsQ+jISiJZRDjT3WexCQt+VJ6eoVSrzpL2G4=;
 b=buT5uy9Z+q8ny79BB11vTBK6HjHRQdiLBAhhq91GBwzW3lvxw03me4H3Tn8teNNUMt7gaoVi+I+A6nZD+/vu0Mpzuedv5kQ7ZOCMcudtHCgHOVPhSH+51uvF0O9V2y2GMdgmv2qu8cgWV4Y47du16Syr7J7sZ26KTyoCXHZ5C/RgW3KDAJFWcdvIgvfxTdEGuip2t8ocK5U8+m5wtL6IWNP1l50aWKB9iOueB5HrMQhuhmx6jTWKogasvA0sQD9I1pOdpCSjfL/3j9SKjRBFMzzo2n68scJNtjqJchnDy9mhNyyeoOTamz8qBKf/tbmuFl9ahVlw7+no7m44cYu44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
Received: from CO1PR15MB5017.namprd15.prod.outlook.com (2603:10b6:303:e8::19)
 by MWHPR15MB1871.namprd15.prod.outlook.com (2603:10b6:301:4f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 16 Sep
 2021 05:09:07 +0000
Received: from CO1PR15MB5017.namprd15.prod.outlook.com
 ([fe80::8951:d1eb:665:8807]) by CO1PR15MB5017.namprd15.prod.outlook.com
 ([fe80::8951:d1eb:665:8807%5]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 05:09:06 +0000
Date:   Wed, 15 Sep 2021 22:09:04 -0700
From:   Martin KaFai Lau <kafai@fb.com>
To:     Rob Sherwood <rob.sherwood@gmail.com>,
        Christian Deacon <gamemann@gflclan.com>
CC:     Joanne Koong <joannekoong@fb.com>, <xdp-newbies@vger.kernel.org>,
        <bpf@vger.kernel.org>
Subject: Re: Parsing TCP Header Options In XDP/BPF
Message-ID: <20210916050904.e7eyvmhgsjdiu7uf@kafai-mbp.dhcp.thefacebook.com>
References: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
 <CAFg6Rxuh1irBwCCP2t=Yj_JMXyu=SsT3g+_a0w_HU9UkQ2=OEQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFg6Rxuh1irBwCCP2t=Yj_JMXyu=SsT3g+_a0w_HU9UkQ2=OEQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:a03:39d::28) To CO1PR15MB5017.namprd15.prod.outlook.com
 (2603:10b6:303:e8::19)
Received: from kafai-mbp.dhcp.thefacebook.com (2620:10d:c090:400::5:6e) by SJ0PR03CA0323.namprd03.prod.outlook.com (2603:10b6:a03:39d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 05:09:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf5ce0af-9230-4a31-a64a-08d978d01bbf
X-MS-TrafficTypeDiagnostic: MWHPR15MB1871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR15MB1871C3A2D815CB67C36FAB4DD5DC9@MWHPR15MB1871.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqV83HgnWtUMHtvRPerO1ltIS5iOIeoqkW+7I9oBN3MRGEGA7cFUAfahQHWhSG76OhV14a6esZYyboqGgC4t2wOCs1X330Fi5pzy9kiV7jwnXKKbswFdXI69f8UeT7TOKon+SHVKO2QIx254iDJNuXNllWFLyO7hVmKaEw4qv/ieRSQDTT//1VA5oGp+GI77U96AwHBpsHi1Hbt8UwmGZe1y9cseF/6O7oTgVrHtBV8Qfw6RLDUet2uEDIWCqCFBey94freZZXHmYzm/6FWBHAVlatv43uycgraDFdJdYTErqvW47BSs0cnFO6Vc0e4REWX7/g5ZlE9+k1mpdOIT24NWs+XAJxytnld5FimH0L2HVO6lA7Q5pFh//nFMEbXijMKRywVjQvEzn3W12gWTsH6ZDQgx3HvY/KAuKbGYRqj95ip8hWsaprXQn9S3vsHyPltjccnCWx8LlMZRjSl1wbd2iYCPGJKxDqicPiAobGG/eW2kQ1L5A09K7BJtxwMyzr6H/VIzTOTjXuHXqUx0ejT4TG9ECgcsFTMmca7e55Rz25BgVcn9420oNVhv/OvgS90APAQlBwXuOzcwYA9+AZ7PmN1U+S1IDPQs4bZogxhuwtyeSdCgnwRZHGjxnUvo8BPuCq1appS63Cf2gQ5LetbKQWhW2UJNNo/BBUbwnbRTFWr5JDp8bi6BiI8bpixH5U1kQvmh11/YuADyKrXhWs9kWn3hZqSsDDHCQl5zNrLu9YgoGQcMs6pSwnt6kULX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR15MB5017.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(6506007)(110136005)(55016002)(53546011)(478600001)(1076003)(5660300002)(186003)(966005)(52116002)(7696005)(4326008)(8936002)(316002)(2906002)(66476007)(38100700002)(83380400001)(66556008)(8676002)(86362001)(66946007)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ArhWdKDln2LBhdqDukacFDEQy+JTRU3aBAa5lsvLLXSR3L2CF8XqzfExkMW?=
 =?us-ascii?Q?iMpBLGpAntWpzZsqcPjj1+b7V2RCBpoczCf41ziRaAp7dDeOofzDFcRvcVtj?=
 =?us-ascii?Q?SPyMSCzeRWC7jAiyr1xn4JjPFP5UNZL9M+OsO4W1LLF5d/uQ2r2owB5s1W2Y?=
 =?us-ascii?Q?T4Uov9+HiER7pXbhcsnP2LQLgiKEoRM4R5YQdl9AiAzhPAj8B0VyCdVuqiCg?=
 =?us-ascii?Q?jbRrOZfh8xmV8imvk/5bctzqmVzNxFk03Y7fb4l4Lc7XIjnGAv31iHQpM736?=
 =?us-ascii?Q?Rt3WND8uMQofmks9n3hSlTjVSVtHGPKuRWOe+CS879xOboWcTjRAP04/t6Pm?=
 =?us-ascii?Q?kgfnevCg/1dJNkl94R3GEiHGgWU3ea92DMOjTY8VXs/0dYiLlMkIAJc+b3Fw?=
 =?us-ascii?Q?k4fRfvDGcXZDLywXjTi+JkYGQY98qmhPisokDxGUXFYBjfFYJJwPLQanxSzx?=
 =?us-ascii?Q?cS6DkaJUxNY4BEDaiherExoY5DkNrpUpQr/s39aVz8VqVs/uDqVODBc/2pc4?=
 =?us-ascii?Q?Fz/2crvbkaD6zN9O5p5c4fWxA/YTjH2peIq+4pViQPGfEbt/h0w/Yy2PZGfl?=
 =?us-ascii?Q?vaiqczyQr9MMJcAjPLwtNrORenDpzFmlSahKineCpn4l1AyGTB9P6i1jckRN?=
 =?us-ascii?Q?rGoQkEsuDXBKzEroq5WMIvx+ATq97TLO95IW6+Wudxt6uCRU/5BB+pvGPIJw?=
 =?us-ascii?Q?y4BIzqA2ml3aW9jFtA+2R6nnggaLUSOWttdDdmLF6xTA6T0Bc6awiAHP7xg9?=
 =?us-ascii?Q?0huDdGGlaF8wI+Ka5IsxN6nzwW0k2g6wI3ocaNAu0qVj0UN3d50Mv/JgePsZ?=
 =?us-ascii?Q?ESX0H+vtXFOVT5T/817Vu3z27MCxNmh0kCSuEnc5f/w4eX4zIiAiGSNPPCNU?=
 =?us-ascii?Q?2I2uW3seD/xYcO3IHr/5BVgkI0bqlAZIflxgUm64FEGJGrmxk6+tePMllLls?=
 =?us-ascii?Q?SZeB1G1oM6WaDDm9JcCJzf11knZWXhSi56E3/8HI/Y25RnYFUseWI1wHArMU?=
 =?us-ascii?Q?S9QPt+6mfb/g25K958azOGQxxoQnyc5JC8AqofA0rFUROPaeImWm3Uzih4Xk?=
 =?us-ascii?Q?AALCEWn5Y9L821cDHMj7xQAto5WMJxAiqIwgjHEeyuHeKWxbuXv8e0CZX2sL?=
 =?us-ascii?Q?xsGmrdNMAZr7iein98WMG8o3S4iQrf/1YA1TBmIFC0QDgI1To5oEaOjOR38r?=
 =?us-ascii?Q?4It3Z4BG5NqM5J/xDREpbAEpSWNqN9dy7y0PRLpSOME/XKgBWbm6YChWS/tF?=
 =?us-ascii?Q?e8pqA2/bW4Xx4fFAE5iX1+PHEBN8MXc5acafXls20Eil37Uy3BJFKMskUK6G?=
 =?us-ascii?Q?w8myqhvLTjf5C3QzeZ7UEyCoDLaxeniZV+ej7nRpzWBv9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5ce0af-9230-4a31-a64a-08d978d01bbf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR15MB5017.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 05:09:06.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IGcLbaYpwpTjkuIeCKTNm9oLV0oTYHRBFcDdIINRz+lpCHeOPxQ8uA5I7kzfB/I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1871
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: D52OYUyFdC0UihSx586bKAPGJGhO0iQx
X-Proofpoint-GUID: D52OYUyFdC0UihSx586bKAPGJGhO0iQx
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_01,2021-09-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 clxscore=1011 mlxscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160032
X-FB-Internal: deliver
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Sep 15, 2021 at 09:21:50PM -0700, Rob Sherwood wrote:
> Definitely not an expert but no one has replied so I'll throw out my guess :-)
> 
> Check out https://lwn.net/Articles/794934/  for more info on 'bounded
> loops', but my guess is that the verifier doesn't have enough context
> to verify your loop is really bounded.
> 
> One trick might be to convert your while loop to a for(;;) loop, e.g.,
> instead of :
> 
> https://github.com/gamemann/XDP-TCP-Header-Options/blob/master/src/xdp_prog.c#L81
> while ( optdata < 40) {... }
> 
> you could try:
> 
> for (optdata = 0; optdata < 40; optdata ++) { ... }
Right, bounded loop is one option to try.

There is a bpf_load_hdr_opt() helper which currently is available to
BPF_PROG_TYPE_SOCK_OPS to parse tcp option.  Joanne (cc) is working on
extending it to support BPF_PROG_TYPE_XDP also.

> 
> I know from past attempts that just because it's obvious to humans
> that there's not an infinite loop, it's not always obvious to the
> verifier.
> 
> Hope that helps (and is correct!),
> 
> - Rob
> .
> 
> 
> On Wed, Sep 15, 2021 at 10:36 AM Christian Deacon <gamemann@gflclan.com> wrote:
> >
> > Hi everyone,
> >
> >
> > I wasn't sure whether to submit this under XDP's mailing list or BPF's.
> > However, since it's an XDP program, I figured I'd start here. The issue
> > has to do with the BPF verifier, though.
> >
> >
> > I am trying to parse TCP header options within XDP/BPF. In my case, I
> > want to locate the 'timestamps' option and read/write to the sender and
> > receive timestamps (the option's data, which is eight bytes in total I
> > believe). In order to do this, I believe you'll need a loop since the
> > TCP header options are dynamic in regards to location in the
> > packet/memory, etc. For more information on the TCP timestamps option
> > specifically, I found below a good read for those interested.
> >
> >
> > https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_timestamps 
> >
> >
> > Everything I've tried so far and the source code is all within a GitHub
> > repository I made below. I also included a full BPF fail log in the
> > `logs/` directory within the repository.
> >
> >
> > https://github.com/gamemann/XDP-TCP-Header-Options
> >
> >
> > In the code, I am trying to locate the timestamp offset within the TCP
> > header options. One condition in the loop is when it finds another TCP
> > option other than timestamps. In this case, I am trying to increment by
> > the option's length (the second field within the option) so we can move
> > onto scanning the next TCP option. Whenever I attempt to do so, the BPF
> > verifier states I'm trying to access outside of the packet. However,
> > I've tried including many checks for this (making sure the length in
> > memory is within ctx->data and ctx->data_end for example). You can find
> > more information about this below.
> >
> >
> > https://github.com/gamemann/XDP-TCP-Header-Options#fails
> >
> >
> > At first, I was only checking to see if the location was outside of
> > ctx->data_end, but since that wasn't working, I figured I'd try to see
> > if it's within ctx->data and ctx->data_end to see if it made any
> > difference (it did not).
> >
> >
> >
> > The tests I've ran occur for multiple kernels. From 5.14 to 5.10 and 5.4
> > (which is the current kernel I'm on and what I performed my documented
> > tests under). This is also on an Ubuntu 20.04 VM I have at home and here
> > is the output from `uname -r`.
> >
> >
> > ```
> >
> > root@test02:/home/cdeacon# uname -r
> > 5.4.28-050428-generic
> >
> > ```
> >
> >
> > I was wondering if anybody had suggestions or could tell me what I'm
> > doing wrong in the code above. I apologize if I've missed anything
> > obvious as well!
> >
> > Any help is highly appreciated and thank you for your time!
> >
