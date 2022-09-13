Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4754B5B6A54
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Sep 2022 11:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiIMJJi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Sep 2022 05:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbiIMJJh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Sep 2022 05:09:37 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2137.outbound.protection.outlook.com [40.107.10.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9FB6272
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Sep 2022 02:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imroJeJO5ieK92+1TYkXOBa8W64oVfwXChDQVJZ470wls776UJa1zFfufFwaKnORE9+8/YDia5oEOQQOEqNjftjJvrik+Ct0L5XFgCYe/8ZRUCwjHPHoTAg/DR28oT74OzA6WX3ukdOjBsloaN/IbRDWgb4EXfGKJdAFOGYNMxu7hI6iNbjzW0eXC8/P4QWiLo0u2nEhRuVjYl7KXsTHKaTu9NjqX+wPVpxPEhbDe86U/JLEXMylcD2ylVN8HNjbKUpPxFlX8DHjXcyXY7blo+iMdZG7VPfYjdy6gri0+FIlyBHeKW9oNlRvdBoQ7JLpXuoWMQ8pAeCBnNG4mdikbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BOL6Ncrlsg8R6WC2ge9w7IktUxUxHIvDZo69bpYi08=;
 b=EWrQLN8ECqkGGWlc/39YvxRJVBoN+FM2rJgv9plDeSsyQ1R77Pj8emE0sWdBVUFrAJGLMHILN0dJLnIUy5jX8ZJKUJSJp+1y56n4GWmb7RzaUyu1jyPYiy8JjeAgW87YRA9f7Dg4XJSHK5FnZ05cGu2/IwAVMU60kfIp7e5cbLi4GrPBIpon7FhfYOk+ucfJMFzSeGpzLCw1+g8qh2miRwFxlaFV49YHOVrUT8t/18uRUI2J9I6L+NfdLuWQui1tFPemcZ2/FwIY6HB8QKS+XBL6wXHgaApXiHQEW4CrpsG5VWe0IVl3cIvextDHAkgAxlU3nReJtKjFK27Gy5aIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synamedia.com; dmarc=pass action=none
 header.from=synamedia.com; dkim=pass header.d=synamedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synamedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BOL6Ncrlsg8R6WC2ge9w7IktUxUxHIvDZo69bpYi08=;
 b=Wlwbxv2NC0LXqr8L823S3Lw146fgiE03TpakWLPifYsegirnnMY7GTiVsL4rD3tZwhmn8Xm0/RqVRmLREtL7sbX/+C7uR5ztCSPh9Us6FNvmZcfeLEtin7aTgUteQFOuQmyWM6GzNF+3qm1MLv+GIvz6WJjAhFtzSoYP+P7+Jk7ohDMVsTZ0n0It4FJTZKNn3mlYL7QdENSyPlcaWByOv6tEqAvoG+P0nr0m8oZtrG8f0EGDjNDV8z3kRlzp53PnL7StYPTn+m4vbe476JtlBpJf/FdT6tTm7t1RypfoZ1yN0uvozKgl8G6zFZWeSobx3I+SJ+sCKqiz87PFh5Mr8A==
Received: from CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1be::9)
 by LO0P265MB5000.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 09:09:32 +0000
Received: from CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1022:3adc:5ae6:937f]) by CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1022:3adc:5ae6:937f%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 09:09:32 +0000
From:   Dries De Winter <ddewinter@synamedia.com>
To:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
CC:     "siska@cesnet.cz" <siska@cesnet.cz>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: RE: XDP-ZC RSS - Mellanox
Thread-Topic: XDP-ZC RSS - Mellanox
Thread-Index: AQHYx03calzSU20370uN55cbs0IH2q3dEUcg
Date:   Tue, 13 Sep 2022 09:09:31 +0000
Message-ID: <CWXP265MB53456430EB25687FD9F96ED2A2479@CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM>
References: <CWXP265MB53457318D33BCCEC3289ECDCA2449@CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM>
 <139B4E3F-DF5D-44E2-A751-1A1C9AFDB932@outlook.com>
In-Reply-To: <139B4E3F-DF5D-44E2-A751-1A1C9AFDB932@outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_ActionId=e8f5cd3e-d137-4d92-93b6-0bb9eecbcb6e;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_ContentBits=0;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Enabled=true;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Method=Standard;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Name=e305dca8-daac-40b2-85cb-c39a1eaa36df;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_SetDate=2022-09-13T09:05:17Z;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_SiteId=ecdd899a-33be-4c33-91e4-1f1144fc2f56;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synamedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB5345:EE_|LO0P265MB5000:EE_
x-ms-office365-filtering-correlation-id: 8792dbc3-f070-4dd5-41e9-08da9567abaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vpGvM4XIw8SKCwn1HNP28sKe2DxxlOgKgqtUhF5Q2zq3JallUlVEpFW8SrNXFIVC48/JhOKlZFkmNf+LbSg+PD4TvXQAIdNZRMJJzAYJm0WprSlplUAPmRZwpIKxhTN41UzobxKwZqzAQI5tcY/+1pfzA3PYkj6P9qjk7UVF9OlOG5X/dw8cxIQfhh3m0EikQfpRL0CY2yfUjqJ2Dy4W0y0P9Z1lBJWLzKsjzNMS9xULodXfyqFDR9Bzta67p54z3Vf7x94MzELW54L9yAfDkgWVtnEBTAL2qKAED+m8By0CPOFN2718l5NVCf0PjDQU1qIGDpP2V9fTJEXLVpFdvDFpOpTsyDyCmr5MlDBl6cV76cIkuq/0FeSDRylwtEPMmENSK11fgNRJanE1iowqPqlcsmS2CGOTQOrfsbweXfX+I4m3XZX9Tfy0pogDr+71OJwACOaO9hwX1KnLp++MHgDHl3KCN17ln6z5S0lij1IZdREva5ztzmhVI2QM72TpqNT/T2z1Tvw2P1a116R6dXi28pMoUeMoToZzSMC0ewSqmLlRaSMMo8uv80iddW+k8OXPYMxmfn+QgGYEEJ//7HX3L0g+0vZaN71W1tt3mTDEWXJ+JUZ14Nm1xPbpZoNnO9GVf+GyrR+8v8yEqz+m+cz4mQHkfdl6h3hDJgSHF/pB4duxpeV1HSSvzI89SQ30SwW6sZXloD12g1RtnUY/dx1PqshygchEriSrjpDD8jfqxDlKMbO1x/tZiV4bXPRu5UJZDjRUHyzhgCbRglb1Uw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199015)(8676002)(66476007)(38070700005)(2906002)(55016003)(86362001)(9686003)(41300700001)(316002)(4744005)(186003)(6506007)(26005)(66946007)(5660300002)(122000001)(54906003)(8936002)(478600001)(71200400001)(64756008)(33656002)(7696005)(4326008)(66556008)(76116006)(66446008)(38100700002)(6916009)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk4wK3ordFFxcTg4TUU4NzRrYlNuQWpqL09jMUp0elRPTGFBTm0xT2ZYMGFM?=
 =?utf-8?B?OHJhRTgxeU53QlBpZkY2VWxXTnVGd25Ga3NNQWQrN0g4RHlUWFdXSE5NQ1Mx?=
 =?utf-8?B?V3NGZEhZcStMVTJPc2M5WXVBNzE2c0swRHIrb3ZrOUo5YmVzNE9OS2I2ZDA0?=
 =?utf-8?B?bEdGS1NPS2o3ZUw5VmVxWnRHbXBkcDVqMFAvWUhpOGwxdExBMWgwYkFFbTlm?=
 =?utf-8?B?NjlhVmtxT2lNSVM5TlFBMVJkTlpTR2wxekxDY21XNktNOEVBOWpZZmZGOEFP?=
 =?utf-8?B?SFFIU0JvV2RqYVF2aTNFTzRKVW16SEJ0TlBZVHlaMGxVZFJ0Z3dhR21TMjNo?=
 =?utf-8?B?MmJQdE9ZMW9LbVVWLzVsN3hyaFFuSWxMRmZGMndMakpXUVRtMW44SitEb1lt?=
 =?utf-8?B?RlZYdjVHVWc5dWg5aisvZW1TQWNSeFlVdEdzSitsU2JCNWFkc04zUmtkbVZk?=
 =?utf-8?B?OWZ6Z0dZUU1MeGlxSnQvVXlCbWxyYk5yMjlhWG9zcTRLTERzUEp5ZkJmbDUw?=
 =?utf-8?B?QTB4Lytsck9JTUpWU1ZnTm5rVlVxWUtUSGlaTHVJcys0bTF5Q3gyOHhWUzhy?=
 =?utf-8?B?U2dRd1ljQlpWTk9UVlZQK0FlWmtZU2NxVUkreEk3TzdJOU4wWWxwZ1Ardith?=
 =?utf-8?B?d1RhVHdaK1I5cWxaT0ZGL3dsUStPNlVPamlsQ3FSRlVzalNCcjVTRnQ2S05W?=
 =?utf-8?B?OWxyMmhSdFA0NkFjanNzRmN5dWxCRTE2SnpqU3ZITVBCK2NNN0t1WFpCU3dY?=
 =?utf-8?B?eXBpeGp1MS96bU45MXRPZVNqZUlHMU5VSXBlRkVaRlRLS2E0OGZyMStOZUZ5?=
 =?utf-8?B?bU8ydFEram1lNUZ3WFpFZE5XMWswOWVyczRvN1YxWWtWREdoN0EydHRNbHVt?=
 =?utf-8?B?ZlBJc1BXemx1TUZRaGR3TUZ5N1RIalQ3QUY4WVJNM3M4RkpuM2FpanRSWVJF?=
 =?utf-8?B?Nmhqdi8rbGQrYXJlMHNMMisrQTlkSXZBblRrZ1RSMDAzUkN3RG5zZ3JEbmRF?=
 =?utf-8?B?Uno0ZSszRGtSWUQrN0RmdG1kU0FPNGN2emdoVFdlVlVWdjhNL1VOL3BVbnJB?=
 =?utf-8?B?aGQ0azBUUjFMMXZiTXpQeTR1RHpDOXRURUtUbi9nejVpYlZlcCtZL3ppMnNy?=
 =?utf-8?B?TjVWdGZQMnRuSEhOeXNOc1kvTG40UitRVDJqMERzM3N3dkdRVGo0MFljcWQx?=
 =?utf-8?B?eXNxR2ZYM1BQOEl3UkV4aFBLR1o5b2JRb1BwaER3dFBza3ZoKzFVN1FrbkxH?=
 =?utf-8?B?OE9aTktOOElrNDZHb2dSTDRiUzk5S1FkeHFydTh1bldLaXMycVk0RW4vd0Zl?=
 =?utf-8?B?Wml5YVhuVHdpQ2JUQndUdmRqWFJTcENUREgwcUJ0d0JFU2ZOdXJmMkxhYjl3?=
 =?utf-8?B?dmdVKzBGNDgrVm1LQjZ0NXc1L0dlbnJIQk82d3BLVFRqaWZ5cE0xZVVVazl4?=
 =?utf-8?B?b3IzcW5SSkZveGNNMUJyeDltU3pjR2l6MzBiZUZ4NjlxZ0wyKzVHYVlBK3Rt?=
 =?utf-8?B?aVlodERkL001U1dtOUd1bWRiM0h1VlJ5L0lTMWdoWGszU3FkcjAwNHlNcXE5?=
 =?utf-8?B?eW9rdkVOcWZ1SFo4bHpIUjN1VG5MYm9ZdGRIMkkwenV6amVJNFRXZEo4eUZV?=
 =?utf-8?B?aWFnZ0x3V08xaUZJTmUwNWpaaHc5T2FXK2ZXcVp3MENNZVFQQ3ZyNWpwQTRx?=
 =?utf-8?B?Smg4YStkN3BGdlVseE9LLzVlR01mYThCYmk4czNlalNGeUZTUTFBTmo1OWZ4?=
 =?utf-8?B?TEM2VzE2K1h2VVEzOUN1MU1qNVRFM1FuNTVlcGllQ0FnU0RkYVY5M2xtMjZB?=
 =?utf-8?B?TGpNUjRwK2dkUnFtMXhsM3d5UlVab3NvMktxM2NmRlhuYlJJemtaREVJMTVE?=
 =?utf-8?B?Tm1mMVBpaWhyNmY1VXN4ZE04SDVwcFdBMkFxYTRmUllRU08vSFJwbVc0eWJN?=
 =?utf-8?B?OXAxNk40cCtqeGdwMVl5cWJvWC9uY01RRlNCQS80b3A1RkU3VENmQ0ZZUUp6?=
 =?utf-8?B?NW1vMEluR25lN3JDY0dnVHZkbEh0STdKUGdpUE81RmV2UjM2L2xaZmhOSElK?=
 =?utf-8?B?d3hRaEtYM05ud3ZjTTZpazgrRTEremVCWVNqcTJJZWJwNWJwUi9HMEtOOThE?=
 =?utf-8?Q?klKdbAGmb71bGxW0I4TfhQWma?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synamedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8792dbc3-f070-4dd5-41e9-08da9567abaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 09:09:32.0281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ecdd899a-33be-4c33-91e4-1f1144fc2f56
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQyrT7r3FnnMpxjiWFtvk3uOsmDgslsBuU+0Bpa+bkmL71ARPvWJFTMrxtwD5+aU5jytTP09I1IwTSQDjB35uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5000
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

PiBXZeKAmXZlIHRyaWVkIHRvIGtub2NrIHVwIGEgcGF0Y2ggZm9yIHRoaXMgaW4gdGhlIHBhc3Qg
YXMgd2VsbC4gTG9va3MgbGlrZSB3ZQ0KPiBlbmRlZCB1cCBhdCBhIHNpbWlsYXIgcGxhY2UsIGJ1
dCBvdXIgYXR0ZW1wdHMgd2VyZSB1bnN1Y2Nlc3NmdWwgLSBwYWNrZXQNCj4gZm9yd2FyZGluZyBm
YWlsZWQgLSBzbyB3ZSBhYmFuZG9uZWQgaXQuIE1heSBJIGFzayB3aGF0IGtlcm5lbCB2ZXJzaW9u
cyB5b3XigJl2ZQ0KPiBoYWQgc3VjY2VzcyB3aXRoPw0KVGhlIHBhdGNoIHdhcyB0ZXN0ZWQgb24g
T3JhY2xlIExpbnV4IDggd2l0aCBVRUtSNyBpbnN0YWxsZWQNCig1LjE1LjAtMS40My40LjIuZWw4
dWVrLng4Nl82NCkuDQoNCg==
