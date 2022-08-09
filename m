Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5723C58DAD6
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Aug 2022 17:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbiHIPMI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Aug 2022 11:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbiHIPMG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 9 Aug 2022 11:12:06 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2033.outbound.protection.outlook.com [40.92.91.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4D764DE
        for <xdp-newbies@vger.kernel.org>; Tue,  9 Aug 2022 08:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDLzM5znK4Z7XfBYSq+ut7Tbmyv0DwGsFUWCOVsQPqHOqi+JsCFMHOcP0H38i0by4EAwO8odDCfyO6vmFrFol1eN3MiDfBtRI0MKaqws8tWS/MBFxsGjDEj9DgvM9rOHJaHbkoxX/SxzcF7XbW8hZ+1mV0Zofm0kVED18+IFmlm056zYYByEPiGeZHTu2aEPU7d+V3yY17c+VPgGGQiNX98HMC6Z7Aeax7wYFPeOo38wclqCxvdqGZussM1kfhmSjWebMjxvDJrOhCCDMeyKVS7iOjpt1gxtKRJXEY3JbBQUsdc6Pnu4l8+WRKvCqKF3SVTCOemiPAtMJ7r8RNZ8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2k4VfWuGmRlRejlAlgKp9xxPcTJBK+GHVTsafNDX+c=;
 b=FBwA1ufk6+76cMopV0JONdl5gD4NMhaIKLSbdmZIeo8DRYv70EudB33mUcl88E5E6E/Z+lJ43RTND2xHZFzcPtKTXsTNfaoXZ7KgoNr7Qt8o+wS0zXIAh1/gAz3YdphYfF3ardZCuPnG6UKuJduG5A+Nmw39OPlFsQ/tM3GOn6S+4eS6lz4SYT5ooXRZWNoB2gppBuixgz9PVmULl3bvdV4YnOI7qNqRK+da10xtFl/14/8MZXq9ZEyv63XRC+fPOj3vZjqha/uqQTqrGXwj3xYEnFxY2zgf5o1VVnENHnm12Q2AW4aitNaBLj+X8UBLeOymDN1pu82QckRo/KHVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2k4VfWuGmRlRejlAlgKp9xxPcTJBK+GHVTsafNDX+c=;
 b=ZqszaZ0lgRT0UopcrOtNLd6gKKsZSMBckJfh/VmnLquE5gHZt3Z3Ow5Hrctvr5p0SgSD9M/xuvV6kkwPGsur9ypf3bq84j98nMPPekd2+CCT2UxG0QuA6t4cWT5R7WuzH7elbZP7eeLLLGWEWsNld9NI3i+39nF1c1adk5SD8Ht2GgU/R9hvoJE+zrC5z+ZSYcQGB6gqb+iJTGYmLT4hRj0Hq7ggs+ykefg+X4lW3FqA1Pif9X9dj9KMmNfUyb3F1+gFN1z8pnrMVF7JYxt6kU2KYIH3vm/5Gme/R7pyLzlHe71qY9PFSMWBPu+kS9K1Kh23ayg1cWclxSBZegL+YQ==
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com (2603:10a6:20b:361::18)
 by VI1PR06MB4926.eurprd06.prod.outlook.com (2603:10a6:803:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 15:12:03 +0000
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::e8ae:4899:d804:1972]) by AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::e8ae:4899:d804:1972%9]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 15:12:03 +0000
From:   Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
CC:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: XSK + ZC, shared UMEM and multiple Fill/Completion queues -
 broken?
Thread-Topic: XSK + ZC, shared UMEM and multiple Fill/Completion queues -
 broken?
Thread-Index: AQHYq/vrlkfuE5kyEUSmuFLRiJIgrq2mpNGAgAAB4oCAAAIqAIAAA+wA
Date:   Tue, 9 Aug 2022 15:12:03 +0000
Message-ID: <2A83ED8B-B369-41D5-950B-8D46217594CF@outlook.com>
References: <6205E10C-292E-4995-9D10-409649354226@outlook.com>
 <CAJ8uoz0a_q8T99=rHny2L+wVUgCd0jNYQd1f=LLd-2WncrAiuw@mail.gmail.com>
 <CB1ACD33-ED8B-44FC-956A-36662D54D0B8@outlook.com>
 <CAJ8uoz3-vC7RCU3gG=CWTT6=z_r21G8ujo9eGFzfiVa0EPfMeA@mail.gmail.com>
In-Reply-To: <CAJ8uoz3-vC7RCU3gG=CWTT6=z_r21G8ujo9eGFzfiVa0EPfMeA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [Fd3nrPirsfcWRYsGZx0RDWXvFXvHOH9w]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d9182aa-ac54-4416-d25a-08da7a198438
x-ms-traffictypediagnostic: VI1PR06MB4926:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5lLAH7WEVauHlMoB+m62kexMURIr33AeftGiEi8X4bgMcB2yAwM61yMD1oCuANGRbypIOStuAe9nHODFvdPLREzgknIeVnugtZ01SQ30+cR91cmI6spvCP2mR6tpH/6xafGLyCh0k+iwQf0XMJ0ONTykMsxb9yt9QunYbpEDLveqJLK7JJKgzQoNK+/g2JbSjMlKeSBvPTtv0qjJAJjohC1CMcf/SWYfsMCxcTDmaxm1Z1I81we5KSszXQ0SxgevW//A6+gmShVmP6G3dmoJsx4J2DhXbnJX35SaMC6+M/vQjlaSuRCc5sGGpZkx7eJMZCGxlApbVxZ4NYteHNSMieKLEurtrzUPPgLbQqH9qeJACZxdMqJCSW7kRBwlsvU8i+5quBl1d45zLA2KPEu7AMyhEaQePJm+GOJluMjC9qqb6RMVR6dxSdioc8iPUaloqu5gchrJeyq0pST3V1FxaPxJ6/nVaSw3R9KLrhvbLwneKP9LD3XkOTSFfFtvdchwH5FyIqvV+uskfv+sSspPG2y563Ym96wrpq6vGyVAQmuMm2zc+IxLw+z67MZS8PMeiLgEKD9xYJUUhR2EaR9ZRyuzfKvUk8f4jSylP5Hvuj/wlZZ/lz2PXCuHKnXwnnLqYwH2wZzdRwahRC3IyGlOfJTOImi0CCU08QkjDJnVwUFqzcs+XWQ6otQlv7ybjt7E
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DewUe5fXcF5JcMCGqjX11ytieRjXGXPi5K49cqoC8wP36WC+Q7ur9jQTh6XT?=
 =?us-ascii?Q?R7YpYinfdrYLRzhykzZxsWfmReqPXYMeked7V6KNAA16M4qLPVLJpCKq9ARv?=
 =?us-ascii?Q?6aWFPrv97RE8dWNDnaYbSh9uw1V9Evo3+k3hAQfGYHVfK3uSgM+yrejgNad7?=
 =?us-ascii?Q?751Gs4bc4D7Np/9kldGZsiaBZZmVIA8M3AkRzYLGOjYA/NQEJHzkfkschCAw?=
 =?us-ascii?Q?w+hOU5r/IYqeBB3mB/1mkl4JYNkkjQDhDRcuLTupfk6t6bCPuWJUoIaICYOz?=
 =?us-ascii?Q?SpTLJUuqA6QA4F29kBN6vU3l44N0teVGPEj4YW3jDCvRXyAmglloUekny9gF?=
 =?us-ascii?Q?cOm4mZD1m4mklxG+Sfqwq8QSExoZ2J5nS+1aaSnGrQH3pnp/77zGFSgTmr9T?=
 =?us-ascii?Q?9U1ML2ZTEk48G6IYnY2FwWqwVH0D2zm5W0kvFLuziEWRosf5vkhGnsHnOiy9?=
 =?us-ascii?Q?6Aydht+tvCFZCcOZxlcFrfCZd8SHCicKhLT79kO3eu/jGepP/4heUAG/EmAI?=
 =?us-ascii?Q?Wu3YvyEMNc6EwO5Bw2OZcoeVDWsIPrnIk6sbzwEfkftp7gb9FSDbXaqbcXrx?=
 =?us-ascii?Q?EiaRpRz1pf5+7ok9iU+bFmYtwYHVJ8qdeGDlEw70v9EPlK7L2S0B9/Eg62ZH?=
 =?us-ascii?Q?0VqtI+SzBqgobgP2mOeNDKjxpyKv/7VlngfRcFuMvfgsHPD9GjIXBTp7zi5r?=
 =?us-ascii?Q?CLDtxSsI5eI09edhmKAaXeyFrIDOiIhCMuAjEx1/deN4myWab8rm0+fhuXYx?=
 =?us-ascii?Q?BMVjXGjiWdTZJLEq1YgS3+Obh0HOiDlHTqlMyjf+JzHXzxFjALw+wNBXmHXQ?=
 =?us-ascii?Q?zS5PAc7Jsxkaidwh0ZcGQh7FVqBsnF17WR5yqvMXjRdfQVIcj2i8GR5Do8xx?=
 =?us-ascii?Q?Gjb3vYzdA4s8cUEjkcL1KHhkqJwZQKDisj+PSnyCbXo/miNt8mknqTFy/DkI?=
 =?us-ascii?Q?t2oI+sFXWzUCGwN1t5Xwb8LVknElUu5zWGNZycbXAjCw9mQFn+a7aE+btfc9?=
 =?us-ascii?Q?beMHTHvP0VcMkvFPu/YrLDOEaRAa3GEiaieDPmImMSy4FgKy9ZO33F7GO49F?=
 =?us-ascii?Q?x/5XlmtlAQNQMrFg1uYKnwq3/TuG57DQW2qI63WwayAaVeSCYtXsi6hw41Ff?=
 =?us-ascii?Q?+MMVXGAscbtWJ7pMTFeh7ptOx0cu+q756f6qp8Z8KipaiZcjNw5jwnLP9t0V?=
 =?us-ascii?Q?WoeDp3glaWYhN7yfH4JMhw8CcY6c3160BUQ1L1W+zRt7GwsVBnWG4ERHsQxc?=
 =?us-ascii?Q?gbS5hDmgJ1PlCj3Il9S2bMxIeMzybPQmUghAlmUuxL1AqGDIWKYAKLJQpC6i?=
 =?us-ascii?Q?9oI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23C450D7A5E5D341A12256130D556AB3@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7684.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9182aa-ac54-4416-d25a-08da7a198438
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 15:12:03.7277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4926
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



> On 9 Aug 2022, at 15:58, Magnus Karlsson <magnus.karlsson@gmail.com> wrot=
e:
>=20
>=20
> I can reach it thanks. Could you please send me the command line you
> use to trigger the problem so I can try out exactly that on my system?
> And I guess it is the "multi FCQ" build that breaks.

Certainly:

./xdpsock_multi --l2fwd --interface ice0 --queue 0 --channels 4 --poll --bu=
sy-poll --zero-copy

Hardware info:

# ethtool -i ice0
driver: ice
version: 5.18.10-1.el8.elrepo.x86_64
firmware-version: 2.50 0x800077a8 1.2960.0
expansion-rom-version:
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes

# lspci -s 03:00.0 | grep -i E810
03:00.0 Ethernet controller: Intel Corporation Ethernet Controller E810-XXV=
 for SFP (rev 02)

# ethtool -g ice0
Ring parameters for ice0:
Pre-set maximums:
RX:		8160
RX Mini:	n/a
RX Jumbo:	n/a
TX:		8160
Current hardware settings:
RX:		4096
RX Mini:	n/a
RX Jumbo:	n/a
TX:		4096

# ethtool -l ice0
Channel parameters for ice0:
Pre-set maximums:
RX:		16
TX:		16
Other:		1
Combined:	16
Current hardware settings:
RX:		0
TX:		0
Other:		1
Combined:	4

