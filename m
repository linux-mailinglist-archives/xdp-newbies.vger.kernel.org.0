Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78641646441
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 Dec 2022 23:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiLGWtB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 7 Dec 2022 17:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiLGWtA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 7 Dec 2022 17:49:00 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2105.outbound.protection.outlook.com [40.107.93.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C5B83E8E
        for <xdp-newbies@vger.kernel.org>; Wed,  7 Dec 2022 14:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j69fvtKRiJE+sLaShBx1gvY2LbMsIZ8f9FJguvZgi9qsFZUe7NgPkFlnUwwib/p0wPLMVM/Jb4xChDXGkhyt2F3oZr+l9OkyohIPZjIzmzYcHPkswKiUbG3AfVPzswRjFQdmTGSXuQwbZEVHt1U1rpcwUF86iVeVciAhirSsSlot9hYdGCATCJ5aK1+NKZlLlJS/9DfWH8Gp9UnrKmp72rLvg3ByMQnTOYtfOJO9VCk4kez8g7D0vZtsnsydqls6D1xE1N6jnXwFSK0qOugOLalnTZnXrrrcHO8OwuC5qt6i4K29o8EE9CSQ9wmFWHDu+OHysvn9geJrCC8ZCvXB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow/ft1s8nm7W9JfBL5C5SQrs6DHQ0uaiW5r4dNZl9IU=;
 b=j8wpVKupQJPqO1sz4zgLRXjGnfYbdLPtdRuCLYpc4HHj8vJ5MdL5hxM0ALzf+qYh4jpwdBybx5B9eqXvZYiWz+RDA7bVYZNMsUjqUMhs2ZIjmmapQLFsLYGnbbFVuBODhOvq3MbE5uh4AhtBCY0AZHDeBFILsFEUbzRPy1a7s2dng6VcBKhHOOs+jH43PLk+OCu/M5ZfMI2W2XjcVP91YIkIm6ZC4PVy+HBY8+maJnG0bpUb9iAiBSuTKJ8N7V6ccFP2OWjNxxuCW8xM5yQZaw8IfDgcbp+fU9yHqY1LYX7NfkmUP2FgWfAOkyMmSfuGXv0tdnrB12Tz9eDdrMe5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=futurewei.com; dmarc=pass action=none
 header.from=futurewei.com; dkim=pass header.d=futurewei.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Futurewei.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow/ft1s8nm7W9JfBL5C5SQrs6DHQ0uaiW5r4dNZl9IU=;
 b=G5Od0y2Q29HcYa4zp1Y7X/CDNtgiIXjzTm0MZm8CTOfE+WYlJMvtDhelcjLFqm3fjNohlAdOAPYLdBE0GCOQTsMF2I/HO9r6P7ew4428b5LGFq+b/Hq5zBhM4AaXEpzq0DKL46k68hWC/0iHllSf2F6SiTiovqKo0+66AE9SilI=
Received: from MW3PR13MB3914.namprd13.prod.outlook.com (2603:10b6:303:58::23)
 by PH0PR13MB5998.namprd13.prod.outlook.com (2603:10b6:510:16d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 22:48:54 +0000
Received: from MW3PR13MB3914.namprd13.prod.outlook.com
 ([fe80::dc0f:af7c:d16d:66a8]) by MW3PR13MB3914.namprd13.prod.outlook.com
 ([fe80::dc0f:af7c:d16d:66a8%8]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 22:48:54 +0000
From:   Zhaoxi Zhu <zzhu@futurewei.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Is It Possible to RX/Process/TX packets concurrently with AF_XDP?
Thread-Topic: Is It Possible to RX/Process/TX packets concurrently with
 AF_XDP?
Thread-Index: AQHZCoZZl6N+066Kg0uWAZSukMncCa5jA4GK//99gAA=
Date:   Wed, 7 Dec 2022 22:48:54 +0000
Message-ID: <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com>
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
In-Reply-To: <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=futurewei.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR13MB3914:EE_|PH0PR13MB5998:EE_
x-ms-office365-filtering-correlation-id: 3e9aa888-b832-40ff-42df-08dad8a537f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MEs4QKilIjcbxJXLgr/QRaKSIRHchpxj1bcylhc4ofkCdg+LUEJsWG6jAdLuRT5/sM03pDYACfk4N9Sc+6aiOlN3eU/JLdxdDsAeXBk40IOUCw6J7mbtLACKqx81iidEFWPmgzuqJ+zX4NNuAoud6LUt2gy3MOppjY66Ow8jg72q93Wbh/WF3GWcvj0p6BTB9kx4lGML9aoBkxI9xzQkcO6CH5lANJs/uZubnL4IMHGDxYl/jj2zEua+Pqy6QKRnbDUF6Wjxq+uWSwr/6EOU7YC8F4xvFQKc1tOeIt1wkpCVQ1v1yr9C+oxf4Sw1juXq0ETisyI6VXal+Dm//JDgmYggaUSsVzmPSTaEwcMdWGSywKcuibXfPf3pUII0wJNF0go7M5bh/QUCqhydsp3RMFMKUMFc308M5iTe0n73mrQvbAJhcsblH6pu6wAR4LCDgQ3CWUwSDrJqjfcXH18f7pucq7v4xALdLt4Mxk0SjPp1f+MlkIb5MF2Te4djmsJrsJfILMt7Zb2JecVRytOrJyGalxOpxYazVkWjhZ7lsZrXPsfze5u0Yy8/FOh2ZhV7EwOZk+e7kDSm5wGRxDd7UZLv5Yg3xrtNj+O26l5VeclSuR6cV2BiJ2PFieP9es3LpZPblffLbBt9J89aS8WrqOYVnAQoDGysuae5QfLai4HNh1tzwVBKxptod9xT/IAfrYTsBmsCKK1IIU38cQ9JsWz+6EKOKVz+OLGSGPMNuNtLnpwSQpe1YIFtMnpzmufwApua7UUdASf0eF/7tw98csgxLLfDlIpdbytwpCkV7f0CoFiokSCaVx2XSq3RnDQpmNUt+gQ+dQu2xaON1UW+Vw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR13MB3914.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(451199015)(38070700005)(5660300002)(316002)(8936002)(6512007)(6486002)(26005)(83380400001)(38100700002)(6916009)(2906002)(33656002)(6506007)(122000001)(36756003)(71200400001)(64756008)(8676002)(86362001)(66556008)(66946007)(76116006)(66476007)(66446008)(186003)(2616005)(41300700001)(478600001)(45980500001)(36394005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0Y0YTZhY3dIRDc5Y2pjZ1VVMVRRMlI3VkdjM2NaRW5qVUVZbjJHazI4S2xJ?=
 =?utf-8?B?UFZaTmlPOENSRDV0Zmk0MkczZFRuUDFpaEh1MW1UQXhheUhMRUIwL1JuSnpy?=
 =?utf-8?B?b1FPUDhwdi9tS2l3NXMrZDZ1VTNDQTIwYnZGVzRYeUlGNDdJZ00wM1FDVWRT?=
 =?utf-8?B?OEVVMSt2ZnBoY09ZdWpUOWN4UTBDSGlaZWQ5Z3JBcUZPdVkyNms4U01yR0oy?=
 =?utf-8?B?MUxpM3EzTFRDZTZUNmRHZTd6QUYzNlkxUjNRK3JadG5lZ2FGQlhkdGd6TG1B?=
 =?utf-8?B?SXF0U21DQ2FEcjIrZXNmd0RWMjJMM2lqVy9rb1MxbzNtVFZHTzVEZS9ZdXN6?=
 =?utf-8?B?WTZDNGVNNC9GOWpKdHJrYzRPdUhzb2c1alhGOHo4Ymg1RUpXd0FLa1RuRlo5?=
 =?utf-8?B?aGdOSEREQU9udGlVRmtTZlNkWnBvL0hwazQ0N3hwOWJNRGlNT0Q3UUFhbXFx?=
 =?utf-8?B?N0hYb0R6OHYyVjVFbG9PRTFLbTNsS1J2ZEJuSU9JUGxJdCt3M2c3RDU4SXdx?=
 =?utf-8?B?YXRvZDlpakUvdmdYZWo5SWNOelFTYUlOdldxclkyT2QwbWU4emJjd2ZDV1FU?=
 =?utf-8?B?TzhNajNERGd2Z1gzY0NyMFFTL2VoRGFINTZ6QXNudmhwb0x5UmVoTkhDeW9h?=
 =?utf-8?B?KzFORkN5aWFlWUY0S1daUUQwNnNmRHhnQW9UWVdyTG41NVBhLzA1K0NPeWta?=
 =?utf-8?B?V2tXRkR0SExpL2N0aUVyL3FUcm40VXlwaEZiVko3QnZsYUlmd1B2MWR4WXB2?=
 =?utf-8?B?UHZUaHc1OVh2NGQxMkY1cjZHYyt1RExHU2Vpd1Zkd3p1ZS9IZnpLUlJHakNx?=
 =?utf-8?B?UjJUTGZqTGg3RUpFSERIMkd1ODlRYWwzVGtMQ3NhanEyaDhEL1J1T0RVdnJL?=
 =?utf-8?B?VWhFMnh6Vko3Q05jM0tPeXZWSUJYOGNhWFNLYThNblpPallqdmpjdWZpRjFQ?=
 =?utf-8?B?T1g4MXJ1UVVGajdXVExEMExpZklEQ0p4T0NaZ2hPU3hCOWVrZ204aVA5YjA4?=
 =?utf-8?B?SzMyVUxqK1dsS3IrbDhERnVya0d4by9TdDlQLzNEK0dHRGpNQmg1ZGlyMlRR?=
 =?utf-8?B?WkdNSm45a0txa0dzQS9BMkc5L3R1KzBxMzFDMjduRDRQTXpWQ0FnYnFMbnRj?=
 =?utf-8?B?TkJpc3Qwd2k4cUJNS2VXR3hQUjEzVHBzL1lHY0llRmJUUStXcUR2M0xxblRJ?=
 =?utf-8?B?MEdHOStSMXVqTmVHdVY0b2ZKaUltVE5rS2FvRkFZNjQyNnZ1MS82eVZieFJp?=
 =?utf-8?B?TDRtSFNyRE1VNkI4NWNFeWY2ZTZrTHRGQVJkTVQ1Z1hvcG9mV3AvRVc2L2VB?=
 =?utf-8?B?bkxNMG15bW9GRlVLMFF1V0dHU2pja2ttSWo2L1N3ZEFkcEMvTklpK2lxTS9D?=
 =?utf-8?B?d0xTWVA0WDhDNW4vRkdwa1BnSytTTit4NEZCWHZFbmF2eUkrMDZqTDIySGFn?=
 =?utf-8?B?SmdKOHFYQjdTNTBrV0JMbFdQcVNmQ1NJT1NoZ2Q3ZnVlOW1FRXNGRDVYT2FO?=
 =?utf-8?B?Z205bjQ2Q09XczBJcWc4eGo5djRnTUsvUmRlbHBFcVZXZWFDRm9pUEpmbUpE?=
 =?utf-8?B?K3U5Ukoyc1YrL0dyYTdnTVp5NDNOdHhMRFc0RC85dnJydmUyZlpnbUFuMmtP?=
 =?utf-8?B?QWp5eU5qSFN2OHJUU1UySm41V0lNSjBpNVExUmxVNzNOWWo2dU1XdHJVbE1r?=
 =?utf-8?B?RHQzSkNxTDMzRG5sNUsvT2tPZkgwUitVMkloODFadWRtVVc5M3NJaXdaVml6?=
 =?utf-8?B?ckcxWVVoOGNucXE0b2tGRGNjUUhlUEJ6UVBZMldkZzBsdEdIcmxuUHRlR0F2?=
 =?utf-8?B?NzhtMmxYSDI5SWY1cG1zclh3Vm8vRUNIT2tzRWJtb3QwdjQ1czNaMlNPN0M1?=
 =?utf-8?B?S29vSVJickIyWnpyTkF5OHZhdEp2NWZON3lvTE5lZXdjbzZBRWVpa2kvbnlp?=
 =?utf-8?B?VzVRdUY0SDN4bzBWUTMydFQvM0IwMEJ5dm96dGhqNFUxbGhDTkovSTZYYzV0?=
 =?utf-8?B?MmhPQlIycXFOZVFHU3VJaFVvNUxPR0U0c2lmTG9JVjF2RndCcml0UVVNMVRR?=
 =?utf-8?B?ZEdHelVVNytQZUNHV2xZdnlLZ054WktDbFl3UDVHbVZ2K0E4MFlTclpHS3Bo?=
 =?utf-8?Q?4xtCJ5vQcnVYWNoo6L7o2JKbW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D15BE489AF5A74189888D39F0F7F0AA@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Futurewei.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR13MB3914.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9aa888-b832-40ff-42df-08dad8a537f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 22:48:54.6254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fee8ff2-a3b2-4018-9c75-3a1d5591fedc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0p2v0OhrVNZujKHmq0r1TW+P5+ca3QF8CVIbLgvij1Xp4NcO9bSaNI3+eyPfB/SGsfZx6zS+Jui/xig133W0WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5998
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SGkgQWxsLA0KwqANClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHJlYWRpbmcgdGhpcyBlbWFpbC4g
TXkgbmFtZSBpcyBSaW8uDQrCoA0KSSByZWNlbnRseSBzdGFydGVkIGxvb2tpbmcgaW50byB0aGUg
WERQIHRlY2hub2xvZ3ksIGVzcGVjaWFsbHkgQUZfWERQLCBhbmQgSSByZWFsbHkgbG92ZSBpdC4g
SSBzdGFydGVkIHN0dWR5aW5nIGFuZCBtb2RpZnlpbmcgdGhpcyBBRl9YRFAgZXhhbXBsZShodHRw
czovL2dpdGh1Yi5jb20veGRwLXByb2plY3QveGRwLXR1dG9yaWFsL2Jsb2IvbWFzdGVyL2FkdmFu
Y2VkMDMtQUZfWERQL2FmX3hkcF91c2VyLmMpIHRvIG1lZXQgbXkgbmVlZCwgYW5kIGl0IGhhcyBi
ZWVuIHdvcmtpbmcgZmluZS4NCsKgDQpIb3dldmVyLCBvbmUgdGhpbmcgSSBub3RpY2UgaXMgdGhh
dCB0aGlzIHVzZXIgc3BhY2UgYXBwbGljYXRpb24gaXMgc2luZ2xlIHRocmVhZGVkLiBJIHdvbmRl
ciBpZiBpdCBpcyBmZWFzaWJsZSB0byBtdWx0aS10aHJlYWRpbmcgdG8gdGhlIFJYL3BhY2tldCBw
cm9jZXNzaW5nL1RYIHBhcnRzIG9mIHRoZSBwcm9ncmFtLCBpbiBvcmRlciB0byB1dGlsaXplIG90
aGVyIGNvcmVzIGFuZCBwb3NzaWJseSBtYWtlIG15IGFwcGxpY2F0aW9uIGZhc3Rlcj8NCg0KwqAN
Ck9uZSBjaGFsbGVuZ2UgSSBmYWNlIG5vdyBpcywgYXMgSSB0cmllZCBkaWZmZXJlbnQgcGxhY2Vz
IHRvIGFkZCBtdWx0aS10aHJlYWRpbmcsIHRoZSBwcm9ncmFtIGRvZXMgbm90IHdvcmsgcHJvcGVy
bHkuIFN5bXB0b21zIHN1Y2ggYXMgYGFzc2VydCh4c2stPnVtZW1fZnJhbWVfZnJlZSA8IE5VTV9G
UkFNRVMpO2AgZmFpbGVkOyBJQ01QIHBpbmcgcGFja2V0cyBkb2VzbuKAmXQgYXJyaXZlIGRlc3Rp
bmF0aW9uIHVudGlsIHNlY29uZHMgbGF0ZXIgYW5kIFRDUCBjb25uZWN0aW9uIGdlbmVyYXRlZCBi
eSBgaXBlcmZgIGNhbm5vdCBiZSBlc3RhYmxpc2hlZCBvY2N1cnMgYXMgSSB0cmllZCBkaWZmZXJl
bnQgcGxhY2VzIHRvIGFkZCBtdWx0aS10aHJlYWRpbmcgdG8gbXkgY29kZS4NCsKgDQpTbywgbXkg
cXVlc3Rpb24gaXMsIGRvZXMgQUZfWERQIGFwcGxpY2F0aW9ucyBzdXBwb3J0IG11bHRpLXRocmVh
ZGluZyBkdXJpbmcgUlgvcGFja2V0IHByb2Nlc3NpbmcvVFg/IElmIHNvLCB3aGF0IGlzIGEgcHJv
cGVyIHdheSB0byBtb2RpZnkgdGhlIEFGX1hEUCBleGFtcGxlIGNvZGUgdG8gbGV0IGl0IHJ1biBw
cm9wZXJseT8NCsKgDQpUaGFuayB5b3UgYWdhaW4gZm9yIHJlYWRpbmcgdGhpcyBlbWFpbC4gSSBs
b29rIGZvcndhcmQgdG8gaGVhcmluZyBmcm9tIHlvdS4NCsKgDQpCZXN0LA0KUmlvIFpodQ0KwqAN
Cg0K
