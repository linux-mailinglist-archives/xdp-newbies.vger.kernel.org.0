Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9481539995
	for <lists+xdp-newbies@lfdr.de>; Wed,  1 Jun 2022 00:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240474AbiEaWdB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 31 May 2022 18:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiEaWdA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 31 May 2022 18:33:00 -0400
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2110.outbound.protection.outlook.com [40.107.11.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38355A098
        for <xdp-newbies@vger.kernel.org>; Tue, 31 May 2022 15:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moLg2jNZMDKbMNg4z9kB39Hs1z6oR6wiys7biXQ4DzBnsA35wZhpWny/7U3ILB3sinvUjjvBuPrV4+DgpeMj0ciOPCVYDKjePXB+Js2uSBcTf+IgTUF4/kG0e9rWdJcJ29IN5fRKf52jFMc+youVZpJCMIShqcyERXcIl068xSN5HNh10rBBe5XPmA93KUwsabGkux5AxIfR5ReRFv4RGc+S7os3vIYyUBdloJUfr+RUbvCTYIWd2JMIK4dybuCTC79ESUErNGu24d07g4vnPl7Eq8xdrAADJUdYRLbHKnFaLrNp7yjlHEqQFcjd2UMFSRz3AIZACY+tStAsCdRXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QivcpBG+IG3QzBKsazcmplhgpZv22nccUlUQGsKQD9o=;
 b=Y9G1aCpfLJjRSWNrbQHW+gfqmS9aDP5zzK7rfG7MzADuKhHkM1CU/4LkxDftzr/Lp9EohkGclG5xZUgxyZZswDhSgQkwq7gIGTZs3IEh8EntZy8iD/cSMLCd1RoZkfsU75tnSityVQyQMYwQVqFd1BLsUj/OKukYLSL9CrxLJ7gYfxmy/bBxqVuyY7cJKz46gePtwhHpfrytq13fCSxIlrVGnVw3oiGBja7LoJBtabHX1AEj1Zcq86piMu+T7qQW01w5Sr5GA54DVQqDns1xdT5P9Jul7XLMcYb+eX3magDRBPS3zVnjC8B2c4kFHFLeaknNI9TTYcVRuB9oK8b66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synamedia.com; dmarc=pass action=none
 header.from=synamedia.com; dkim=pass header.d=synamedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synamedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QivcpBG+IG3QzBKsazcmplhgpZv22nccUlUQGsKQD9o=;
 b=MrVLCGkoELQKWb8+iv7OHkvF3pshHMgBQk7oM7EkeDduSDMe0SlSTjNow+k+HIhHm+YrJC3NYX06coKtqaN3GyUToquOm3gyc8W7MFPUhm8q4UiXNeYlDIGLMTcKkCn4h4c5jYzcA1QaHoH78RSZ3sKKfO9G/mx38sq2NRveGmHiflFslRwd3rpAXHycBTg2OVH92HH9CtA2oOmmKIbFONaoe81pU1xBQsD/pz/04Ok+F3Chv5N5PXsm9YWvARVFmVDtptfjrK4FPno0NqVt0jCzxNFfX4o7dm522VJWS467zaiV3ZrHIjb6I3cG9ByvH9Q8cS5pyR991by7zSs/pA==
Received: from CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:159::11)
 by CWXP265MB4860.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:157::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 22:32:57 +0000
Received: from CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed49:990e:e66e:5f04]) by CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed49:990e:e66e:5f04%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 22:32:57 +0000
From:   Howard Lum <hlum@synamedia.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: af_xdp_user.c limits
Thread-Topic: af_xdp_user.c limits
Thread-Index: Adh1Oid4EV8J7JITTR2IMdor5JJcjQ==
Date:   Tue, 31 May 2022 22:32:57 +0000
Message-ID: <CWXP265MB55671EE214D9307E179AE3F3C8DC9@CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_ActionId=f919e9ad-e433-4baa-bafa-38163feaef6d;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_ContentBits=0;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Enabled=true;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Method=Standard;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Name=e305dca8-daac-40b2-85cb-c39a1eaa36df;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_SetDate=2022-05-31T21:59:58Z;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_SiteId=ecdd899a-33be-4c33-91e4-1f1144fc2f56;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synamedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73a741a3-712e-42c7-42ad-08da43558311
x-ms-traffictypediagnostic: CWXP265MB4860:EE_
x-microsoft-antispam-prvs: <CWXP265MB48604A46F2A35E0BA9ABA635C8DC9@CWXP265MB4860.GBRP265.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KEIDgDCyLkelbTYWGyXjXoMUAhoBaY3i3uIKOb7RrzHzCi0h4ZyqvVBz07V7osLZuGgFXFVmua8TC0/wjeikJ8naOjVSWTnMzQuhG1uFz2RyZWFO/GWGq+lmf4XjlEIkRpp6pnUXeiZZQshVqiALiF3MjLwx+fB7ZT86iM2yBKzCuZ4sPtzv6DoPMEWL8DY41/UTVzSz1HJa0ypDEfk9bnKcO7ClfwIKu+Q37F1Jw+XQx0sNt5JYprwBnSC0dUA09COn7vHqeUYO/mOdxg3Gv3x5nTTk2iz/gKJseqsqVkHDcge+4gV49esq6WZ63z7/D6CPKKC4/9NEO3KjZ++EOYHo0vNq2Pq5D2Ga258XoJLoOw17+MeD5YqqBRnFR1BkwM0NP0iI/ZdmD0ymTKNBmEqqxinaMMwHYCq+hM1yZUcOkphu+s7G5EKlXxbiaGLE6BsDvHp/wH0sZdkRe7lf+USTkuAyxDzAVG9CXwL5MKw1Lp8BKKNoKULmmwErPQWaIgAbA3uepPSAUQOZMWLXE0Ugr3QWSgnX1JbtD7yIXWdpc2iCuMe8aiDmbbseNFpkR90SdAZzkqrS4bsAL/6TyoWvIW+lTQEQV5gbvRGZix03Z8Lw6VD3BhIrEGDhg53hlUZiAreaE0B2WBGAE6PnTF+nnFdB3sTDLP0U8bkDv3Pp1TW3ZjwEIXU/28Zcg1h9NNh9rXdG34xYIImJZwiWjy6LLQJXWLWU6dU5SRnHr/2xCTbn5XgI7YTk0ggHzRtHwx4bPa6xatDZePsZB7sSdpDcOLxshwBYcMDtQ6jmdkg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(8676002)(4744005)(2906002)(6506007)(6916009)(26005)(9686003)(316002)(55016003)(508600001)(966005)(5660300002)(71200400001)(122000001)(86362001)(38070700005)(186003)(38100700002)(52536014)(8936002)(83380400001)(64756008)(76116006)(66446008)(66476007)(66946007)(66556008)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aYVdhd3KLmHZ9GwF3afApmXM2PEOTfmDAwWnjuwDt9N2CEFw1nabqTbKfDFe?=
 =?us-ascii?Q?+ajPy6VQ8PFW+QLdDAU6lrHWNV6xGjEFFue+j4tLn9QEhjwoGq6QZoFUjT6b?=
 =?us-ascii?Q?o/2etgQ5M8+ysW4EFENW5c/pH8MmkZ83Ghx40q/IOZpcZBbyAjosZuioZVOX?=
 =?us-ascii?Q?IHIdmu27PyPoI8uZuP+4NyTBC151FZ/rn7Z9YY1U1yOwOMSXQ/W36QPG70a9?=
 =?us-ascii?Q?IMMd5YlZ5IVUlUsGOy8HJBJ+iHAAl1O/9Saq271w+FaPHpHZ7MbKJHutp0eK?=
 =?us-ascii?Q?XH1X9kmrB4sMl9O12clnpMnY18YFpxORaPbqYbh5AGawemh/MgJhxTpXmzdd?=
 =?us-ascii?Q?cy7Yilp4aiYDGeMRHwmreZVoA6cPYURqcPJig3BDIW4PcN3Ey6HMoMRtfWs4?=
 =?us-ascii?Q?SdliiQDVEcSdj+FEn4dV2+yIWpMyBo+QOf0sWTTratanvRDERi8sqA7Gt79m?=
 =?us-ascii?Q?6xXvfhW7LQHhv34lTtkiNng6yQdtF+m8Jzb5I3ybt3nIHw7siqrtZLKWCJxw?=
 =?us-ascii?Q?2wx4nf1ls6XkyE4HMpov03nnd+xep2xnnYq5X2F7X2H4fxj847ZgaXl8qQ+N?=
 =?us-ascii?Q?VtBAFip98SKG8PLCZC6PdLnzJIFdjyMEJxhswYpR31dBkP0J2cSUfFLG/bEp?=
 =?us-ascii?Q?kQ9MhPNWkGeajo5DZfdkEbgoWw5PWFQwGhdOhsSnQxhGAC9pfZjODwYTF+Ti?=
 =?us-ascii?Q?Z4aIR3rd4ExqiAeo7ljc13Zq9h7Gs8pBd8JOl8PAG3f48sUKc+eytrUcQ5q1?=
 =?us-ascii?Q?5aDLh4ER6kabgOX+Y+WU498+/WstJMlmuXSS2mK83XAUaEBQMDAmnT8em0//?=
 =?us-ascii?Q?TPNR72odLsUpH0qF6cpQ2JJK9fOQ3jCNvJ11sVeEaqQlXqnaisCp+qydq6UW?=
 =?us-ascii?Q?0J9fbaBIB7dCBOtjVKPOaBstFaWCszJaCNz+sSyHkY7A/6065s7Sy6grLh8X?=
 =?us-ascii?Q?YbaoxFSs2rwdMjSkxTCBrwYmX7sxR6Bj2Rb7B6lJuj9RaqUcjisS7/fzN49R?=
 =?us-ascii?Q?ujLBAuDrgQrYwweCV5YJBuGAwQ4BPgiVyIukJGS37muIWTsFOHWsKXUsjpHJ?=
 =?us-ascii?Q?dThIgkUWCnjJjkdK+XNdU7l2N1N6/apiCp1/2WwkHynm5VwQygv3wDv3V4M1?=
 =?us-ascii?Q?O6zPao0YPmUr3h86k/3apWiLhs/iZdefSPK94VGCJw/ELDLdh+I/IrBODWWN?=
 =?us-ascii?Q?gkWaqVmo4XQ26HGeLMpR4vbu0sLn2TEgDmajixlkTyYqgWaE73iAP2cjOXGp?=
 =?us-ascii?Q?fw3WssVZfdES/eNqYoyXkYUKQfidw6PfQkn+FShW2w3qzCwXn2YxMAvISTaF?=
 =?us-ascii?Q?ts0NRzzte19FIU5wATXmLhO86ZZz35wFRtEuhKmwYw8vYeYgIdWMzVHu1HdC?=
 =?us-ascii?Q?lVaeGv5eqsM3ur7qUvdUC1teVh7xtXT0tGlWNd/tSIojFY2a5MmiiJjlnM70?=
 =?us-ascii?Q?sdKfvo9Iv/yUkLxvVyP5Ol3uRLVESI8ONvLyB0odD6285HS5MvPPuQbPHKo2?=
 =?us-ascii?Q?4ax3USrA7HP9N1FqUYgmmzoqt+Zg7hxAwPOO/1pjiMAfMt8ooomPbC8D34u8?=
 =?us-ascii?Q?IHz/LjHYeeC5nhNXzgdQhCLAf+EZMn6yqTYtILdieh3pXRQ04YbbZu7CsEP6?=
 =?us-ascii?Q?Lb4WtiHfoYeGnPvSZi1cYhKksoJsluZdi8rYlItLVSGZnMslyM7Ij4bhssBR?=
 =?us-ascii?Q?WffdqLP56et9w/HIqv/eDpwZ4HeIfKBxOl2BFAWQh4MG7FV4au6AG119yONF?=
 =?us-ascii?Q?wm3kL1z6AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synamedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a741a3-712e-42c7-42ad-08da43558311
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 22:32:57.6105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ecdd899a-33be-4c33-91e4-1f1144fc2f56
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Br4ccceWVv1HhRKkcMUaJFMtVbozVcsX0y+ggEpJEmMaKLwBFdbA1zRILlPxZsFXvAmMWeA7llOg009NPB1Fvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB4860
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I have some questions regarding the limits in
https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/a=
f_xdp_user.c

NUM_FRAMES is hard-coded to 4096. Can I change NUM_FRAMES to 65536 to buffe=
r a large number of packets?

FRAME_SIZE is hard-coded to XSK_UMEM__DEFAULT_FRAME_SIZE which is 4096 byte=
s in my setup. Can I just change FRAME_SIZE to 2048 to save memory?

XSK_RING_CONS__DEFAULT_NUM_DESCS is used to set the rx ring size to 2048. I=
 have a NIC that can handle 8192 packets. Should I adjust the rx ring size =
to match?

XSK_RING_PROD__DEFAULT_NUM_DESCS is used to set the tx ring size to 2048. S=
imilarly, should I adjust the tx ring size to match the NIC?

Howard


This message and any attachment are confidential and may be privileged or o=
therwise protected from disclosure. If you are not the intended recipient, =
please notify the sender immediately and delete this message and any attach=
ment from your system. Do not copy them or disclose the contents to any oth=
er person.
