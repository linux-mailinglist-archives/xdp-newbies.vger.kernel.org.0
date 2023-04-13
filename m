Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D3F6E04F0
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Apr 2023 04:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjDMCzO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 12 Apr 2023 22:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDMCzO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 12 Apr 2023 22:55:14 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2118.outbound.protection.outlook.com [40.107.244.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F457DB9
        for <xdp-newbies@vger.kernel.org>; Wed, 12 Apr 2023 19:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jd9obPI8lzZ7mIOGYo6KgLE67JoNpcx1sowa6FacSeZ4Tv7dbbi1InQIifO1zXUGJaTwgPW1MaIvxUJ5Xoq1kHWrWiuV94rZMY46ZgQYPmlazsfeOCKYTtyJbMi1r63w+sQglPPT+x0ljujGD7Q/yN7feOiU5+V84ZRCXWe5bvJK/lEBiJ3eqQzm0p/xpbr9F89gBjH8fWRN7TrlVnqQgYx1egUAOb8vaEReP0w1YMnsewVsr102nngot3RwHlVHI/WwydTDprqXGTnRiOU3kTe3I98WANtc3f8OCZASCi+fjiTYCaP76OJWOU3m6erPWuTGBsEliy3ABrroL2PQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c8WQawnl/J6y5sPYOAyl+iy2TyG+Ne89FU60vyiwuw=;
 b=Md7PtWIa2q3xJPjecJe7ZFUE6HZ7fgHM9Gt/gQXGOrWPO4KlWl1I3rP34OZOGcT7DZAgS6oUOA0qskwETOS9/lhILsYifu9nLyFQvGpgTtCwo//vLUHsc6V08BqhknL5k+yxEfVG2JvnHxZq+tA5O4GnQhcR+gmkUu79C6kaJJPFkeC3KcpDyg3qK7nh2nvEWhVtU/3ZWeppFeiSwDlEPv/rHD+dGrKuWrz6gTCFCIvp/wcckA7NEPq9Wzo2iW481Mn40/T3M2LcBU61Pi3ubRIoyRpZdUHD3wnCkJl4WV1/wbuHnbvdJvTwk14kWtv2ClcbRsPRiYFerb0lnPL2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs.rutgers.edu; dmarc=pass action=none
 header.from=cs.rutgers.edu; dkim=pass header.d=cs.rutgers.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.rutgers.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c8WQawnl/J6y5sPYOAyl+iy2TyG+Ne89FU60vyiwuw=;
 b=tIOVYA4IXfOC4M1x5kjfEt9F1ANHQ+gJ1+JUYhimpHADZP7R8faDUHMTsO//SW19n9vlm20wgZsmOklrG+vGicTrQwnE42A0g5zc3mvWeeRp4vrlac6hoJvCTkcgcfYUId7z3nKigk0oampkWHmH1vCkmUx8X/aR1oMvKOlfAuE=
Received: from CH2PR14MB3657.namprd14.prod.outlook.com (2603:10b6:610:6c::21)
 by SJ0PR14MB4549.namprd14.prod.outlook.com (2603:10b6:a03:380::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 02:54:41 +0000
Received: from CH2PR14MB3657.namprd14.prod.outlook.com
 ([fe80::2fe6:440c:3c5f:fa38]) by CH2PR14MB3657.namprd14.prod.outlook.com
 ([fe80::2fe6:440c:3c5f:fa38%6]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 02:54:41 +0000
From:   Qiongwen Xu <qx51@cs.rutgers.edu>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
CC:     "brouer@redhat.com" <brouer@redhat.com>,
        Srinivas Narayana Ganapathy <sn624@cs.rutgers.edu>,
        Tariq Toukan <tariqt@nvidia.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Question about xdp: how to figure out the throughput is limited
 by pcie
Thread-Topic: Question about xdp: how to figure out the throughput is limited
 by pcie
Thread-Index: AQHZaO/Y4WxN41IpIEShYieCMn8sWq8jInsAgAVtBCX//8IoAA==
Date:   Thu, 13 Apr 2023 02:54:41 +0000
Message-ID: <7C8EC844-D2DF-4980-A178-30E2719E3575@cs.rutgers.edu>
References: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
 <b8fa06c4-1074-7b48-6868-4be6fecb4791@redhat.com>
 <CH2PR14MB3657EF09F9A2BE7C08E4C9DBE3989@CH2PR14MB3657.namprd14.prod.outlook.com>
In-Reply-To: <CH2PR14MB3657EF09F9A2BE7C08E4C9DBE3989@CH2PR14MB3657.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs.rutgers.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR14MB3657:EE_|SJ0PR14MB4549:EE_
x-ms-office365-filtering-correlation-id: 414ed3cf-3905-49b3-561b-08db3bca6dae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+zgLgEVRjCZ6mybF9mFShOiSIqqORz8KQxqbFvFL4G0h8GpIAHWCX1w5iibHKPgWmM/v4c5WvxyvxIxWb+04uy+g1G1yBCpn7cMzZDkc+eO7PrbuJ2PvFS+GnI1xKwV8kv1BQ3U8+QMeQ1C2JjEyNc/8Wbjuu//YoeQmMxiFdFSmj6MIVDmxJ0xwbs3j56IVYtWb07o7CzNSG0xM/DOgT2SmnmKYnKfS/At6XLsTJ2gwMiTQtuptHX1xSjrjniQ5fgmseczwvnocMu8dNxKLTC6QLsSwVcZWd2cU0BsH/qKFZ9b2KCqGtOXNoVWFJFDgmbxKsnfGfSFQcX1ES56zOZu49jEpcDqDZrmMix8JC4jR5+EEQqH8Wh/0qNej9C4k5Y5j+oions/kxsUgq/SKy4Ok/JzwpzXI1VJ0Hl6xBMtdsd+Iu7MpzkXlIgg08tKg5tqNxOKrkcbV8F2r3CNxGk3s6LyvUZqkRhJKcXX4HWAuJ7lWoltD+SWlZ8gBi6SPZhIkhDicxPV2VHmz/7NJ+5vbscmC1R7bSjuSIU/d/9vB6fTWYwBD3nM3rcO0s000mj18WFy5DyBnSSReAhVYUTbvOG9XDSMUZwo44jH+eqhXDovTPXsjJ762KM2+Hh8IJgso6pusPnWeZSSOo3HNj3fGGuskO4NGeyb+VDZNQY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR14MB3657.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(2906002)(8676002)(91956017)(76116006)(8936002)(5660300002)(478600001)(41300700001)(33656002)(786003)(316002)(66946007)(64756008)(75432002)(66476007)(83380400001)(66446008)(66556008)(54906003)(45080400002)(6916009)(4326008)(71200400001)(38070700005)(186003)(86362001)(966005)(38100700002)(6486002)(6506007)(53546011)(6512007)(122000001)(2616005)(41320700001)(88722005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnpYaFJxY28rRWNWTXFUcUc1ZTFaWjdVcHZETWp5bmFZRllEZm82Tll1Ky9w?=
 =?utf-8?B?RDR0UUVuMWlML2xJMmZ3T1A1TDJFVWpzYmtFYXc5elk2SXRKM0pDeEVWbzVR?=
 =?utf-8?B?UFdJc0V0T25DMmM0ckZ0MWxzbkJzaFJteFZFY3g0c2pCdEtRZjRwdFEwWm1h?=
 =?utf-8?B?SHplVExGZWtyMmMxbisrT0JQYzVtYjJWcmI4eUJUc3Y3MWErdnBzNDJTUENr?=
 =?utf-8?B?L2RTQ1VBZGtDckg5SGwxRUJBVUZ5Z001V1NRbmNzbVczb3VJSWZydVcxajJ0?=
 =?utf-8?B?dUZoRGg5Z1FjaWpKZlFVaW1JckRFRjJLTkd4WHo4VzNUaTkzMGpjcmZJZ0x0?=
 =?utf-8?B?MkhOL2hRdEQrakNBZTV1by9Ra2EyZG9vMWkwV0ZtYVRYYlN0Zy9jL3ZSSmdp?=
 =?utf-8?B?N3RlVW01VFlxQk5XZ0tkOXBGRG5XcHAxMlFtT1Q2eWprNHA5dVFSVkJGYTIw?=
 =?utf-8?B?UWl3eUt3N1FjVm1SOEwzQ2wvZVNHeXM4cDc0UWw0YTU5UkdRQnNva2lkcG9U?=
 =?utf-8?B?MkFxbElLWHB5WE5TdGFtWUlTeGNoMzJpWlVrMmZuVWVkOVpROEZ0bUpWRmFW?=
 =?utf-8?B?RkM2TWxQdVYzbGZDQWp5UjVQb1Jqa1BVUnFPZjJkV1JvQk1SUW5IL0FDRWMv?=
 =?utf-8?B?QUxrVDZYODFQYTM5SExyZk1tNTNXcU9TdndoOFhxdSt4UFMzWm1mSk95T1ZJ?=
 =?utf-8?B?MUt5dGpWelhaSEJRalE1K1VoZHZLaTdseHVLRktZUkJZR0IweGplUWVZWVFX?=
 =?utf-8?B?cmI5aWZ3ME56RTFxY3hyOTBndmV2cTY4MWRhR0VUdUdHcjJxUlRMc3Qyd3lh?=
 =?utf-8?B?QnVjeUl5WXB2bkF0bk15bmlmM1djaDBaRnZZZXllamRaZ2NTWEtYbUFVSTRK?=
 =?utf-8?B?clNOVTlpUHA5cTJFbi9NYll2bTE5UGxyWWdkeEdwR1lGNUtPanllbmFZc0dS?=
 =?utf-8?B?RTlCMEcySVpmUWVzU2FPYTIwSSsrVkNrTk5zWGZacnY2eVVCemEyRTZwUjhD?=
 =?utf-8?B?SklXVnRZakFYdWQvT255TFhDTnRxeEF6Wi9yc21nQWNlY1BVQllLdndIYktD?=
 =?utf-8?B?UkcwWGZFRmcyN292ZS9HS0Z0UHdvSGRma2Q2Ty9JRmw2TVE5Y0F6U0VIckNX?=
 =?utf-8?B?bkx3VUdQMTFJV1YvM1hqaXU3aU5aZ2pGWUcxSURPWXA2MndPRkhZUnJiZ0Jm?=
 =?utf-8?B?NlpPNnE1UGx5ejQvZkdEZ3M1QnJ3OUdCUFk3OU5oKy81dW1Ud0VmQU1qdXB3?=
 =?utf-8?B?SUhPbXdJS3N3a2Y1blR0M1dSTlBQUjJBbStCZSt2NDdJYWk1V0llVDVNcTJk?=
 =?utf-8?B?VmEwbno3TTdDa253ZXVlMlR6d0hPM1Yyb1NGWXNSQW1OMzVZNUhkenhTMWFJ?=
 =?utf-8?B?RUZ5ejZOYjFmcXhNVmNjazNkbjBkc3RJcXUwbkVQYy81YUsxdHd1R093bFhY?=
 =?utf-8?B?VENmL3dIRkhaakhGMVJMSTJUU09WZUpvT2lHb3ZpczlGeGhZOW9Jb0ptK21B?=
 =?utf-8?B?azRpaEpBWjc5cllkYWVLUlMvTzZYUXZIc0V0UGxKeE5GbHdqempqYVcwbDVN?=
 =?utf-8?B?dGorZkt2cFhkamtvN3Zmd2xtME12emNNVzQxVWtjOWlhb1JodnFrUE1lSWRN?=
 =?utf-8?B?cWhOcHFGOU1zVEtMbUY0RzNScHlJL09iTXpJakMyRG9wTFpFVG5rSHBLN1hx?=
 =?utf-8?B?R0Nmb0RCTlI3THhiaTUyaDUveXdqb3VKVWV0L1NZQ3RVcVVMelJ0aVdZTzJI?=
 =?utf-8?B?MlVMSG5OMDJHOW5MQWNYOHlGWXd6MmxoMWMzcnRFUEg1YWp4c3AzNUFQZ1du?=
 =?utf-8?B?U203T0o5WTJoaWdDWG5BeEF3KzE0bnM4VFpMNlExR2ZQdEpmcE03NzFRVGVY?=
 =?utf-8?B?TzJ2RHV0eE52ZXEydkNZb3IvTnVGbm56d1IwMnNpbEpVeEFaemp0Ni9OT29Q?=
 =?utf-8?B?VVdBaGl2elRDRFRIZzZXTkFkN2xEekhkbGtrWDNpdGUrazgzR3RWbHVzT1V5?=
 =?utf-8?B?MGxTYUJSamZsZExweVJLbEpHdXoyTU8wVXRCaXhjdFFxd2xyMU56bDh4M0Vh?=
 =?utf-8?B?ekY3U2pBR2x5ZWQrM2ptNkZsbXVqMnRGZzVPcUpYeFNRVHVkVkc5ZForeUFx?=
 =?utf-8?B?UnRvSmE1RnlKNi9xOGtzTy9yRHhtNlBjNHBnV2NjTFkwTlhTdE9xTG9JT0d6?=
 =?utf-8?Q?RiLgsv55p4BXoXpguAP+JQ7EpQaLaPgKh82NeBI+8qUC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C353A2B2A14DE45B95B1846A005CD10@namprd14.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs.rutgers.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR14MB3657.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414ed3cf-3905-49b3-561b-08db3bca6dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 02:54:41.2304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b92d2b23-4d35-4470-93ff-69aca6632ffe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQ/R2Hz8R6hsea4P44MaxZn3fMwDw3/eQLCI65N2PJbDtI74ROc0zEfM+rMI64H5Rr1TvBwbH84HXcdUL/ggPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR14MB4549
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SGkgSmVzcGVyLA0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCByZXBseSBhbmQgc2hhcmluZyB0
aGVzZSBoZWxwZnVsIG1hdGVyaWFscy9wYXBlcnMgd2l0aCB1cyENCg0KQWZ0ZXIgZW5hYmxpbmcg
cnhfY3FlX2NvbXByZXNzLCB0aGUgdGhyb3VnaHB1dCBpbiBvdXIgZXhwZXJpbWVudCBpbmNyZWFz
ZXMgZnJvbQ0KNzArTXBwcyB0byA4NSBNcHBzLiBXZSBhbHNvIHRyaWVkIHRvIHVzZSB0aGUgY291
bnRlciAicnhfZGlzY2FyZHNfcGh5Ii4gVGhlIGNvdW50ZXINCmluY3JlYXNlcyBpbiBib3RoIGNw
dS1saW1pdGVkIGFuZCBwY2llLWxpbWl0ZWQgZXhwZXJpbWVudHMsIGkuZS4sIGluIHRoZSBleHBl
cmltZW50DQp3aGljaCBpcyBvbmx5IGNwdS1saW1pdGVkIGNhbiBhbHNvIGluY3JlYXNlIHRoZSBj
b3VudGVyLiBXZSBhcmUgbG9va2luZyBmb3IgYW55DQpjb3VudGVyIHRoYXQgY2FuIHNlcGFyYXRl
IGNwdS0gYW5kIHBjaWUtbGltaXRlZCBjYXNlcy4gUmVnYXJkaW5nIHRoZSBbcGNpZS1iZW5jaF0g
dG9vbCwNCnVuZm9ydHVuYXRlbHksIHdlIGFyZSBub3QgYWJsZSB0byB1c2UgaXQsIGFzIGl0IHJl
cXVpcmVzIGZwZ2EgaGFyZHdhcmUuDQoNClRoYW5rcywNClFpb25nd2VuDQoNCkZyb206IEplc3Bl
ciBEYW5nYWFyZCBCcm91ZXIgPGpicm91ZXJAcmVkaGF0LmNvbT4NCkRhdGU6IFN1bmRheSwgQXBy
aWwgOSwgMjAyMyBhdCAxMTo0NiBBTQ0KVG86IFFpb25nd2VuIFh1IDxxeDUxQGNzLnJ1dGdlcnMu
ZWR1PiwgeGRwLW5ld2JpZXNAdmdlci5rZXJuZWwub3JnIDx4ZHAtbmV3Ymllc0B2Z2VyLmtlcm5l
bC5vcmc+DQpDYzogYnJvdWVyQHJlZGhhdC5jb20gPGJyb3VlckByZWRoYXQuY29tPiwgU3Jpbml2
YXMgTmFyYXlhbmEgR2FuYXBhdGh5IDxzbjYyNEBjcy5ydXRnZXJzLmVkdT4sIFRhcmlxIFRvdWth
biA8dGFyaXF0QG52aWRpYS5jb20+DQpTdWJqZWN0OiBSZTogUXVlc3Rpb24gYWJvdXQgeGRwOiBo
b3cgdG8gZmlndXJlIG91dCB0aGUgdGhyb3VnaHB1dCBpcyBsaW1pdGVkIGJ5IHBjaWUNCihhbnN3
ZXJlZCBpbmxpbmUgYmVsb3cpDQoNCk9uIDA3LzA0LzIwMjMgMDMuNDYsIFFpb25nd2VuIFh1IHdy
b3RlOg0KPiBEZWFyIFhEUCBleHBlcnRzLA0KPg0KPiBJIGFtIGEgUGhEIHN0dWRlbnQgYXQgUnV0
Z2Vycy4gUmVjZW50bHksIEkgaGF2ZSBiZWVuIHJlYWRpbmcgdGhlIFhEUA0KPiBwYXBlciAiVGhl
IGVYcHJlc3MgRGF0YSBQYXRoOiBGYXN0IFByb2dyYW1tYWJsZSBQYWNrZXQgUHJvY2Vzc2luZw0K
PiBpbiB0aGUgT3BlcmF0aW5nIFN5c3RlbSBLZXJuZWwiLiBJbiBzZWN0aW9uIDQuMSBhbmQgNC4z
LCB5b3UgbWVudGlvbg0KPiB0aGUgdGhyb3VnaHB1dHMgb2YgeGRwIHByb2dyYW1zIChwYWNrZXQg
ZHJvcCBhbmQgcGFja2V0IGZvcndhcmRpbmcpDQo+IGFyZSBsaW1pdGVkIGJ5IHRoZSBQQ0llIChl
LmcuLCAiQm90aCBzY2FsZSB0aGVpciBwZXJmb3JtYW5jZSBsaW5lYXJseQ0KPiB1bnRpbCB0aGV5
IGFwcHJvYWNoIHRoZSBnbG9iYWwgcGVyZm9ybWFuY2UgbGltaXQgb2YgdGhlIFBDSSBidXMiKS4N
Cg0KTW9zdCBvZiB0aGUgYXJ0aWNsZVsxXVsyXSBhdXRob3JzIGFyZSBsaWtlbHkgdGhpcyBtYWls
aW5nIGxpc3QsDQppbmNsdWRpbmcgbWUuIChTYWQgdG8gc2VlIHdlIGNhbGxlZCBpdCAiUENJICpi
dXMqIiBhbmQgbm90IGp1c3QgUENJZSkuDQoNCj4gSSBhbSBjdXJpb3VzIGFib3V0IGhvdyB5b3Ug
ZmlndXJlZCBvdXQgaXQgd2FzIHRoZSBQQ0llIGxpbWl0YXRpb24uDQoNCkl0IGlzIHdvcnRoIG5v
dGluZyB0aGF0IHRoZSBQQ0llIGxpbWl0YXRpb24gc2hvd24gaW4gYXJ0aWNsZSBpcyByZWxhdGVk
DQp0byBudW1iZXIgb2YgUENJZSB0cmFuc2FjdGlvbnMgd2l0aCBzbWFsbCBwYWNrZXRzIChFdGhl
cm5ldCBtaW5pbXVtDQpmcmFtZSBzaXplIDY0IEJ5dGVzKS4gKFRodXMgbWVhbmluZyBOT1QgYmFu
ZHdpZHRoIHJlbGF0ZWQpLg0KDQpUaGUgb2JzZXJ2YXRpb25zIHRoYXQgbGVhZCB0byB0aGUgUENJ
ZSBsaW1pdGF0aW9uIGNvbmNsdXNpb246DQpBIHNpbmdsZSBDUFUgZG9pbmcgWERQX0RST1AgKDI1
TXBwcykgd2FzIHVzaW5nIDEwMCUgQ1BVIHRpbWUgKHJ1bnRpbWUNCmF0dHJpYnV0ZWQgdG8ga3Nv
ZnRpcnFkKS4gIFdoZW4gd2Ugc2NhbGVkIHVwIFhEUF9EUk9QIHRvIHJ1biBvbiBtb3JlDQpDUFVz
IHdlIHNhdyBzb21ldGhpbmcgc3RyYW5nZVszXS4gIEl0IHNjYWxlZCBsaW5lYXIgdG8gMyBDUFVz
LCBhbmQgYXQgNA0KQ1BVcyBlYWNoIENQVSBzdGFydGVkIHRvIHByb2Nlc3MgbGVzcyBwYWNrZXRz
IHBlciBzZWMgKHBwcykgYW5kIHRvdGFsDQooODZNcHBzKSBzdGF5ZWQgdGhlIHNhbWUuICBFdmVu
IG1vcmUgc3RyYW5nZSB0aGUgQ1BVcyB3YXNuJ3QgdXNpbmcgMTAwJQ0KQ1BVIGFueS1sb25nZXIs
IENQVXMgaGFkICJ0aW1lIiB0byBpZGxlLiAgTG9va2luZyBhdCBldGh0b29sIHN0YXRzLCB3ZQ0K
bm90aWNlZCB0aGUgY291bnRlciAicnhfZGlzY2FyZHNfcGh5Iiwgd2hpY2ggKHdlIHdlcmUgdG9s
ZCkgaGFwcGVucyB3aGVuDQpQQ0llIGNhdXNlcyBiYWNrcHJlc3N1cmUuDQoNCldoYXQgY29uZmly
bWVkIHRoZSBQQ0llICh0cmFuc2FjdGlvbnMpIGJvdHRsZW5lY2sgd2FzWzRdIHdoZW4gd2UNCmRp
c2NvdmVyZWQgZW5hYmxpbmcgdGhlIG1seDUgcHJpdi1mbGFncyByeF9jcWVfY29tcHJlc3M9b24g
KGFuZA0Kcnhfc3RyaWRpbmdfcnE9b2ZmKSBjaGFuZ2VkIHRoZSB0b3RhbCBsaW1pdCAoODZNcHBz
IHRvIDEwOE1wcHMpLA0KYXMgcnhfY3FlX2NvbXByZXNzIHJlZHVjZSB0aGUgdHJhbnNhY3Rpb25z
IG9uIFBDSWUgYnkgY29tcHJlc3NpbmcgdGhlIFJYDQpkZXNjcmlwdG9ycy4gIFRodXMsIGNvbmZp
cm1pbmcgdGhpcyB3YXMgcmVsYXRlZCB0byBQQ0llLg0KDQoNCiA+IElzIHRoZXJlIGFueSB0b29s
IG9yIG1ldGhvZCB0byBjaGVjayB0aGlzPw0KDQpJICpoaWdobHkqIHJlY29tbWVuZCB0aGF0IHlv
dSByZWFkIHRoaXMgYXJ0aWNsZSBbcGNpMV1bcGNpMl06DQogIC0gVGl0bGU6ICJVbmRlcnN0YW5k
aW5nIFBDSWUgcGVyZm9ybWFuY2UgZm9yIGVuZCBob3N0IG5ldHdvcmtpbmciDQoNCkkgd2lzaCB3
ZSBoYWQgcmVhZCBhbmQgcmVmZXJlbmNlZCB0aGlzIGFydGljbGUgaW4gb3VycyAoYnV0IGJvdGgN
CmhhcHBlbmVkIGluIDIwMTgpLiAgVGhleSBnaXZlIGEgdGhlb3JldGljYWwgbW9kZWwgZm9yIFBD
SWUsIGJvdGgNCmJhbmR3aWR0aCBhbmQgbGF0ZW5jeS4gIFRoYXQgY291bGQgYmUgdXNlZCB0byBl
eHBsYWluIG91ciBQQ0llDQpvYnNlcnZhdGlvbnMuIFRoZXkgYWxzbyByZWxlYXNlZCB0aGVpciBb
cGNpZS1iZW5jaF0gdG9vbC4NCg0KSSB3aXNoIG1vcmUgKGtlcm5lbCkgcGVyZm9ybWFuY2UgcGVv
cGxlIHVuZGVyc3Rvb2QsIHRoYXQgUENJZSBpcyBhDQpwcm90b2NvbCAoMy1sYXllcnM6IHBoeXNp
Y2FsLCBkYXRhIGxpbmsgbGF5ZXIgKERMTCkgYW5kIFRyYW5zYWN0aW9uDQpMYXllciBQYWNrZXRz
IChUTFApKSwgdGhhdCBpcyB1c2VkIGJldHdlZW4gdGhlIGRldmljZSBhbmQgaG9zdA0KT1MtZHJp
dmVyLiAgSW4gbmV0d29ya2luZyB1c3VhbGx5IGlnbm9yZXMgdGhpcyBQQ0llIHByb3RvY29sIHN0
ZXAsIHdpdGgNCmFzc29jaWF0ZWQgcHJvdG9jb2wgb3ZlcmhlYWRzLCB3aGljaCBhY3R1YWxseSBj
YXVzZXMgYSBuZXR3b3JrIHBhY2tldCB0bw0KYmUgc3BsaXQgaW50byBzbWFsbGVyIFBDSWUgVExQ
ICJwYWNrZXRzIiB3aXRoIHRoZWlyIG93biBQQ0llIGxldmVsDQpoZWFkZXJzLiBCZXNpZGVzIHRo
ZSBwYWNrZXQgZGF0YSBpdHNlbGYsIHRoZSBQQ0llIHByb3RvY29sIGlzIHVzZWQgZm9yDQpyZWFk
aW5nIFRYIGRlc2MgKHNlZW4gZnJvbSBkZXZpY2UpIGFuZCB3cml0aW5nIFJYIGRlc2MgKHNlZW4g
ZnJvbQ0KZGV2aWNlKSwgYW5kIHJlYWQvdXBkYXRlIHF1ZXVlIHBvaW50ZXJzLg0KDQpJdCBtaWdo
dCBzdXJwcmlzZSBwZW9wbGUgdGhhdCBhcnRpY2xlIFtwY2kxXSBzaG93cywgdGhhdCBQQ0llICgx
MjhCDQpwYXlsb2FkKSBpbnRyb2R1Y2VzIGEgbGF0ZW5jeSBhcm91bmQgNjAwbnMgKG5hbm9zZWMp
LCB3aGljaCBpcw0Kc2lnbmlmaWNhbnRseSBsYXJnZXIgdGhhbiB0aGUgaW50ZXItcGFja2V0IGdh
cCBuZWVkZWQgZm9yIHdpcmVzcGVlZA0KbmV0d29ya2luZy4gIFRodXMsIGxhdGVuY3kgaGlkaW5n
IGhhcHBlbnMgImJlaGluZCBvdXIgYmFjayIsIHZpYSB0aGUNCmRldmljZSBhbmQgRE1BIGVuZ2lu
ZSBoYXZlIHRvIGtlZXAgbWFueSB0cmFuc2FjdGlvbnMgaW4tZmxpZ2h0IHRvDQp1dGlsaXplIHRo
ZSBOSUMgKHlldCBhbm90aGVyIGhpZGRlbiBxdWV1ZSBpbiB0aGUgc3lzdGVtKS4NCg0KLS1KZXNw
ZXINCg0KTGlua3M6DQoNCiAgWzFdIGh0dHBzOi8vZGwuYWNtLm9yZy9kb2kvMTAuMTE0NS8zMjgx
NDExLjMyODE0NDMNCiAgWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS94ZHAtcHJvamVjdC94ZHAtcGFw
ZXINCiAgWzNdDQpodHRwczovL2dpdGh1Yi5jb20veGRwLXByb2plY3QveGRwLXBhcGVyL2Jsb2Iv
bWFzdGVyL2JlbmNobWFya3MvYmVuY2gwMl94ZHBfZHJvcC5vcmcNCiAgWzRdDQpodHRwczovL2dp
dGh1Yi5jb20veGRwLXByb2plY3QveGRwLXBhcGVyL2Jsb2IvbWFzdGVyL2JlbmNobWFya3MvYmVu
Y2gwMV9iYXNlbGluZS5vcmcNCg0KUmVhZCB0aGlzIGFydGljbGU6DQogIFtwY2kwXSBodHRwczov
L2RsLmFjbS5vcmcvZG9pLzEwLjExNDUvMzIzMDU0My4zMjMwNTYwDQogIFtwY2kxXQ0KaHR0cHM6
Ly93d3cuY2wuY2FtLmFjLnVrL3Jlc2VhcmNoL3NyZy9uZXRvcy9wcm9qZWN0cy9wY2llLWJlbmNo
L25ldWdlYmF1ZXIyMDE4dW5kZXJzdGFuZGluZy5wZGYNCiAgW3BjaTJdIGh0dHBzOi8vd3d3LmNs
LmNhbS5hYy51ay9yZXNlYXJjaC9zcmcvbmV0b3MvcHJvamVjdHMvcGNpZS1iZW5jaC8NCiAgW3Bj
aWUtYmVuY2hdIGh0dHBzOi8vZ2l0aHViLmNvbS9wY2llLWJlbmNoL3BjaWUtbW9kZWwNCg0K
