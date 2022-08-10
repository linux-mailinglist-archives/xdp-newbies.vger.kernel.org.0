Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1501658EDDF
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Aug 2022 16:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbiHJOG0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Aug 2022 10:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbiHJOGZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Aug 2022 10:06:25 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2086.outbound.protection.outlook.com [40.92.90.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA44A5A153
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Aug 2022 07:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgzbjEi/mAQwkE8bqgF6x70XVXBqkl1fNO9T2H2DrC77v/BCRlFTqJ6wqUuUJrIwdiyUITljuQ+zMoN1FQjdT4LYVtKrHMEabrsO7K5/tIFFOIdnjyct2lxE7Iu8SsYWK6PDRAqae6o+5fDI3UtAdeMVRnSroq7p61U/Sb69ZjNfUcM1t8l+BOPimOpTs4RMdqBIMurMy0deQXSXax1JovYozTQnnTs8cMxzKg1A+Yfd80XZjQMKvkbq5HiAVOCva4y/2xzXWg6cZUMR+HmcyWI/oKjy/3xVYU7nFlypqXC4bLlQNpCL4TxZpXSnqHDeHu8+rMQgXRrf/t+DHFAIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHH9ODlDiU1vj6Nvb9D5ofogrMRT03dvqHxntLaLP1Y=;
 b=VsJAdmT5E4/6mN4szUevSBiKJmYnnP+95kxJzGlsCeCSG+4GCApO1QXutRUIFBYKQ23yOlORqgOLv4QBhZn0h7W8LP5VvZWdloi+bG21L8drrLKX9BOyjEHM/gKjszMqD0kMba1+0mJj7PCrTqTVNX9RGkHUv18t6FeWIGUYWmW3OsgJEjWFQXbGjBuoCCC8lxvS89I2lfCrwP7PaMn7CJglnYH4CUNPRCBtI4/G51xYh5MuEBc/Kf047tNmiQufOdN2pmCOlwLD2TBMg/BIpicMeLGujk3oAay0ov2WHbIlOoZSNhB1h8L98hiyzJRTZjIljrLsVSVVhCPHXjMppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHH9ODlDiU1vj6Nvb9D5ofogrMRT03dvqHxntLaLP1Y=;
 b=WAKh9g4iswJ01ujLuIAOpMjIaYdxJm+UTepUy/ao5GF40nmASlWHoI7mOcRK+V6ce80bUr8YFr4jqlL0W9TuPHzBsmHls/qIXyhQk9r4gPnBI1CpIB+f1BWjcxiqRVrsZ8sCixwzm0N36lM4womXiyjIPeOGF6ItJWvWR1YC0O0RroGr9P5QLKWygISx8DsBJx3XYd2bZ0lGiDPeeQCsRRqy816mQ8Z3ohu/Vo/JFhB06N1jMAJcgyu/cpdNV12ILwhJAu1yalcrd0HIwLDVmRZd2NmBatMrgZO+DZ3R+12fl/SW3SPU9F76sLp5uZrfiZuq0fINgvFTHQ+sHo745A==
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com (2603:10a6:20b:361::18)
 by PR3PR06MB6860.eurprd06.prod.outlook.com (2603:10a6:102:8e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Wed, 10 Aug
 2022 14:06:21 +0000
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::e8ae:4899:d804:1972]) by AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::e8ae:4899:d804:1972%9]) with mapi id 15.20.5504.021; Wed, 10 Aug 2022
 14:06:21 +0000
From:   Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
CC:     "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: XSK + ZC, shared UMEM and multiple Fill/Completion queues -
 broken?
Thread-Topic: XSK + ZC, shared UMEM and multiple Fill/Completion queues -
 broken?
Thread-Index: AQHYq/vrlkfuE5kyEUSmuFLRiJIgrq2mpNGAgAAB4oCAAAIqAIAAA+wAgAFx7gCAAA4LgA==
Date:   Wed, 10 Aug 2022 14:06:21 +0000
Message-ID: <9C103784-4C86-406C-ADB2-0667CA481BD4@outlook.com>
References: <6205E10C-292E-4995-9D10-409649354226@outlook.com>
 <CAJ8uoz0a_q8T99=rHny2L+wVUgCd0jNYQd1f=LLd-2WncrAiuw@mail.gmail.com>
 <CB1ACD33-ED8B-44FC-956A-36662D54D0B8@outlook.com>
 <CAJ8uoz3-vC7RCU3gG=CWTT6=z_r21G8ujo9eGFzfiVa0EPfMeA@mail.gmail.com>
 <2A83ED8B-B369-41D5-950B-8D46217594CF@outlook.com>
 <CAJ8uoz0+C+2V1bFeSd5_NMGYoDSOfYf8uXJac41oqtdfxBo6vw@mail.gmail.com>
In-Reply-To: <CAJ8uoz0+C+2V1bFeSd5_NMGYoDSOfYf8uXJac41oqtdfxBo6vw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [v1Wo9Zk7wEVKeS0zYd10fpGV718uzY3r]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 240e7f25-c58a-42eb-5586-08da7ad980c4
x-ms-traffictypediagnostic: PR3PR06MB6860:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yoGABdTzpJQIzxFk3f7H72UdNtVM9RCrKHXsMtR9m1HnD9/pSAouNwq3DMFpVTrEniBsAnsc2n7i2QIcyVV96Uxab9+G8EpVcBGjmMTwODaA3PFOAiPlOMXxejSkP0QBog4dMZbTPrjrccKtJSQE2VKPxnhM0KbWa6KLQSdOe46CPrPIg6hGjunJY+h0idIepohVh7CRpNx0hyIvOq8jSbQjfTuLU3bjiYtyjYMZ+MSxjnVUqGEeK7Aeftt3g4r6qNJ0+E2FC8LRKEz8aTE6YPa8YYWUp2x5fPql371HOxeXcscJxjeS/WYk3Lk3DeB7MeqckNyxFKv9y/3tjpfHRj+nqI4GO+lSoYiq4ket0LmW9Le/oK6m0Qy1J/B74uH8uI+Q7FCG5obgRSXXCSx5QeaT7V72+0IK7KpuHD0A1U+caP0+wJ9+AGcmctfrWQBAirkuBX/sL/kZ5gjszMiF3dOiQ3z+0Aj082C8xnBztT2WdklnV2m6BnyZ7xsOLaDOmW57F6V9lsaneZdS8Np3EbfOljdQUWuyyHSN4ktZDs6xkwvjntVZzLo5FpDELEUg7XCABLlMvjTc7PPC85JyWQR4K4g+0UTC018VOpu/WmLtw0Np2MX0X6cb2H3Umz8GgEwE56s/jhQ06g8xkTb+oSHpJ3rDBnQJjVvztEkC2jSNCoq8lXQyzIl1HIo0xGrn
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmFyd1c5TS8vZ25wbDR2dzhvN05PU2hsbXdlSm1FdFowa0ZZZFJWeUR2YmRU?=
 =?utf-8?B?Ymk0aUY4M0QvZ1ZNUXFaMnZWZGkwL1A4MDVpL3FiWXVkclhsNVlqRG5tTWJU?=
 =?utf-8?B?UHFKT3lJSWFQK0h4aHJoeUowOEhaZUg0UWFIL1VBVzRjcFp5bk1FcTRaRnlF?=
 =?utf-8?B?Si9iYnFLTSthRC9UYWp1MlBTdjZsVElVT2NITGJWdjFBRnF6UldnSGNERHNS?=
 =?utf-8?B?WGZ4TFhOM3ZvdU1IWU9zKzEvOVBQYWFaNUx0bDc5dllBL0FrNHdSZmw2bFpC?=
 =?utf-8?B?cEFDMUxmVitqUWwxR1NENjlEakZnNUFPRklwZ0FQQ1dhSE0zcnh4VURKQ3hP?=
 =?utf-8?B?SE1jOXZGbDlVLzJnbFgybkxuSk5jY0VkVnEvc1IwUTBUZ0wzc1NjSW9NbEhN?=
 =?utf-8?B?R05JWDdNVWNCb0UyNnM2VmdSY0djWWtIVndIOUR3aGx3U0RxQStxYjlGWVV1?=
 =?utf-8?B?ci9IZ2RrVy9GZ0tidEl4L05IYVVFdXBhb2VSZGg2djFHak1VYnBqMzM0ZHNv?=
 =?utf-8?B?c2YyTjBSMW9oeXFtRVJUbXFLK3daY1d5TkE3UU5zTHFmaE9lUFpGR01iTUpw?=
 =?utf-8?B?MzdFVnNnVTVJVGEvT2k5dmtDRjdBTU0zSzRDMXU3VytLSkpEMW9PZ3ZrSnlI?=
 =?utf-8?B?NWc2UTJwWW50MmVqVkFhbGpudUROeHVKT2pBa0Y4aUltR1U1Z2dWL3I2YXkr?=
 =?utf-8?B?Um5UTks5c0tuaVBSV01BMGxhekVpeVVGYUQzSzNmMENTOUF1Z2NVV0hja0FO?=
 =?utf-8?B?SC9USmE5Q2Zpdi8wdUp5M1pxMlpaVkRlRHNQbnJ2RGNseGF0a2hKQ1p5OVN1?=
 =?utf-8?B?UERaUXQxL3BxcnR5Q3p1QVU1OWZWenUyY0h4NnZLM3VsOUNVMVJPZk93TVQr?=
 =?utf-8?B?ZTU0UXZTVStXNmxUZVFDYkpkb29udExXcTBjbC85MG94RGQvRjJOMmdwNmpZ?=
 =?utf-8?B?K3IxR2FtODVoeG1sZHg1dTNCN05iNit4M0Rhb0Q3Qm5zbFF4aXlqNlduYVFJ?=
 =?utf-8?B?RUJWeWVQdjFXTzNNTFlUQXVUSGxDSWc4S3BYZ0Q4UjVRbWYxT1QxSGJTNjIx?=
 =?utf-8?B?aUZXbU03d1Q5bjBNazNDdlkzWjI0MEVwUlk5NEFlOFFWNnNxYXQrNEJ4UTBK?=
 =?utf-8?B?YnQ3N2hJZXQ2UW44STFMRDFHQUJsNEpUdXhaeHZTNncyWGZ2cFNPM2F3bEtR?=
 =?utf-8?B?UUw2eFE1NDltRmJxM0g4aXNDRFg4Zk1SYmpBU1Uza0dsb1hKOThYQmlkOXli?=
 =?utf-8?B?c2w0WXYxaFpVWE1KT3F2MUdCZDNmQ0R2bWVmSFhXMlNFVHMveThsd01BOVg2?=
 =?utf-8?B?eGo1NnJuZUNnY2VrcWJCdzFKaExuVGx5V0JTSG1UY09IUFZ4SzNxWk5sRElL?=
 =?utf-8?B?bVovQXFWQnVUQU85RGMzdXhGNlZQYnROL0E1aUhYYVpNcXFxMStMV0tDUUNk?=
 =?utf-8?B?M1haOHhaalhmNmEvSFowOFplYTNTYURTOWFGbmtxbm8zaGhtNkNxaWgxcWhu?=
 =?utf-8?B?QkpnR0k2SUFLQWwxeTJIMUtQeC83MEtwQThyRUZHVnVkOTkrY1R6R2orWWd3?=
 =?utf-8?B?S056ODFrTW1FWnJ1aE1wTUpaS3lzOW0zVW8yL0ZKa0xnSG9GZWRJamVXSmtj?=
 =?utf-8?B?Q1VmUkhqUXlsd2lCTmFCR003ZjZlVm1YNnZpWnp1dkl2UnEvRXpyRm9UMWNy?=
 =?utf-8?B?L1dQNEdGZndmMTNRTzVGWStZTFBNTFdFMjlwVjBRL3I5cEZYazh3ZUdYZEpL?=
 =?utf-8?Q?gka3b9w1WQ5CZGCXC8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B8A3EBB5D240241831A5498FBBFDCB8@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7684.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 240e7f25-c58a-42eb-5586-08da7ad980c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 14:06:21.2720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6860
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQo+IA0KPiBPSywgSSBiZWxpZXZlIEkgaGF2ZSBmb3VuZCB0aGUgcHJvYmxlbSBhbmQgaGF2ZSBw
cm9kdWNlZCBhIGZpeCBmb3IgaXQuDQo+IEFzIHVzdWFsLCBpdCBpcyBzb21ldGhpbmcgc2ltcGxl
IGFuZCBzdHVwaWQsIHNpZ2guIEkgd2lsbCBwb3N0IGEgcGF0Y2gNCj4gaGVyZSB0b21vcnJvdy4g
V291bGQgeW91IGJlIGFibGUgdG8gdGVzdCBpdCBhbmQgc2VlIGlmIGl0IGZpeGVzIHRoZQ0KPiBw
cm9ibGVtIHdpdGggY29ycnVwdGVkIHBhY2tldHMgaW4geW91ciBhcHA/IElmIGl0IGRvZXMsIHRo
ZW4gSSB3aWxsDQo+IHBvc3QgdGhlIHBhdGNoIG9uIHRoZSBuZXRkZXYgbWFpbGluZyBsaXN0LiBK
dXN0IG5vdGUgdGhhdCBldmVuIGlmIHRoaXMNCj4gZml4ZXMgdGhpcywgdGhlcmUgaXMgc3RpbGwg
eW91ciBSU1MgcHJvYmxlbS4gTWFjaWVqIGlzIGxvb2tpbmcgaW50bw0KPiB0aGF0LiBZb3Ugd2Vy
ZSBhbHNvIHJlcG9ydGluZyBzdGFsbHMsIHdoaWNoIHdlIHNob3VsZCBleGFtaW5lIGlmIHRoZXkN
Cj4gc3RpbGwgb2NjdXIgYWZ0ZXIgZml4aW5nIHRoZSBjb3JydXB0ZWQgcGFja2V0cyBhbmQgdGhl
IFJTUyBwcm9ibGVtLg0KPiANCj4gL01hZ251cw0KDQpUaGF04oCZcyBhd2Vzb21lIC0gdGhhbmsg
eW91ISBIYXBweSB0byB0ZXN0IC0ganVzdCBmaXJlIGl0IG92ZXIuDQoNCldl4oCZdmUgb2JzZXJ2
ZWQg4oCcZGlmZmVyaW5n4oCdIGJlaGF2aW91ciwgYW5kIHdlIGRpZCB3b25kZXIgaWYgdGhlcmUg
d2VyZSB0d28gb3ZlcmxhcHBpbmcgaXNzdWVzLiBVbmZvcnR1bmF0ZWx5IHdlIGNvdWxkIG5vdCBp
ZGVudGlmeSBhIHNwZWNpZmljIG9yZGVyIG9mIG9wZXJhdGlvbiB0byB0cmlnZ2VyIGJlaGF2aW91
ciBBIChlLmcuIHF1ZXVlIDErIG5vdCB3b3JraW5nKSB2cyBiZWhhdmlvdXIgQiAoZS5nLiBxdWV1
ZSBzdGFsbHMpLiBIYXZlIHlvdSBvYnNlcnZlZCBhbHRlcm5hdGluZyBiZWhhdmlvdXIgd2l0aCB4
ZHBzb2NrX211bHRpPw0KDQpLaW5kIHJlZ2FyZHMNCkFsYXNkYWlyDQoNCg==
