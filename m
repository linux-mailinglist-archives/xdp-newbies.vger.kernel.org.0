Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A799F5B34F3
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Sep 2022 12:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiIIKP2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Sep 2022 06:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiIIKP0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Sep 2022 06:15:26 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-oln040092075083.outbound.protection.outlook.com [40.92.75.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7880710B55D
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Sep 2022 03:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeMJ5847+tTB2mzguL2oMW625xHTMJXpuk4l57ah0OucFGI9uIawB8Wl+f/wYfZn2hlB3Jg6cTLjrDOw39Ytfc9JXXkbK53ETDmGBGJ59xtUpnAppmYrxfJ7tDVuZXCWQFjxq07f7w7eJJOrmUViu0q79P1JgCpHDj051UyQ9FlhVm6UIvX/4mTBc8i7I+EoxYUWzFyhyGq8+hCIj1x0v5PsIrA/mPbBsAtqhXOkcqnPCYxZVBPrTY83yYHD/GCnynLxtwX3LUBZ+TxOSCMt+ye8hxGhki1LN6TBtVGaCefWd9Yp07ML64KsksTNx4z5SEHywmeIVO/P/uII7xd0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEoDii4G9l8dU7eBk20wgr69Ywty6A2ukdAbfXSP+JE=;
 b=mqaJzluQgSidc/pvux8aMqaMlNXyw+mZAJIhRWG/L+EAcRrWDfkNirgxFJTg5z/KIMsYxNhjAgtjRkP0DeWGWtJf+kAfTig4giTRadvrlJGPJbGutKwQtWfyBaO886bd+wzj8OAlTtnR9JEBQmTcsfSmJUIHZNdM20cYf8HBB3V6lGxSWUoUk1iRyxXumKWzpbuIR2PIhtw57JIra+upD+y667JCdH+6q4t7afjri433ZkXdCzXj5Y3B4PPHdawTyArMNGuBNnPWvZMKJQKtbaVFXKpH3FoAP3LJCDQKCc8x6uSEVAtEKOs3HUZMom77Pj8/ALP7nS72jeYMGFw0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEoDii4G9l8dU7eBk20wgr69Ywty6A2ukdAbfXSP+JE=;
 b=N2R9xxMiwBqDZlPRD0mqgInr45eOxrdHH2SWZI7vmQKrD17OegA58hBgiYxneJljaTz0yT4aS3RCMonNeBxcymKlJ1n/u0nWaIeqmXJL8dPW+37qpX9Q/UwJqoDtJMAozdqmLmGurHclUHJNM1TG9Pdz8i4DgxLpixgBKsSHCscYD+N9kI2izpa0NZjVryUv2henS/TSvg/PzFdFaNAvQhNQW4pAFLGQE9s9dcLZB5fB3hDj/L143UvlHznq3bsW62dxtlvjZf9lIJLzw+PJ7skKHaYcjKtxNesK0GjiiNI5f0pIbFiOw0/Ec0L6fe4/Mmt7+mCCixNg3k9rj674Lw==
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com (2603:10a6:20b:361::18)
 by DB6PR06MB4039.eurprd06.prod.outlook.com (2603:10a6:6:4f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 10:15:22 +0000
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::892:4b93:908d:7ce9]) by AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::892:4b93:908d:7ce9%9]) with mapi id 15.20.5612.012; Fri, 9 Sep 2022
 10:15:22 +0000
From:   Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Thread-Topic: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Thread-Index: AQHYrXlMrW99hv0taUWEHF7nsHFR4a2p8loAgAARSQCAAMLSgIAAS2SAgAACKgCAK/sogA==
Date:   Fri, 9 Sep 2022 10:15:22 +0000
Message-ID: <331B1170-98A9-4C99-B16B-2EDAC6634392@outlook.com>
References: <20220811115523.30742-1-magnus.karlsson@gmail.com>
 <657EB4B7-31EC-40B9-AED0-7761A77463BA@outlook.com> <YvVI3BKjmXUBhd8N@boxer>
 <CAJ8uoz0tFG0bpFFpWymyPOJ7Nfmw2Ns5dLLki+NDQHeUWtwS0Q@mail.gmail.com>
 <B97FAE5B-BFF0-4433-AEE5-47DF87711783@outlook.com> <YvYtWIf5H2xl96oF@boxer>
In-Reply-To: <YvYtWIf5H2xl96oF@boxer>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [0beeaMP1RxLMyygpn3iyiQT8woemwyJC]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7684:EE_|DB6PR06MB4039:EE_
x-ms-office365-filtering-correlation-id: 783336d2-798b-470d-13bd-08da924c34e8
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cONvaKgo2dfA7qimyihqkRcWbz3a/8Xi/FR5mO1a8+2ii9U/at68cMkVZm0hRzaAOer3fFmhUWQaXDsBQWZt7wVUpjWTtKe5GxCYRO+SFVa3IK86dCPqRI1tB8Ffod+fQsls17O8XXXBlkWru1V1oPiRKjYMIaC0fiUPUUFI53+KRY6u3AV1eZhJgYjAyIqbh9yH39ApleSy4rL+HzNiDQwtH60NqeLAnnwEzt58+7H9V1qhbqGZqMhLZVv0/iiQ0mUIR5dWSh+p7gX1oAC63bbOeOKgarQ18jA9aYoOUzmPTK0NO8nZM7WpP1MLjH8KwNannoJasVXzetAf/VxU/HLuEM/ePQ3MQR8IggyS1M80LrImQh6OUvBZ2SEm+jp1Wl+1k584PmhtdENpUcBwQCDGYOlEs9sQ1wDHA6kVnS7ZhjRxy7lzidt9+mTeevhdD3yiS5TgdSR52W5vDamMmIm8VkO9D2OYw6GsNZuWAyrTNHGBL+n7bDGG4jCvHRH6C7dbDrQrsAUA/TGqnbLQoFitjWrICfJwHRA2bO89TMhHHkKkMVUu6Nzc0W2VHt+7Ml65ig03rKA7zGTR2t4bTu40ta+6ZgZKGbL1sqreaAY9qwBqf7/jrzOomixE9tOGaTns90GCD3NL7D/peQxM1FjausbnoYB+sGR9vz8odSSfczh+NKtEIvXO82ckMaiC
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGlZQkRUNkJ6bk5IdVJNejdDd0VJajdnWjl1MENQT3ZBYTNjV2g1OS9EOXh3?=
 =?utf-8?B?VXY4V1p4aFpJcWhFL2ZhVmZJd3RIUmJFQmx3alZhanprNmp5NXNkN2FVWUlh?=
 =?utf-8?B?WE1HSklHMXFrRElodUZjc0lMNld3MWJWcDA4cVJwa2J0TkpuU2tkbWNIQTNy?=
 =?utf-8?B?VUxFWWtVc0NHTHJ1YWh4RlhMZDc0T1ZFcGZscktVUEpaOVR1YVlvV3hzSXhF?=
 =?utf-8?B?YlZZZEMvMk1qUGhzeEY4Q3ROQXJVTHFJOHRLSnhtVHM1WWRrMzVnZHdyK0I2?=
 =?utf-8?B?SjcvQW9lN0R5R2txSVVyVVBOa0tFdmNBM00rNXZtN1lxc1lUcUtPbVczZzJ6?=
 =?utf-8?B?TEZtcFVJajhrREZWSWwweDNUN1MwWnJKSmdWR1VGM0VXRlJwTUlSTDN4YXp5?=
 =?utf-8?B?MDgzRFRSUi9MTElKdlBlak5tWmJXK3RFa3QyOHk2OTV1RlpJME03TFgydDJJ?=
 =?utf-8?B?WklOVUg3QkYvdnFtdHdOYWZ0aDZYdDRHK3B5WTZXcDA1ZGg5OFdscWpVRUM0?=
 =?utf-8?B?R0UvUTV1aXBzSXVZUmJZUUhLUTBaTnhNMEM2SG5uQ3dZbTh6dEczcTJNL05T?=
 =?utf-8?B?NjdBNnRWSktCNUpGZTNtdElqRGVJRk1TZFBQTUE2SUVGSlRud2VqTi9xcVhw?=
 =?utf-8?B?WUVYZUQxbjRSTFNWL3lydk9oYWdXVFRyMmlveGZQZFNRWGk4YkNJV3V2US90?=
 =?utf-8?B?WXlMS1QrUzRIVFZxelpVMUhNa00xRzQrSHlCUFBjU0QzWE5GU1JXTmdQV1Vt?=
 =?utf-8?B?Yk9yL3FuZTBlMGZtZWhYS2VSSUVQSjMyZGNBbFRFQll3TXlRVHoyNUNHQmlx?=
 =?utf-8?B?M3NER1hnM04wNnl6bE1DWnkwdmNmTEtxQkxaU1ZrQ3VVVkhOVlhiblh3RTM3?=
 =?utf-8?B?Rlc3bFlYOWlXM0ZSMm4vK3F2TVRObkgrbmx1ZzUvMmNTdzJZRlcyOGloWXdM?=
 =?utf-8?B?WmFvRkoxNUlkM0ptMUlJS242WW1Tb2hVaW5QTllmMWtnR1h6ZVBaQmVxa21J?=
 =?utf-8?B?SGF3ZUZGdlp1b1I5ekdsd1o1aERkSkNGUlNuU01MQ0hRU3JjREFFQUJWVnNX?=
 =?utf-8?B?eFJSMzdoaVhRQ1VuOEdBRmdpYVd2bUtMb0RlVzNLL1F5QVBpb2x6ZXFZQ29I?=
 =?utf-8?B?YUdOZy9sWEFHT3haTDRtSkpMYTY1OURYMDBiNzZjSkVybkFaOTZ3b2hQV1B2?=
 =?utf-8?B?SGduRGk0dGpPbVJ6NWJOdnU2akwwWHduZU85TDZDZHhWblhSRDc1YUhRZzli?=
 =?utf-8?B?bWI1d3pwMkR3SXpnZ2pRNzljSiszTlNoeUxsUDgxQTNzb1l2VEg4aE94RVdO?=
 =?utf-8?B?cVRRRm14ejFIMTFOMWRyenJ0VDRpS056eWExZldJcHRkY0dsQTZpMDlGRU5v?=
 =?utf-8?B?UmIvdFJDR1REdXNvcUVUWldTSm1nKzE2Mkp5dEVsOEFROFp5SFdqTndvN2pr?=
 =?utf-8?B?T3FMWTVGdm00ZGFwWGxhbWNKK2d0amtkazQ0YUduU0RqR2IvdGREUzROczk0?=
 =?utf-8?B?T3h0VjN5cDRObVFZRG9nTHBLaGovZFNmTGRRN2ZMUG9yUjJ2ODRLanpZUjBu?=
 =?utf-8?B?ZzZvL29sbHdUVHU2MHRCdGZPT1QzS3l4M1M4UXBnMkYyUzdLdEZ1YTY3Q0J4?=
 =?utf-8?B?UnBTaVRodnhLaUpob0M4OUkrZEFYUnMxTUVTM0R3Qi9STzdOaVlRVkUxT1dK?=
 =?utf-8?B?Y1pSUm1PcTFUMGdtZ1NRTDU1Q3RjZDdjaDFpZk1jbzdMN0c2dHp4M2FlVXM0?=
 =?utf-8?Q?uQR8l+nHrLhgSbwhYE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1698FE3A5279E45BA6AACFB5B677CF8@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7684.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 783336d2-798b-470d-13bd-08da924c34e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 10:15:22.8516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR06MB4039
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SGksDQoNCkp1c3QgdG8gY29uZmlybSB0aGUgdHdvIHBhdGNoZXMgcHJvdmlkZWQgYWxzbyBmaXhl
ZCBvdXIgaW50ZXJuYWwgc29mdHdhcmUgYXMgd2VsbC4NCg0KSeKAmXZlIHNlZW4gdGhlIHBhdGNo
ZXMgaGF2ZSBtYWRlIHRoZWlyIHdheSB0byB0aGUgbWFpbmxpbmUgY29kZSBzbyB0aGFuayB5b3Ug
YWdhaW4uDQoNCldvdWxkIHlvdSBsaWtlIHVzIHRvIHRlc3QgdGhlIDRrIHJpbmcgc2l6ZSBmaXgg
c3RpbGw/DQoNCktSDQpBbGFzZGFpcg0KDQoNCg0KPiBPbiAxMiBBdWcgMjAyMiwgYXQgMTE6Mzcs
IE1hY2llaiBGaWphbGtvd3NraSA8bWFjaWVqLmZpamFsa293c2tpQGludGVsLmNvbT4gd3JvdGU6
DQo+IA0KPiBPbiBGcmksIEF1ZyAxMiwgMjAyMiBhdCAxMDoyOToyOEFNICswMDAwLCBBbGFzZGFp
ciBNY1dpbGxpYW0gd3JvdGU6DQo+PiBNYWNpZWosIE1hZ251cywNCj4+IA0KPj4+PiBJIGhhdmUg
anVzdCBzZW50IHBhdGNoZXMgYW5kIENDZWQgeW91IG9uIHRoZW0gd2hpY2ggc2hvdWxkIGFkZHJl
c3MgdGhlDQo+Pj4+IGlzc3VlIHlvdSBhcmUgb2JzZXJ2aW5nLiBJIHdpbGwgYmUgZ3JhdGVmdWwg
aWYgeW91IGNvdWxkIHRlc3QgdGhlbSBvbiB5b3VyDQo+Pj4+IHNpZGUgYW5kIGdldCBiYWNrIHRv
IHVzIHdpdGggcmVzdWx0cy4gSWYgdGhpcyB3b24ndCBoZWxwIHRoZW4gd2UnbGwgbmVlZA0KPj4+
PiB0byBkaWcgdGhpcyBtb3JlLg0KPj4gDQo+Pj4+IFdoYXQgcmluZyBzaXplIHlvdSdyZSB1c2lu
Zz8NCj4+IA0KPj4gSeKAmXZlIGFwcGxpZWQgYm90aCBvZiB0aG9zZSBwYXRjaGVzIG9uIHRvcCBv
ZiB0aGUgcGF0Y2ggZnJvbSBNYWdudXMgdGhlDQo+PiBvdGhlciBkYXkgKGluY2x1ZGluZyB0aGUg
aWYgKCFwb29sLT51bmFsaWduZWQpIHR3ZWFrIGJlbG93KS4NCj4+IA0KPj4gV2l0aCBib3RoIE5J
QyB0eCBhbmQgcnggcmluZ3MgYXQgNDA5NiwgdXNpbmcgeGRwc29ja19tdWx0aSwgYWxsIHF1ZXVl
cw0KPj4gbm93IHNlZW0gdG8gc2VlIHByb2Nlc3MgcGFja2V0cywgd2hpY2ggaXMgZ29vZCwgYnV0
IG9ubHkgdXAgdG8gfjQwOTYNCj4+IHBhY2tldHMgYmVmb3JlIHN0YWxsaW5nLg0KPj4gDQo+PiBI
b3dldmVyLCB5b3VyIGFkZGl0aW9uYWwgcXVlc3Rpb24gYWJvdXQgcmluZyBzaXplIGdvdCBtZSB0
byB0cnkgYSB0eC9yeA0KPj4gcmluZyBzaXplIG9mIDIwNDggZWFjaCwgYW5kIGl0IHNwcmluZ3Mg
dG8gbGlmZSEgMk1wcHMgbDJmd2QgcGVyIHF1ZXVlIG9uDQo+PiA4IHF1ZXVlcyB3aXRoIHhkcHNv
Y2tfbXVsdGkuIFJlcGVhdGVkIHdpdGggNCBxdWV1ZXMsIDIgcXVldWVzIGV0YyBhbmQNCj4+IGFs
bCBsb29raW5nIGdvb2QuDQo+IA0KPiBBd2Vzb21lIQ0KPiANCj4+IA0KPj4gU2VlbXMgSUNFIGRv
ZXNu4oCZdCBsaWtlIGEgNDA5NiByaW5nIHNpemUgYXRtLiA6LSkNCj4gDQo+IEkgaGF2ZSBhIGZp
eCBmb3IgdGhhdCwgYnV0IHBsZWFzZSBnaXZlIG1lIGZldyBkYXlzIHRvIGNsZWFuIHRoaXMgdXAu
IEkNCj4gd2lsbCBiZSBhYmxlIHRvIHNoYXJlIGl0IHdpdGggeW91IG5leHQgd2VlayBhbmQgSSB3
b3VsZCByZWFsbHkgYXBwcmVjaWF0ZQ0KPiBpZiB5b3UgY291bGQgdGVzdCB0aGlzIGFzIHdlbGwu
DQo+IA0KPj4gDQo+PiANCj4+PiBUaGFuayB5b3Ugc28gbXVjaCBmb3IgdGVzdGluZyBBbGFzZGFp
ci4gSSBiZWxpZXZlIHlvdXIgdGVzdHMgYXJlDQo+Pj4gc3VjY2Vzc2Z1bCBpbiB0ZXJtcyBvZiBu
b3QgZ2V0dGluZyBjb3JydXB0ZWQgcGFja2V0cyBhbnltb3JlLCB3aGljaCBpcw0KPj4+IHRoZSBv
bmx5IHRoaW5nIHRoZSBwYXRjaCBJIHNlbnQgd2lsbCBmaXguIFNvIHdlIHN0aWxsIGhhdmUgdHdv
DQo+Pj4gcHJvYmxlbXMgdG8gZml4IGZvciB5b3U6DQo+Pj4gDQo+Pj4gMTogUlNTIG5vdCB3b3Jr
aW5nIGNvcnJlY3RseSBmb3IgRTgxMCwgd2hpY2ggaXMgd2hhdCBNYWNpZWogaXMNCj4+PiBhZGRy
ZXNzaW5nIGluIGhpcyBwYXRjaCBzZXQNCj4+PiAyOiBUaGUgcXVldWUgc3RhbGxzIGFmdGVyIDRL
IHBhY2tldHMuDQo+Pj4gDQo+Pj4gSSBjYW4gdGFrZSBhIGxvb2sgYXQgIzIgdXNpbmcgdGhlIGFw
cGxpY2F0aW9uIHlvdSBzZW50LCBidXQgYWZ0ZXINCj4+PiBhcHBseWluZyBteSBwYXRjaCBhbmQg
TWFjaWVqJ3MuDQo+PiANCj4+IA0KPj4+Pj4+IHN0YXRpYyBpbnQgeHBfaW5pdF9kbWFfaW5mbyhz
dHJ1Y3QgeHNrX2J1ZmZfcG9vbCAqcG9vbCwgc3RydWN0IHhza19kbWFfbWFwICpkbWFfbWFwKQ0K
Pj4+Pj4+IHsNCj4+Pj4+PiArICAgdTMyIGk7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICBmb3IgKGkg
PSAwOyBpIDwgcG9vbC0+aGVhZHNfY250OyBpKyspIHsNCj4+Pj4+PiArICAgICAgICAgICBzdHJ1
Y3QgeGRwX2J1ZmZfeHNrICp4c2tiID0gJnBvb2wtPmhlYWRzW2ldOw0KPj4+Pj4+ICsNCj4+Pj4+
PiArICAgICAgICAgICB4cF9pbml0X3hza2JfZG1hKHhza2IsIHBvb2wsIGRtYV9tYXAtPmRtYV9w
YWdlcywgeHNrYi0+b3JpZ19hZGRyKTsNCj4+Pj4+PiArICAgfQ0KPj4+Pj4+ICsNCj4+PiANCj4+
PiBUaGlzIGZvciBsb29wIG5lZWRzIHRvIGJlIHByb3RlY3RlZCB3aXRoIGFuIGlmICghcG9vbC0+
dW5hbGlnbmVkKSwgYnV0DQo+Pj4gSSB3aWxsIG5vdCBzZW5kIG91dCBhIG5ldyB2ZXJzaW9uIGhl
cmUuIEl0IHdpbGwgYmUgaW4gdGhlIHZlcnNpb24gc2VudA0KPj4+IHRvIHRoZSBuZXRkZXYgbWFp
bGluZyBsaXN0Lg0KPj4gDQo+PiBUbyBjb25maXJtIEkgYXBwbGllZCB0aGlzIGFzIHdlbGwgYmVm
b3JlIGFwcGx5aW5nIE1hY2llauKAmXMgcGF0Y2hlcy4NCj4+IA0KPj4gTm93IHdlIGNhbiBub3cg
cnVuIHhkcHNvY2tfbXVsdGkgd2l0aCByaW5nIHNpemVzIGF0IDIwNDggb2theSwgSeKAmWxsIHNw
aW4NCj4+IHVwIG91ciBzb2Z0d2FyZSBzdGFjayBvbiB0aGlzIHBhdGNoZWQga2VybmVsIHRvIHZh
bGlkYXRlIHRoYXQgc2lkZSBvZg0KPj4gdGhpbmdzIHRvby4NCj4gDQo+IEdsYWQgdG8gaGVhciB0
aGF0ISBJJ2xsIHBpbmcgeW91IG9uY2UgSSBoYXZlIGEgZml4IGZvciA0ayByaW5ncy4NCj4gDQo+
IFRoYW5rcywNCj4gTWFjaWVqDQo+IA0KPj4gDQo+PiBUaGFuayB5b3UgYm90aCEhDQo+PiBBbGFz
ZGFpcg0KDQo=
