Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8C064BCEA
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Dec 2022 20:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236865AbiLMTNh (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Dec 2022 14:13:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbiLMTNI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Dec 2022 14:13:08 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2123.outbound.protection.outlook.com [40.107.243.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884662656D
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Dec 2022 11:11:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSTONzDzWrKNbic5DQGc2V9x5wpldKrjov5JCcYbnb1I1KSY1XiMA+NzVyqyQKIYR+lB2qcjzT6w5Vc790sYYqhdiDRKTHkzr496KO5KiVyIjZJDINSIAttX73+YFl/KH7licS12FNbZGDPU76Udg5lA+M4WR1xoe2wMJONt2tzFJzFigAb9rWHcM2VWuO9xq1+CHNAe3nIUFjfTUX97MLKc8vyWclCPlgLu6wnRtCOxRf1vdGt7QUxzraNi6mFa/8ZXFFmEKqhbq5PsQbDZ/lIdmrJk5pmCGSRu2MtcG0elHBKbAywa1Lq+KnzQ9gBLwa6na10/Zk3fb2OT1N/aBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftgfv0H2m3l/2ORQDVD5n4txXQQp0omuxOzbfB3bNDg=;
 b=l2Sl50e2vZjpF/0nTz7Jjbcj8LKvwb3A0ClLpnXa8Qcjq80O5R8zGhSHXblmRBC8Nm/vpOfb/OTtzHtpyDH1MIQFgTN9VOBQiBrFrDuMraG62pZUZSlF+E/MBm7FCJkDyN775QdL6bm2gZPqElzYOKklVSoqz8dbsPSl5uhPCkQ240x3mPLX08b6oIdITztClT95CZQITQyD7/il9ipHLwDlE7LA4gIaD7oB71sfPV2SvRnZV1gJRF/1BQj1g7h7l+F4cHHVoVCzzZHKI77NssSwm4LU8fo+RFbrc6FQZbZVs6BTQPcHGuhyiR1gvKyZKw8al14luUY3r2Swk/mXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=futurewei.com; dmarc=pass action=none
 header.from=futurewei.com; dkim=pass header.d=futurewei.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Futurewei.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftgfv0H2m3l/2ORQDVD5n4txXQQp0omuxOzbfB3bNDg=;
 b=ctLMMAvpcsrcLZwAj+OufIt25wdkjx6dp8ieCOROn93LgsjLxZI46+B03JJX0eGlkW6hpLczJfBC0rjz/owanOyKNDhStEoSfbKe719UvlyzCg4g3G5KlgRVnrL1ELYh8nnMkS4cNOg6r2Ev+b4fUgp5RpUCS5qNhtx+AqFXzxo=
Received: from MW3PR13MB3914.namprd13.prod.outlook.com (2603:10b6:303:58::23)
 by CH0PR13MB5219.namprd13.prod.outlook.com (2603:10b6:610:fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 19:11:50 +0000
Received: from MW3PR13MB3914.namprd13.prod.outlook.com
 ([fe80::dc0f:af7c:d16d:66a8]) by MW3PR13MB3914.namprd13.prod.outlook.com
 ([fe80::dc0f:af7c:d16d:66a8%7]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 19:11:50 +0000
From:   Zhaoxi Zhu <zzhu@futurewei.com>
To:     "magnus.karlsson@gmail.com" <magnus.karlsson@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Is It Possible to RX/Process/TX packets concurrently with AF_XDP?
Thread-Topic: Is It Possible to RX/Process/TX packets concurrently with
 AF_XDP?
Thread-Index: AQHZCoZZl6N+066Kg0uWAZSukMncCa5jA4GK//99gACAAVDfgIAB1ACAgAGSq4CAAuX3gIABku2AgAAA6QA=
Date:   Tue, 13 Dec 2022 19:11:50 +0000
Message-ID: <5827E9AF-0DCE-490A-A6F8-F099E7446758@futurewei.com>
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com>
 <CAJ8uoz3F_NEfFW+zDc60AgL1SDfD9BE0qvkEHhr9yzqusSpEwg@mail.gmail.com>
 <00931ED6-D940-491F-B6DA-BEE71F61A6F7@futurewei.com>
 <CAJ8uoz0f5dDAsPMwgKWQSPZuGYnSfU9Xz2jZVmdCeeWBZeiMfA@mail.gmail.com>
 <075DA44A-891D-415E-9F97-005F2D87967A@futurewei.com>
 <F570C31F-1C80-4238-B40D-BDEB4970F4D2@futurewei.com>
In-Reply-To: <F570C31F-1C80-4238-B40D-BDEB4970F4D2@futurewei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=futurewei.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR13MB3914:EE_|CH0PR13MB5219:EE_
x-ms-office365-filtering-correlation-id: 06998035-410b-48d8-5949-08dadd3de372
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n7EirF/ngleIGVyZQcAC+2nqsp8J02UPoQwWpAube8oqeItb5VSnF7xkTrhujQdCRt3WVY0eH4neaj+tvyTvmu4+sAZpF9f3ytoz3jGgsNvBwU7hYjn1tGPDsZGCO84aLKfxwifEKLVkuSzLdDMx8WQmEkNNUHhZHFbF8hPXRkvFl1CWIFy0cpMKeONwyKaU1Kv/4gTbJYc3pae+le4mnIzpTHyT3gRukxwaFn0cMpFuvYG2LJ5rZOJiJCRUT6Oqhmd/VK6dm099pAsJGfdqs4Y1lebApayeCyI7dqo1VGRjkds1iCKxlbvwymb9Of0GAXkbjjyQwzaZsuWxe/LCewUBm68Itso8fKKrrxDY6FoT8wERRYplGqRZ5NIgOto0l7ZcIVl53tIm6+2xJk9vPsyv1meaQ6e2zuLwIK3EPc3XUEMWcVkhM7IDQzUx+n3DZjU6GoP6eFqAvVl9YasOjHCE5HtGWkRhulrPgNxE31Olve8IxNozTYHE6XkH7kiW5o4dZmsBq5/6yzm53uASJWrgY77aZQ/ZWzJ9T7Vj0AS6V11EqH/8+sNXcsb4//6k123Obt00knkn9DkKCriwMfaR9yWGXkB5j8WiCLwp1XGJ0osDdS4DtH3aCxrF/a1/vMl2XXHHnT0HNQMD6BWL6TVXIW5uEzHs9F0J12N4EiwY70Fo+6I7o3wPNhaftMC3gprZsFbdxGONzzjcck6S5jZzv4VZ31mCi3k5uMeM0xVNx1d8J5gepPLiskKtgDhXhacgkbrDVmI/GdkcQHDz99Klna/lMbflMNdgm/eOaNs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR13MB3914.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(451199015)(41300700001)(122000001)(38100700002)(66946007)(8936002)(91956017)(64756008)(5660300002)(66446008)(66476007)(66556008)(76116006)(8676002)(83380400001)(6486002)(966005)(6506007)(38070700005)(478600001)(36756003)(316002)(110136005)(66574015)(2906002)(33656002)(6512007)(26005)(71200400001)(53546011)(45080400002)(86362001)(2616005)(186003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OCtuY1NWNWR0TFk2QjFmcWl6YkgzaXA4dUJRcjh5WlR5V052Y2xiQU9JbDIy?=
 =?utf-8?B?REt1Ni9abVhDOFFCRzhzYkxta3dpQStUaWpNc0ZJWE80dzZIWXdEbDA0aGsw?=
 =?utf-8?B?b3MzYmViYmpCa3gyNjdRK2ZNZkJtY1dNSGJLbW1KUFFFYnNRZGJaVHorQ3VY?=
 =?utf-8?B?VWlBR3laSVIrc28rR1BqYS9CUHhkakYwcmdNN2VMOVdqeHNWczFjY2dHMEF4?=
 =?utf-8?B?UlBGYTRZOGwxVWRhR09WQkFxaTJiQzZ2TU9HOFB6cnZBMlB3c0o4RjRyOWZJ?=
 =?utf-8?B?QnowR1o1NUhVR2gyeVZyR1gvYXVIY2kybHFtbVM3dW5xT20rU0FvcTNsVjFo?=
 =?utf-8?B?cE1LN2JwaW1lN3lUTWpiZG1LK2dvcTloK0FtWnNXQjRiKzBjVSttZ0JkWE1R?=
 =?utf-8?B?eTByZ3lFbEdpUWR5MFJObmlFdUdheW1ZRGFJd0JkUkR1Si9aU0tjVVJSWlFx?=
 =?utf-8?B?V3l5UlM2ZGdzYXU0RE9NcFR4cExIOWt5dy9MRVlIRTFBTWFHQVpjL3BmMDA0?=
 =?utf-8?B?WGJqS0k0U2N6SWtCNllIcW5odVAycWtvclBaWVE2ZjlFVVVwSnloeVBZQWlu?=
 =?utf-8?B?bzI2dW1GL0R1WU1VM2lsT0ptUVFRaG5GVlJnT2F1REcwam5GaitzNERLQ1V1?=
 =?utf-8?B?aGtPRlRYQk43R1dldUVtckxhRXR4WSs2QmFsKzd0N2hCUHpKcWFSYzFwZWtz?=
 =?utf-8?B?WHgzSjJ6RVRVMjhKVktIMEFmV3EveGhwNTYzL3pJZU0wSjVDQU9KY2lZTEht?=
 =?utf-8?B?S0MwYXlaUDlFTGI3UVdGazRYbFRnRFYyY1NGTVVxbm9pUXROT3FVRWE3OXpK?=
 =?utf-8?B?M1liQ2llYWZ4TzNkZ0RyelBjc0wvQXQ0VHFPNmxXQk1DeWZEU0tVOGYvTVI4?=
 =?utf-8?B?ZDZqdHFuTk5zSFN5VDNCVFRlcStHc04xeGM4OEhJSWlvenl5N3ZJQStHV005?=
 =?utf-8?B?dkxodk9VcGpuclRqUGljMmhxc003ajlnV0ZiYWJraml1YVF1MnBUVGQvNWI1?=
 =?utf-8?B?cVArNzRTZjRjTFh5NXBCV3JiajFsV1JtaWREaW1JeXllRS95azBwNzhUMFlH?=
 =?utf-8?B?d2NlNFo5c0pYb2kyQTJwYkVueGx3cHFyYlI2Q2xhaHk2UTN2eUpVWGRyanAx?=
 =?utf-8?B?U01OYUNKWG5rN2h2akt2R2VuTnZ6SkNSVXM4ZTRVakpJSDR1RkNTeDR3cXoz?=
 =?utf-8?B?TTVDdlBUbE1ZT1h4aUg5aWpmNStSVDN4cW52UVlhWVdPWko0UHU4VHpOUGZI?=
 =?utf-8?B?aDRIc2FiQ1ZGMlZUeDBrN202c252TGVqMFdtL2JtL1p5eFd1emV3Vi9oc29y?=
 =?utf-8?B?WXRDWmpFWCtXKzVSV1AwME9QZVgrd25Xa25lU3RWMm1SV3EwMzNaNDl5cGxH?=
 =?utf-8?B?eURZKy9wSW9oUGN0cTJiaFJKeTZZOWNjMnBVcGtYZG5TMXVpWXdDeXpUcWE4?=
 =?utf-8?B?MUFZTzUyenpvV1RWVm1GREFHaEc1Y1dUOGN2cW4yemNMbDgxZ0pocXpPbktM?=
 =?utf-8?B?YlRZS0xLSWVFTEtTQjZiNkhKbUl5M3VNS3J0MElON0hHOVlPYWp6TnFYZ0ww?=
 =?utf-8?B?M2VIRmRPeTdXSzJuZnJYUWlWNWkrV29ONnhBcW83ZnowZ1BORDlyM3JiQ3Qx?=
 =?utf-8?B?NjNNckQvUTNSYjhCV20xMkNRbEQ3UlpTOWI3YndMaGhVNUNIWUJtOTRjcWVO?=
 =?utf-8?B?UDVVaXc0TEhQT0hsRzFwRkc0dnpIQUNycHlUVGhkOHBwRUYxb3JTTHFtQkVW?=
 =?utf-8?B?N1pxcFNRWGs2Y3FKOEpLWS9YekxRanFSWk5tRThURmJJWEExNkh6T201ckRk?=
 =?utf-8?B?VkxMZU0rVklhMFMrR2JtZi9mWVEvd3FBMmd5N2F2OGlwcU45bEJiYU15VjVF?=
 =?utf-8?B?L2FhVFBGc3pwTENmc3U0RHViTGxNVE1peTJVejFsaFRGZW9wOTFNbXRZYzlj?=
 =?utf-8?B?VFA5aDYxSnpNYkpIZFpPMjY1bFVLVUd3WEQ2QTN0MUlWS2Z1M3N4dXhtWUQ2?=
 =?utf-8?B?bS80b1pHNlhrU0VNUUNGMi91V3FHSzdtUzI4MWswNzdlWFNBUVdlQi8wYjJr?=
 =?utf-8?B?bmNjS3Uxem55UU9FNER5T1hVcTdOSDZQZEw2VElhT3ZReTZqd2dBdDlmK1kz?=
 =?utf-8?Q?ocfsth7W1wWhf4s1Ep3S8q+e+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <640DAFA7D074B843BB38E4C581EBFFDF@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Futurewei.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR13MB3914.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06998035-410b-48d8-5949-08dadd3de372
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 19:11:50.4686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fee8ff2-a3b2-4018-9c75-3a1d5591fedc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/chmjbkwhgfu/xzFZXa5c1F8KZ78sIi/gEGLxrBA9xYJ37aQx+dAsJ3PzfKJabC+gs2hMOr1Qz1DsCoBxg9VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB5219
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SXQgbG9va3MgbGlrZSB0aGF0IEkgZGlkbuKAmXQgaW5jbHVkZSB0aGUgbWFpbGluZyBsaXN0IGlu
IG15IHByZXZpb3VzIHJlcGxpZXMuIEkgaG9wZSB0aGlzIG9uZSBkb2VzLg0KDQpBbHNvLCBmb3Ig
dGhlIEFGX1hEUC1mb3J3YXJkaW5nIGV4YW1wbGUsIGlzIGl0IGFibGUgdG8gaGFuZGxlIG11bHRp
cGxlIEFGX1hEUCBzb2NrZXRzIG9uIHRoZSBzYW1lIE5JQz8NCg0KU3VjaCBhczoNCg0KYGBgDQou
L3hkcF9md2QgLWkgSUZBIC1xIFExIC1pIElGQSAtcSBRMiAtaSBJRkEgLXEgUTMgLWkgSUZBIC1x
IFE0IC1jIENYIC1jIENZDQoNCmBgYA0KDQpJZiB0aGUgYWJvdmUgaXMgZG9hYmxlLCBtYXliZSBJ
IGNhbiBoYXZlIG11bHRpcGxlIHF1ZXVlcywgcmF0aGVyIHRoYW4gaGF2aW5nIG9uZSwgb24gdGhl
IHNhbWUgTklDLCBjcmVhdGUgb25lIEFGX1hEUCBzb2NrZXQgcGVyIHF1ZXVlLCBhbmQgdGhlbiB1
c2UgdGhpcyB4ZHBfZndkIGV4YW1wbGUgdG8gYWNoaWV2ZSBtdWx0aS10aHJlYWRpbmc/DQoNClRo
YW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgaGVscCBhbmQgdGltZS4NClJpbyANCg0KDQpGcm9t
OiBaaGFveGkgWmh1IDx6emh1QGZ1dHVyZXdlaS5jb20+DQpEYXRlOiBNb25kYXksIERlY2VtYmVy
IDEyLCAyMDIyIGF0IDExOjA2IEFNDQpUbzogTWFnbnVzIEthcmxzc29uIDxtYWdudXMua2FybHNz
b25AZ21haWwuY29tPg0KU3ViamVjdDogUmU6IElzIEl0IFBvc3NpYmxlIHRvIFJYL1Byb2Nlc3Mv
VFggcGFja2V0cyBjb25jdXJyZW50bHkgd2l0aCBBRl9YRFA/DQoNCkdvdCBpdCwgdGhhbmsgeW91
IHZlcnkgbXVjaCBmb3IgeW91ciBjbGFyaWZpY2F0aW9uLg0KDQpJIGhhdmUgb25lIG1vcmUgcXVl
c3Rpb24sIGlmIEkgbWF5OiBJZiBvbmUgQUZfWERQIHNob3VsZCBiZSBoYW5kbGVkIGJ5IG9uZSB0
aHJlYWQsIGluIG9yZGVyIHRvIGF2b2lkIG11dGV4ZXMgYW5kIHRvIGFjaGlldmUgYmV0dGVyIHBl
cmZvcm1hbmNlLCB0aGVuLCBjYW4gSSBoYXZlIG1vcmUgdGhhbiBvbmUgQUZfWERQIHNvY2tldCBv
biB0aGUgc2FtZSBwaHlzaWNhbCBOSUMsIGFuZCB1c2Ugb25lIHRocmVhZCBwZXIgQUZfWERQIHNv
Y2tldCwgaW4gb3JkZXIgdG8gbWFrZSBwcm9jZXNzIHBhY2tldHMgY29taW5nIGludG8gdGhpcyBO
SUMgY29uY3VycmVudGx5Pw0KDQpDdXJyZW50bHksIHRoZSB3YXkgd2UgYXJlIHRlc3RpbmcgQUZf
WERQIHdpdGggaXMgdG8gaGF2ZSBvbmx5IDEgcXVldWU6DQoNCmBgYA0Kc3VkbyBldGh0b29sIC1M
IDxpbnRlcmZhY2U+IGNvbWJpbmVkIDENCmBgYA0KDQpDYW4gSSBjaGFuZ2UgdGhlIG51bWJlciBv
ZiBxdWV1ZXMgdG8gc29tZXRoaW5nIGxpa2UgNCwgYW5kIHRoZSB1c2VyIHNwYWNlIHByb2dyYW0s
IMKgaGF2ZSBvbmUgQUZfWERQIHNvY2tldCBwZXIgcXVldWUgYW5kIG9uZSB0aHJlYWQgcGVyIEFG
X1hEUCBzb2NrZXQsIGluIG9yZGVyIHRvIGhhdmUgZm91ciB0aHJlYWRzIHByb2Nlc3NpbmcgdHJh
ZmZpYyBjb21pbmcgaW50byB0aGUgc2FtZSBOSUM/DQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9y
IHlvdXIgaGVscCBhbmQgdGltZS4NClJpbw0KDQoNCkZyb206IE1hZ251cyBLYXJsc3NvbiA8bWFn
bnVzLmthcmxzc29uQGdtYWlsLmNvbT4NCkRhdGU6IFNhdHVyZGF5LCBEZWNlbWJlciAxMCwgMjAy
MiBhdCA2OjU3IEFNDQpUbzogWmhhb3hpIFpodSA8enpodUBmdXR1cmV3ZWkuY29tPg0KU3ViamVj
dDogUmU6IElzIEl0IFBvc3NpYmxlIHRvIFJYL1Byb2Nlc3MvVFggcGFja2V0cyBjb25jdXJyZW50
bHkgd2l0aCBBRl9YRFA/DQoNCk5vLCB0aGF0IGlzIG5vdCBwb3NzaWJsZSB3aXRob3V0IGV4cGVu
c2l2ZSBtdXR1YWwgZXhjbHVzaW9uIG1lY2hhbmlzbXMuIFVhZSBvbmUgc29ja2V0IHBlciB0aHJl
YWQgaW5zdGVhZC4NCg0KTWFnbnVzwqANCkxlIHZlbi4gOSBkw6ljLiAyMDIyLCAyMzo0OSwgWmhh
b3hpIFpodSA8bWFpbHRvOnp6aHVAZnV0dXJld2VpLmNvbT4gYSDDqWNyaXTCoDoNCkhpIE1hZ251
c3QsDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHkgYW5kIHRoZSBsaW5rIHlv
dSBwcm92aWRlZC4NCg0KRG8geW91IHRoaW5rIGl0IGlzIG9rYXkgdG8gaGF2ZSBtdWx0aXBsZSB0
aHJlYWRzIGZvciB0aGUgc2FtZSBBRl9YRFAgc29ja2V0PyBJbiB0aGUgQUZfWERQLWZvcndhcmRp
bmcgZXhhbXBsZSwgaXQgc2VlbXMgbGlrZSB0aGF0IHRoZSBzYW1lIEFGX1hEUCBzb2NrZXQgaXMg
b25seSBoYW5kbGVkIGJ5IG9uZSB0aHJlYWQuIEkgd29uZGVyIGlmIHRoYXQncyBva2F5IGZvciB0
aGlzIEFGX1hEUC1mb3J3YXJkIHByb2dyYW0gdG8gcnVuIGxpa2U6DQoNCmBgYA0KLi94ZHBfZndk
IC1pIElGQSAtcSBRQSAtYyBDWCAtYyBDWQ0KYGBgIA0KDQpTbyB0aGF0IHdlIGhhdmUgdHdvIHRo
cmVhZHMgcnVubmluZyBvbiB0aGUgc2FtZSBBRl9YRFAgc29ja2V0Lg0KDQpUaGFuayB5b3UgYWdh
aW4gZm9yIHlvdXIgaGVscC4NClJpbyBaaHUNCg0KT24gMTIvOC8yMiwgMjo1NCBBTSwgIk1hZ251
cyBLYXJsc3NvbiIgPG1haWx0bzptYWdudXMua2FybHNzb25AZ21haWwuY29tPiB3cm90ZToNCg0K
wqAgwqAgT24gV2VkLCBEZWMgNywgMjAyMiBhdCAxMTo1NCBQTSBaaGFveGkgWmh1IDxtYWlsdG86
enpodUBmdXR1cmV3ZWkuY29tPiB3cm90ZToNCsKgIMKgID4NCsKgIMKgID4gSGkgQWxsLA0KwqAg
wqAgPg0KwqAgwqAgPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciByZWFkaW5nIHRoaXMgZW1haWwu
IE15IG5hbWUgaXMgUmlvLg0KwqAgwqAgPg0KwqAgwqAgPiBJIHJlY2VudGx5IHN0YXJ0ZWQgbG9v
a2luZyBpbnRvIHRoZSBYRFAgdGVjaG5vbG9neSwgZXNwZWNpYWxseSBBRl9YRFAsIGFuZCBJIHJl
YWxseSBsb3ZlIGl0LiBJIHN0YXJ0ZWQgc3R1ZHlpbmcgYW5kIG1vZGlmeWluZyB0aGlzIEFGX1hE
UCBleGFtcGxlKGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwczovL2dpdGh1Yi5jb20veGRwLXByb2plY3QveGRwLXR1dG9yaWFsL2Jsb2IvbWFz
dGVyL2FkdmFuY2VkMDMtQUZfWERQL2FmX3hkcF91c2VyLmMmZGF0YT0wNXwwMXx6emh1QGZ1dHVy
ZXdlaS5jb218YTQ4ZTQ5N2M1NjdjNDQzMzRlMzUwOGRhZGFiZWQwZjl8MGZlZThmZjJhM2IyNDAx
ODljNzUzYTFkNTU5MWZlZGN8MXwwfDYzODA2MjgxMDM1MDExMjUyOHxVbmtub3dufFRXRnBiR1pz
YjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lM
Q0pYVkNJNk1uMD18MzAwMHx8fCZzZGF0YT1vZERxanRUYjB4dk8raXoxbzVxZDJEalBpMEs1MWR0
b2NTeHdCQTQxWWY0PSZyZXNlcnZlZD0wKSB0byBtZWV0IG15IG5lZWQsIGFuZCBpdCBoYXMgYmVl
biB3b3JraW5nIGZpbmUuDQrCoCDCoCA+DQrCoCDCoCA+IEhvd2V2ZXIsIG9uZSB0aGluZyBJIG5v
dGljZSBpcyB0aGF0IHRoaXMgdXNlciBzcGFjZSBhcHBsaWNhdGlvbiBpcyBzaW5nbGUgdGhyZWFk
ZWQuIEkgd29uZGVyIGlmIGl0IGlzIGZlYXNpYmxlIHRvIG11bHRpLXRocmVhZGluZyB0byB0aGUg
UlgvcGFja2V0IHByb2Nlc3NpbmcvVFggcGFydHMgb2YgdGhlIHByb2dyYW0sIGluIG9yZGVyIHRv
IHV0aWxpemUgb3RoZXIgY29yZXMgYW5kIHBvc3NpYmx5IG1ha2UgbXkgYXBwbGljYXRpb24gZmFz
dGVyPw0KwqAgwqAgPg0KDQrCoCDCoCBQbGVhc2UgY2hlY2sgb3V0IHRoZSBBRl9YRFAtZm9yd2Fy
ZGluZyBleGFtcGxlIGluIHRoaXMgcmVwbzoNCg0KwqAgwqAgaHR0cHM6Ly9uYW0xMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzOi8vZ2l0aHViLmNvbS94ZHAtcHJv
amVjdC9icGYtZXhhbXBsZXMmZGF0YT0wNXwwMXx6emh1QGZ1dHVyZXdlaS5jb218YTQ4ZTQ5N2M1
NjdjNDQzMzRlMzUwOGRhZGFiZWQwZjl8MGZlZThmZjJhM2IyNDAxODljNzUzYTFkNTU5MWZlZGN8
MXwwfDYzODA2MjgxMDM1MDExMjUyOHxVbmtub3dufFRXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMD18MzAwMHx8
fCZzZGF0YT1od24xaW5kVWpvcWY0aGtMcmI5NHNXZVZjOTZhejdqbnNjL0d5TUFBNHBNPSZyZXNl
cnZlZD0wDQoNCsKgIMKgID4gT25lIGNoYWxsZW5nZSBJIGZhY2Ugbm93IGlzLCBhcyBJIHRyaWVk
IGRpZmZlcmVudCBwbGFjZXMgdG8gYWRkIG11bHRpLXRocmVhZGluZywgdGhlIHByb2dyYW0gZG9l
cyBub3Qgd29yayBwcm9wZXJseS4gU3ltcHRvbXMgc3VjaCBhcyBgYXNzZXJ0KHhzay0+dW1lbV9m
cmFtZV9mcmVlIDwgTlVNX0ZSQU1FUyk7YCBmYWlsZWQ7IElDTVAgcGluZyBwYWNrZXRzIGRvZXNu
4oCZdCBhcnJpdmUgZGVzdGluYXRpb24gdW50aWwgc2Vjb25kcyBsYXRlciBhbmQgVENQIGNvbm5l
Y3Rpb24gZ2VuZXJhdGVkIGJ5IGBpcGVyZmAgY2Fubm90IGJlIGVzdGFibGlzaGVkIG9jY3VycyBh
cyBJIHRyaWVkIGRpZmZlcmVudCBwbGFjZXMgdG8gYWRkIG11bHRpLXRocmVhZGluZyB0byBteSBj
b2RlLg0KwqAgwqAgPg0KwqAgwqAgPiBTbywgbXkgcXVlc3Rpb24gaXMsIGRvZXMgQUZfWERQIGFw
cGxpY2F0aW9ucyBzdXBwb3J0IG11bHRpLXRocmVhZGluZyBkdXJpbmcgUlgvcGFja2V0IHByb2Nl
c3NpbmcvVFg/IElmIHNvLCB3aGF0IGlzIGEgcHJvcGVyIHdheSB0byBtb2RpZnkgdGhlIEFGX1hE
UCBleGFtcGxlIGNvZGUgdG8gbGV0IGl0IHJ1biBwcm9wZXJseT8NCsKgIMKgID4NCsKgIMKgID4g
VGhhbmsgeW91IGFnYWluIGZvciByZWFkaW5nIHRoaXMgZW1haWwuIEkgbG9vayBmb3J3YXJkIHRv
IGhlYXJpbmcgZnJvbSB5b3UuDQrCoCDCoCA+DQrCoCDCoCA+IEJlc3QsDQrCoCDCoCA+IFJpbyBa
aHUNCsKgIMKgID4NCsKgIMKgID4NCg0K
