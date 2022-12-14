Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7E664D1C9
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 22:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiLNV1v (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 16:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiLNV0y (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 16:26:54 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2134.outbound.protection.outlook.com [40.107.101.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706A56572
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 13:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZN3zpNKm0Hjbnj1wcZg8+dq33FiqGlfmu4+iJO8V8FbYW4breuaCacWpx1qnsosI+7JwPtZyBi1JtEWaC6JWamsZwId+MtqlHzH6GwZa+N59QOqXcUthNHOcbH8b+56jJ7Zzf2sF7EL07Ld78pxkeyzduw5tBHndMz3zKX+wu6xjkL84z0aZmjEvsCtWegFDDrv+mpvue8bWpujcofUI7BEEKg3tbc4NhEWgWkxe14ggzxgJf5PkstgwXL9Q32YN6FlZXjbxSDBGCp7gjQznNGOOyrHIgjz2oijHFcymlZCCTDz+rcuDH8n4bV5fJ2ZPij/nQmNrw9aWwhyc4SsCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZMOj7ZzI6yZgT9yK2oBdd1MP0gD2SIy0JfRfqEh1Ak=;
 b=lVCzLKORc/a1X+k3JgYrjzMgKmQUw9Vksjm3BFdJQyIa5Bc1/MKqQoVr6a9FJUa3aci8GHbR9yGfo4v7bkiEAzqxf3V132IXt2JetkaxXgi6i7WD+2MEYt9VoVBXAKnAYfqrr/1LDrG4LiljTHCEWg2N/dNziqcssXXw1pyQp9pIQ0qCcxo1F2uS5NlRsR5NsHbB3f30gvHTqUBz1YyZIckZXhvyeRbTz1qDEUHv4PEu14PH00h9f5khSnMmcd66MjTQapHHFnhW+OChBUfzKpWhBBvEPXFSUpbci603s8+SvpV8OxMjqXj/8aYjH+MdL2em0U4dEzWt2wsA4T4P3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=futurewei.com; dmarc=pass action=none
 header.from=futurewei.com; dkim=pass header.d=futurewei.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Futurewei.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZMOj7ZzI6yZgT9yK2oBdd1MP0gD2SIy0JfRfqEh1Ak=;
 b=caO66E2RI0MdqwC4+TQOINdfXmfRAcffGGLRsJ7mc69+9yGif3lhENNzhpY8C0B+ZFbjOEMC0dYrZGISfUGqSkDL3lsxxYbV0h6g5PnwajtRYZDxd/Q5Z6SzMtkup5l2D4ojcaIDi28ulfnCz3Nevg6Qn0ZIQoi+gmEQZy+U0NY=
Received: from MW3PR13MB3914.namprd13.prod.outlook.com (2603:10b6:303:58::23)
 by BN0PR13MB4647.namprd13.prod.outlook.com (2603:10b6:408:129::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 21:26:35 +0000
Received: from MW3PR13MB3914.namprd13.prod.outlook.com
 ([fe80::dc0f:af7c:d16d:66a8]) by MW3PR13MB3914.namprd13.prod.outlook.com
 ([fe80::dc0f:af7c:d16d:66a8%7]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 21:26:35 +0000
From:   Zhaoxi Zhu <zzhu@futurewei.com>
To:     Vincent Li <vincent.mc.li@gmail.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Is It Possible to RX/Process/TX packets concurrently with AF_XDP?
Thread-Topic: Is It Possible to RX/Process/TX packets concurrently with
 AF_XDP?
Thread-Index: AQHZCoZZl6N+066Kg0uWAZSukMncCa5jA4GK//99gACAC2KMAP//hsOA
Date:   Wed, 14 Dec 2022 21:26:35 +0000
Message-ID: <EB39B47D-B7FE-446E-91E0-873F7F0D4B97@futurewei.com>
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com>
 <CAK3+h2yda5-wN+-Dzj+QwcyaR__OeFaVenOhXWZ2+SJb4SbMKw@mail.gmail.com>
In-Reply-To: <CAK3+h2yda5-wN+-Dzj+QwcyaR__OeFaVenOhXWZ2+SJb4SbMKw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=futurewei.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR13MB3914:EE_|BN0PR13MB4647:EE_
x-ms-office365-filtering-correlation-id: 48ef4ef1-55e6-4fa7-bb82-08dade19e0e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d4Z0IZIr4FcyW3UU1cayQ9nfziLwfo//0b5Fe1bU3W2IVFg84TNnL5M1F6YVqwX2OJHokQiZX9UekkUOt+HiVKtmZ62CMzcLc+SDYKSLzNL5zfbJzeBpqmGFDQsHjty41DOpa/d8qGP8waeLPTBhP3WFMrv1PQkn30sTEBjOGsnrEc5wM1E2BBGivSXm4IUNwnHLEhcwVRKlHrpyec+fQw88b+NjnLqNUcfwRhyMzZgavqTFYaXaDvk/93k7uof9OVITe1wNntp3LndxGZAVjOzRbiZoTGJ1PT2q8rO84c5rj+39SCCPRDvisgWsBty60WIsGUoSu9qZCrXOfQxk0tWbmdHu8YAVz2A6TZ4WnsyP+c2F1+uCOH9CdMWT9kgq4yUop1JmfidqF07R3YrqvAbGBoNmsM5FQ1mGlvcRq3qY03lt9ENugsuXFzFnxQRk5nUBvxok68Q3whbCkFLI9Hs1RCV9c/fnK7uwYlJXLu9J3eumKlPEla1+S3U40RGEYFpVuKEh0Tx4xMIIfEDspTjFZ54cQtxD3IV6IlUN8B+b+xMIT9aHbWHtRpt3LsAOwafUWO8q1g2PlxLWkYUtjUpucaRJe2cQKy7w7L0Y5KrPnCuUcmpO+QJUb8nDrSN4Bkg0scXXm6p5dR48UoVqRl/UJTkgR4mWyeUKaU4iKZb6LvzxxwPBzslgKAyEb3ERLd2KzbD8bF5i6Wgl4tsa2bDx5bhLe6pPh+eO2QZGoZijoPaG+VgPAHUKMbCaC4mAtMcVCqwS5ODxydsRH5ttBO/Mk9+E9eLyChVNvtaNXIh9ZZM8g8zzViPE5Hgcs05F80N0+80hXE0rdG/p8KYPhQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR13MB3914.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(451199015)(2906002)(122000001)(26005)(38100700002)(53546011)(41300700001)(66556008)(64756008)(36756003)(4326008)(6506007)(76116006)(38070700005)(316002)(6916009)(86362001)(5660300002)(66476007)(8676002)(8936002)(66446008)(66946007)(478600001)(83380400001)(6486002)(966005)(71200400001)(186003)(6512007)(45080400002)(33656002)(2616005)(15398625002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2t2TkdTa1BNME1mWThRaGsxNTIyUmF2VFJtb0o3WkVUWlhFU3F2MVNIaS95?=
 =?utf-8?B?L0JJV3FGNnBEU0cyc0FzL05ReFlGcFc4dzlET3YwVVVacjB6V3lsTVlJNGhy?=
 =?utf-8?B?WjBQbFNwWk41dkdvNVliTGs4cWFLWG1IcUNCWjBpS3FDWE15ajQ4ZlM0QU5T?=
 =?utf-8?B?WlE0SjR6c0tRMitOeWlHcHdGN2s1YzU4U0RiSnFFRjdSbzZsS3BOdjFwU0hO?=
 =?utf-8?B?MTdTcEdiTkhkdDJEWHFxd0NZUHpBZ0toUkJLa01Nc1RDNW9JOGtmbWpjWUhn?=
 =?utf-8?B?TzZvV0xJYW8rR0hFR2J2ZVNheHBFT1lQTlNLeDF2bW8yMWtFeEhHenlvS01B?=
 =?utf-8?B?emJVdGlrdlZxOExYWFVkQ2Jiakt2N0dWbGlJOHhPSlo2UHBZMWhNNjh4QXlk?=
 =?utf-8?B?RnR5eCtVcEkvS0xoeXFjVVovTFh6L3hmbG9VSTY4N0RiWEw2VVNwUnkxelpK?=
 =?utf-8?B?TUxMOVU5RWgyVFZVN29uR29TMUZ3UmVOdnRVMExCT2RPTkpHRUZIOTFDcVZT?=
 =?utf-8?B?d0llYUFwZ2dhdXlZWTMxS2lvR1RWQjlOK1BWUEVlWE1Kd0xQbmxBN0VZN255?=
 =?utf-8?B?ZE1SUVJCczhSaDhOU3NuN3Z5VGJTVHpiRFpEdmxLSWZKOXBic3VYOEViU3FC?=
 =?utf-8?B?MnFEbU9HQ3VrbXp6QWhhWENLQ3EraEticTNQTndlTERoU3lqN1RBNEpsMTNY?=
 =?utf-8?B?SFVLaDRlNDRiV0JmZmg1Um1UYWpjUVBsUXhaYU5VaGk4VWpHMCtQZHFBaU5U?=
 =?utf-8?B?THFwVDNCQUIzalJNbzUxM0x5Q21MNENVSmJVN3pKSUhUTVoxTE5BRmcwS28w?=
 =?utf-8?B?L0RjRzNqL1Z3OXMvZmxocjIwK0d3WWJCbXRVWURmNklWUC9DVmhHT3JydjIx?=
 =?utf-8?B?ZnpOQlpoVGtaUWZJeVpPQkQ2RnNvUkFJcjRNMnpaYTVrYzZjbEd0ZDI0MjBD?=
 =?utf-8?B?UXJwNFRtWTF6M0dpU1Z3TkZTd1NNOUlUTFJWSTFVbklORnhnSmdBODZRYWxu?=
 =?utf-8?B?cG1Gam1IMTMyUWJoc05mME9jc1JkeFhNdTdWMGI2VGc5cjhVUDZSWGY1VlZ4?=
 =?utf-8?B?aVVrWVdtcXBGMkJmV1pDZHJRa0owNlNxMWhnOThnbTFWSjAvdnR2WVlmMGFr?=
 =?utf-8?B?ZlhBZll2NWZ5ellCWnIzQVlNY1RTVG1wUG5LeG1LalY0UmZ1a1NUZWJvQmlP?=
 =?utf-8?B?cWpJQjlyNlRhZHh2ekE1QXp1cWMvT212Mk92Zlp5T3dBYkJWVkRRQU4xSnZM?=
 =?utf-8?B?OVVWcEtTOWEyUnhQYWlmYnZjZlNGdkN6SnAwMUF4cjFSOGpTZk1OZWF5WTkv?=
 =?utf-8?B?VWFyM2U4NDdCcFV5ZFFhNXJ2eTZzVllheEpUL2ZMbS9zSEpnSnJ1d28zTFVq?=
 =?utf-8?B?cFh4SXZvK04wSE92dFp0MnM5Ym1pZFhkVTFnTlQ4VjN0eUdOWXIwRG5ITldU?=
 =?utf-8?B?Ry8vK3IvOTFKcDE1czdGUk1VNWhlRUQzQXNhMjdjWWdtMHlwNXVCMXlUYndT?=
 =?utf-8?B?OHRTbFZFUmVud2NaOUdxV0F2T1FFcW12QjRWbVdiYmhPRkRSdW5RREtFcHpJ?=
 =?utf-8?B?bDlybGRmTWtGWGtpdk5EMkZuZE9ZMys5akcxMDR0enRvOFFuUzVWeU5pVGZL?=
 =?utf-8?B?czBySTBtMXNwbTduQmtRVm1tWnJjODdVZFZ5YmRzK3g5eXJtcWttSisvMmNx?=
 =?utf-8?B?S0JQaW1ENDVaL0tLUUY3OXZIVFVmMjdyUll5TEdIOHZNK3dmaFBPV01TTG1l?=
 =?utf-8?B?eVlRcSt2RHBmaHgrc3d4b1lmcHdFNTlmUzR6TUFwRDNTeDZOWXIwNGlzb1lq?=
 =?utf-8?B?RXVkOEZLUG15YnRIcEd2MkJvNm1rVzVuMWJDQ2FyNkVRYStlKzBzaWJxMzN5?=
 =?utf-8?B?SVdlMndWN2duaXh4KzNiZHpXL1ZJUjc5S1NCVm1mUWRCOVhIUStWVmRIci9U?=
 =?utf-8?B?TWRLNGNvNUNUWE56MTErYWIwZWc2SnhTcTF0Rkd3WU1jUXdQZ20ySG1qdWZD?=
 =?utf-8?B?MWpoZCtQT29xNVZGelpmY2lBNVpHa3VTaGlzMGpBS1JsaDJqSjdHM0RjR0hm?=
 =?utf-8?B?YlBoRy81ZGZ6QWZwdGJLYXFUYkRIdUZHbWFUbG5YaTQzaXVlYnRUdHZHTTgv?=
 =?utf-8?Q?eiphY958ZVlsWpFVfyhAtlxNY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ACEB1651843BA4ABBD5ADC300FA0946@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Futurewei.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR13MB3914.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ef4ef1-55e6-4fa7-bb82-08dade19e0e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 21:26:35.4669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fee8ff2-a3b2-4018-9c75-3a1d5591fedc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IaOZG05Fcikzm8LBx5pR8OABCnzu7GlScVgGf1lEwoqeWrFYMFPgUs47twDKcoz/jT2FdFQc73GHQedMdlHGlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR13MB4647
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SGkgVmluY2VudCwNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3Igc2hhcmluZyENCg0KSSBoYXZl
bid0IHRyaWVkIERQREsvbVRDUCB5ZXQsIGJ1dCBJIHdpbGwgZ2l2ZSBpdCBhIHNob3Qgb25jZSBJ
IGNvdWxkLg0KDQpBbHNvLCBzaGFyaW5nIGEgbGluayBvZiBzbGlkZSBhYm91dCBEUERLICsgQUZf
WERQOiBodHRwczovL3d3dy5kcGRrLm9yZy93cC1jb250ZW50L3VwbG9hZHMvc2l0ZXMvMzUvMjAx
OS8wNy8xNC1BRl9YRFAtZHBkay1zdW1taXQtY2hpbmEtMjAxOS5wZGYgDQoNClRoYW5rcw0KUmlv
DQoNCu+7v09uIDEyLzE0LzIyLCAxMjo0MCBQTSwgIlZpbmNlbnQgTGkiIDx2aW5jZW50Lm1jLmxp
QGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiBXZWQsIERlYyA3LCAyMDIyIGF0IDI6NTQgUE0g
Wmhhb3hpIFpodSA8enpodUBmdXR1cmV3ZWkuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBIaSBB
bGwsDQogICAgPg0KICAgID4gVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgcmVhZGluZyB0aGlzIGVt
YWlsLiBNeSBuYW1lIGlzIFJpby4NCiAgICA+DQogICAgPiBJIHJlY2VudGx5IHN0YXJ0ZWQgbG9v
a2luZyBpbnRvIHRoZSBYRFAgdGVjaG5vbG9neSwgZXNwZWNpYWxseSBBRl9YRFAsIGFuZCBJIHJl
YWxseSBsb3ZlIGl0LiBJIHN0YXJ0ZWQgc3R1ZHlpbmcgYW5kIG1vZGlmeWluZyB0aGlzIEFGX1hE
UCBleGFtcGxlKGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZ4ZHAtcHJvamVjdCUyRnhkcC10dXRvcmlh
bCUyRmJsb2IlMkZtYXN0ZXIlMkZhZHZhbmNlZDAzLUFGX1hEUCUyRmFmX3hkcF91c2VyLmMmYW1w
O2RhdGE9MDUlN0MwMSU3Q3p6aHUlNDBmdXR1cmV3ZWkuY29tJTdDZmEyODJjODc2Y2UwNGZlZDhl
N2IwOGRhZGUxMzc2ZTglN0MwZmVlOGZmMmEzYjI0MDE4OWM3NTNhMWQ1NTkxZmVkYyU3QzElN0Mw
JTdDNjM4MDY2NDcyNDU0ODk3NDMyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3
QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRhPXp4UiUyRjNGcHh4bE9mZTFwV1JuTlZPVXhJWDZIWDha
VUUlMkZUSDRVTkJueUVZJTNEJmFtcDtyZXNlcnZlZD0wKSB0byBtZWV0IG15IG5lZWQsIGFuZCBp
dCBoYXMgYmVlbiB3b3JraW5nIGZpbmUuDQogICAgPg0KICAgID4gSG93ZXZlciwgb25lIHRoaW5n
IEkgbm90aWNlIGlzIHRoYXQgdGhpcyB1c2VyIHNwYWNlIGFwcGxpY2F0aW9uIGlzIHNpbmdsZSB0
aHJlYWRlZC4gSSB3b25kZXIgaWYgaXQgaXMgZmVhc2libGUgdG8gbXVsdGktdGhyZWFkaW5nIHRv
IHRoZSBSWC9wYWNrZXQgcHJvY2Vzc2luZy9UWCBwYXJ0cyBvZiB0aGUgcHJvZ3JhbSwgaW4gb3Jk
ZXIgdG8gdXRpbGl6ZSBvdGhlciBjb3JlcyBhbmQgcG9zc2libHkgbWFrZSBteSBhcHBsaWNhdGlv
biBmYXN0ZXI/DQogICAgPg0KICAgID4NCiAgICA+IE9uZSBjaGFsbGVuZ2UgSSBmYWNlIG5vdyBp
cywgYXMgSSB0cmllZCBkaWZmZXJlbnQgcGxhY2VzIHRvIGFkZCBtdWx0aS10aHJlYWRpbmcsIHRo
ZSBwcm9ncmFtIGRvZXMgbm90IHdvcmsgcHJvcGVybHkuIFN5bXB0b21zIHN1Y2ggYXMgYGFzc2Vy
dCh4c2stPnVtZW1fZnJhbWVfZnJlZSA8IE5VTV9GUkFNRVMpO2AgZmFpbGVkOyBJQ01QIHBpbmcg
cGFja2V0cyBkb2VzbuKAmXQgYXJyaXZlIGRlc3RpbmF0aW9uIHVudGlsIHNlY29uZHMgbGF0ZXIg
YW5kIFRDUCBjb25uZWN0aW9uIGdlbmVyYXRlZCBieSBgaXBlcmZgIGNhbm5vdCBiZSBlc3RhYmxp
c2hlZCBvY2N1cnMgYXMgSSB0cmllZCBkaWZmZXJlbnQgcGxhY2VzIHRvIGFkZCBtdWx0aS10aHJl
YWRpbmcgdG8gbXkgY29kZS4NCiAgICA+DQogICAgPiBTbywgbXkgcXVlc3Rpb24gaXMsIGRvZXMg
QUZfWERQIGFwcGxpY2F0aW9ucyBzdXBwb3J0IG11bHRpLXRocmVhZGluZyBkdXJpbmcgUlgvcGFj
a2V0IHByb2Nlc3NpbmcvVFg/IElmIHNvLCB3aGF0IGlzIGEgcHJvcGVyIHdheSB0byBtb2RpZnkg
dGhlIEFGX1hEUCBleGFtcGxlIGNvZGUgdG8gbGV0IGl0IHJ1biBwcm9wZXJseT8NCiAgICA+DQoN
CiAgICBJIHVzZWQgdG8gdXNlIG1UQ1Agd2l0aCBEUERLIGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZt
dGNwLXN0YWNrJTJGbXRjcCZhbXA7ZGF0YT0wNSU3QzAxJTdDenpodSU0MGZ1dHVyZXdlaS5jb20l
N0NmYTI4MmM4NzZjZTA0ZmVkOGU3YjA4ZGFkZTEzNzZlOCU3QzBmZWU4ZmYyYTNiMjQwMTg5Yzc1
M2ExZDU1OTFmZWRjJTdDMSU3QzAlN0M2MzgwNjY0NzI0NTQ4OTc0MzIlN0NVbmtub3duJTdDVFdG
cGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFo
YVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9a3RrWVNMNFVLdmhC
dVJiSndnTnNvdG5lZDAyaTJsQ3piR1VzekdDUE9aYyUzRCZhbXA7cmVzZXJ2ZWQ9MCwgdGhlbg0K
ICAgIEkgdGhvdWdodCB3aHkgbm90IG1UQ1Agb24gdG9wIG9mIEFGX1hEUCBhbmQgSSBmb3VuZCB0
aGlzDQogICAgaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm1jYWJyYW5jaGVzJTJGbXRjcCZhbXA7ZGF0
YT0wNSU3QzAxJTdDenpodSU0MGZ1dHVyZXdlaS5jb20lN0NmYTI4MmM4NzZjZTA0ZmVkOGU3YjA4
ZGFkZTEzNzZlOCU3QzBmZWU4ZmYyYTNiMjQwMTg5Yzc1M2ExZDU1OTFmZWRjJTdDMSU3QzAlN0M2
MzgwNjY0NzI0NTQ4OTc0MzIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpB
d01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAw
MCU3QyU3QyU3QyZhbXA7c2RhdGE9dWxJaGN2SDVjUWV0bUZjSnBxODZrY1lsNklScjhDaCUyRlRs
ejliMmRmWDhnJTNEJmFtcDtyZXNlcnZlZD0wLCBpdCBpcyBtdWx0aS10aHJlYWQgYW5kIGEgbGVh
cm5pbmcNCiAgICBleGFtcGxlLCBtYXliZSB3ZSBjYW4gZXhjaGFuZ2Ugbm90ZXMgc2luY2UgSSBh
bSBsZWFybmluZyBBRl9YRFAgdG9vIDopDQoNCiAgICA+IFRoYW5rIHlvdSBhZ2FpbiBmb3IgcmVh
ZGluZyB0aGlzIGVtYWlsLiBJIGxvb2sgZm9yd2FyZCB0byBoZWFyaW5nIGZyb20geW91Lg0KICAg
ID4NCiAgICA+IEJlc3QsDQogICAgPiBSaW8gWmh1DQogICAgPg0KICAgID4NCg0K
