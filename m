Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8555164C4B9
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 09:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237680AbiLNILf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 03:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237669AbiLNIKh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 03:10:37 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2115.outbound.protection.outlook.com [40.107.7.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7BA19290
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 00:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvm3e6i/MVmhDORqSeKMjWIGvknIMsIpkNyHYS19uiGzUxEeq9LpCiDrM6vGsVD+13Arq/GFIakiL9GNFElMdlbXT2Pi+uj5d+RjkGNbT60wpxPF1qW/6DGpAbjap7aUKBKbNEjzB2+2H8sqANp4Ot9VjafOTadCmg1wQoBvw/I1f0B/HfZ60p4Ix6BUhc+yMvUmW9iHsTnmRypk69VDQM2NjmyDsF/RbSK2i5FdDYJO+Ijcdlf9LrJUsMVwU4JzJ8BelAzqKLcFRUcJVAa5yPQ3UnXfhd6LWW56J5HpADOwnlk1WsPzY07GIh/8SGXsy2lwBWS2AbRv+kW4cCjyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne06PS5vihoaXUI35gE3ub0Udugx83feLHNP1nT+Olw=;
 b=fWeLozKAuLQfQ1+H6BceWUyoendnqQIuZS1/5uQMC6EviHdyOWodiUjyVDlbyozkcQjprwMwhMuTJX/WDRx/yBdV4rkSjENSzMcrKmZq+dsOY1p7LuIyNwNy/K0LL4hcXiADeCjWc2mcyRxZT4UQNhEDu8kFqYmWXujjKjtYAbRIxPE5m1REMtHTl3bfYt21IJsx+3l0FZv5vgrNaA5QuvecVOhxKThjtkRLLwjcWAC4IIj+uKk46slzjWHYIU+2j9QsaVe7p412BhTkRCKXn9itehvlNMsaMtb5AiIBPAZV4vDF7HcTY08NVTpbDhtGxkapg79BFIfuJC0b1j2tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne06PS5vihoaXUI35gE3ub0Udugx83feLHNP1nT+Olw=;
 b=NNpI3f81o1VNhAExqghHZmIPAWlTH4wOfl5oaHsFtxU3EwJw/w77attvON4HJVm0UoViGHx2kNvmVArKd9QMpomXrPlM3pCU0EwulDFTJTvOALP0E/Lf+SwJviXz67h9I7x+KN8WlYC8Nwy10L7fS/wvlz94FKdRQEOnxMkqGaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com (2603:10a6:3:6e::18)
 by DBAPR05MB7414.eurprd05.prod.outlook.com (2603:10a6:10:1a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 08:08:18 +0000
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7]) by HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7%4]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 08:08:17 +0000
Message-ID: <4c094424-4ace-86a3-ffc9-0142b62b7d27@polito.it>
Date:   Wed, 14 Dec 2022 09:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US, it-IT
To:     xdp-newbies@vger.kernel.org
From:   Federico Parola <federico.parola@polito.it>
Subject: Why choosing AF_XDP (busy polling) over DPDK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0169.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::16) To HE1PR0501MB2603.eurprd05.prod.outlook.com
 (2603:10a6:3:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0501MB2603:EE_|DBAPR05MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: c090fc55-858b-4bbb-8c27-08daddaa5b52
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ss7dbfImCzDRukqJXXSy1QP9/sVB2o2B9ly0coOpkjT8WiodobPpU4GIOb+ReM5EgBMWi9B2FqzZ3oIILV9N3rXn0KfvlvHLgCYnijypNlTigOz1b1v6nZ3EcwEnDJfO4xhZBKbPRTsPSRkQhKOGRMAoR0C/Q+L8XrbWCpD19RsNwpDa8C4XC6W0KyToqhdVG68I+fEjOfgs4gnou3CkYwRR1RE21+3+plKAwGNeqZBO7PH6ly8B+ulNFTr2TUEYdyjOkBTC0uZH6iuWsr3LuBCvW+4MrcAwqlLL97APn9gRajIU8WPESh4SLDF48TkO/zkGAvlswdWIlH8kq9nA2fxVlA21JBlz23RCzWKq08sV7UneZZ1IC4xy7Q2FfgLxPEHwEr3GP04i+IrP3BMAvvFdipPSkE2q5UqSV5M7G/wpIdlv1AivPCx/a/gkUpgly56Uf+W0QbQjua6G7Nx3+EKExsQHRcXf8GRt0DuwVAREKQeT6fJG1tk3NL8u0ErnbrXinfpKdHADhDMnWB1wj8sOF6ThsZdgM6RJCgAykuSByUewPHcx5p+jey1upySyWUYennteqP/L14kkgGP1ZGMAgyEDloZXlv2TN4tpvB2l0/eLWFdv4t7TGwxPUiNtrimzfg87JGM9dpI2SCQjDv2DumdSDfzSK21Bcm9oOfHC472Ylf50erImi+XoiYzT69PcdFrqbwng9S5JfB4vA8zuUIgOkbmTST63ndym0fU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0501MB2603.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(451199015)(2616005)(31696002)(86362001)(558084003)(41320700001)(38100700002)(36756003)(31686004)(44832011)(316002)(786003)(2906002)(8936002)(41300700001)(66946007)(66556008)(5660300002)(8676002)(66476007)(478600001)(6506007)(6512007)(26005)(186003)(6486002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c09WcHJVVVRURnpIMldJenM0Zit5cjZaUG9taUpObGlHL0szZ2JtMUhYMVFF?=
 =?utf-8?B?UFBqamwwM1pxQmdSTmZGZG5UeDBUQkRsNHFPSWRLb2Q0NnhORW5HZUdqeGVv?=
 =?utf-8?B?bUZ5TzFBbXVXUXFrY1dLczB2K3dTd1VSclRsdkhHcDJsYWw3V0ZjMjQzWXJp?=
 =?utf-8?B?WXk5cEFXSDM3Tk82ZTBBcFFac3p6NUZHZE9QRm1wd2Rlc1FSZWp4YlhzTkNv?=
 =?utf-8?B?SU9TL1dpMFJxdFhpZDMyS3ZiSVcvRVhNWjFQS3BUSVBuTFQyNU1YMGZYNXNF?=
 =?utf-8?B?c1VDZldodWd4aERFYWJjeFFIazdaajJiNFdNQVMvdDlEaFZGWWFDWGlXK2Jn?=
 =?utf-8?B?VW9lMG5ldm1OUnU5dzJqUmZaLzVBNUtIY3J2RXR4djREeG9uT3dRWk1IZGxF?=
 =?utf-8?B?R1hwOERCb3JkemFCTGM0cHZ2dkovUUJTU1R0ejAzRGFHb0ZJdVVERVhjSit5?=
 =?utf-8?B?SXVhaStBeWN2STg2cEEzYlVsVU1EbG1CVVF3di80STVjMGl1SXRkYy9veTVj?=
 =?utf-8?B?SU5YdnZiNEZHTGVSMFZla1BneE9xSmJXNzhYeENQTEV2SmxYa015dTNsbUpX?=
 =?utf-8?B?UEtCQ1IzYk5tMnA1eDVXTVRpYitxRDlSTklCM1hEZ3pNb2FFNEhRK0k0Ym9C?=
 =?utf-8?B?Wkw5TTlxMUFBYnJONVNJR0h2TzFiWXhEamdBMFk3Q29aMzVsZ3Yxdmo0STF3?=
 =?utf-8?B?V2I0akw2ajRMNEdWWE5Od1dEUFFUWXJ2ZTlaZkRMNzVjcXVmY1V2MnZ2cEZZ?=
 =?utf-8?B?b3B5TkVJT0hwL253cUlJaG56bVdualBxK01lYzJFd3Nya1p2T2xxbmdxUzFn?=
 =?utf-8?B?a3QxajVKYjN1eUY1ZkpyTTd1Vk5wTkZkNzV3RDNteFlnWDkyOGZBUXhiamY2?=
 =?utf-8?B?RWtQRG5ZZ051VUVPaUJvanRJOWdRaTdUZkpReW5lM0xvWnBYYVNUUXpjSHNa?=
 =?utf-8?B?R3kyOCtYSkpvWmJRRkRWRzBMV2JrNThVWnZraGtiKzBMV3dlU0krQktaVExu?=
 =?utf-8?B?bVFMNGVUZnVTM3AxNXJQYVFnTnBLcGVaRDlpaVhsc2FMWUthanFMdlJUWkpk?=
 =?utf-8?B?YkExWGJPZHZMdGlRVVdUejNzZ2VWRnNHMFNTcldqS0xqcjJrQUhqMWdRVnMr?=
 =?utf-8?B?UW9zV1MzUjYwVDN2NEhtUGp4VGdCdENmZnBERlJYdFNwU095b3E2NTFkdTZU?=
 =?utf-8?B?Z3hOZ1QwS0N6bFd1em5MV1pzZ3N5ek82SXArRzJid1didXRHVnpMaFBxTE1J?=
 =?utf-8?B?cVNCQVNycnYxY08reHB1SXFzWkg5T254aittdDExWk00Q0U3enFmYUUyWnhZ?=
 =?utf-8?B?cFc2VFVjY3ptWUI4VzM0MkM5enhUN1RvL2xyMGNYWXdZblJ6Z3FVSjdNeXpG?=
 =?utf-8?B?TWkvS2FRdHpMOUlSL3UzK3JIcnZFY2xTVmZsV0Y0emt6YmZwNDVVbDAwUGU5?=
 =?utf-8?B?b2VFb0hCSW5nbm9jOXVWM0FYS0dUbGlRNHlBL2lZaWdYdzNnZGgzc3Y1R2k0?=
 =?utf-8?B?c1g1WmNDcWtuRGZCOXRWaTh1aGFULzZsTlE2bWRzVDlkM2JsbEVEZVUzaUxP?=
 =?utf-8?B?dkk2Y2ZqZGJPbzVMVW9GRW11WUwwVXVZRm1FRjRyRmNJb0wzUHNCN2VkTjZ6?=
 =?utf-8?B?cXVQemtacXY1YjZEa0c4UmxncmRWSzd5N2ZRaUp1d29ZQ1E0SytzUUdkcER4?=
 =?utf-8?B?bmJVeXNqek5ZS09PeUJuNC9xT2ROdXNQaHVNYnJzbUN6WmxkSmVQdElRMTlO?=
 =?utf-8?B?OWxvRVYyRjFjNDJmbWprYThkT2VVZms2NTJ1dCs2c2F5ckQrWG5maUc1WThq?=
 =?utf-8?B?Vng0ZGtNWGd0MStxNDFJU01MSnp5b2hqN1lqTVZnR0hVL3krL0xWMTJYazRI?=
 =?utf-8?B?aXlGd0VENGZwbDA2eERlVkcvNXJOSHJoKy85eW9iYmNuTnRMWERqdTBPemtu?=
 =?utf-8?B?dzFNeFc4MjgzZEo2dGF4NURCMGh1VzZRRjBVUlBEazZOSzNmNTVVZHU4eWV3?=
 =?utf-8?B?bWZ5Z2lUc0JCODJMeGQyakNMaG1xcXM0S20zdTYvVitwb1AzSUFPd01FbEM2?=
 =?utf-8?B?NzFraTMvYW95MjVqUVRrQ002RHhSdUxpZUR2eitkWWVYWFgvTzJkWHdqQmxa?=
 =?utf-8?B?QXNqUkdNRWl2cTRja3VvMTFaT1EvTGZjcnFSNVRxT3A4RDdOQ3A3VDlnMjdB?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: c090fc55-858b-4bbb-8c27-08daddaa5b52
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0501MB2603.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 08:08:17.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56ujAds9vum5MqImssPIIv4ntiuYw0ShaRxILXAjxdzVmLrUQv9VKzL+cunmB96lq7lTMHhHh9X7/DO0K0dEpJyZn1cU4pMxUBWo57LfXyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR05MB7414
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everyone,
in a context in which all traffic is sent to user space, and the main 
concern is performance (so AF_XDP busy polling is the best candidate), 
is there a reason to choose AF_XDP instead of DPDK for packet I/O, given 
that the latter is still much faster?

Best regards,
Federico Parola
