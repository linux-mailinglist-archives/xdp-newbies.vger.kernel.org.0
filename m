Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30A51D7E70
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 May 2020 18:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgERQ3A (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 18 May 2020 12:29:00 -0400
Received: from mail-dm6nam10on2071.outbound.protection.outlook.com ([40.107.93.71]:6216
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727782AbgERQ27 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 18 May 2020 12:28:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5KUv0ezqYqlo8KpPcv5ZxlMiU1DKIh2iz9Le32/+jBG8ioTMnl8QZ5QlQQ3YpGFyoGND9nmK1uuPs80LLtiAWgSPNtD4m5vHEc9UZDeqjJzIVkdpy6hxxfrK6ZlKfvZhma02sjuYgaa7tvi0wHhz3+t0eL6QB/SjmgQI9fDeOGIbJBKgwKnlsMS0pdaQ8LYEel83v/nPlljvrDRL/gKaeZt1WFpmBGPvnaljsKwWyNxJX3iUBIxZFFbpTAx58zuqi+8GkZi8nhl2CKqCUxv6V0NPKCIt0k/P3LPf2Th7dkGMQsS/e414KZ9hwUvCoMzMUgn/YW12vBcrshwAJznAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAcF+zeuNuiMeF4n7S9jgm17L14h/0Rj4zw8z1uGH8k=;
 b=OPCK2JgPzXhZCrCGUdKAKx5cDK6nwCwwnI4vBd6FGIJGi/7WyUyggKHdOOlZhqAWrX7c2leQt0S2RrjRVbV12A7moM9SHy3oAH4muD2hAV1a/quwk+l45VkDUbnKISPowv5JgR5wjYM48e3ldhENa/0/bOcJhbkxjdVU74162vRklvj3ZaxZKmODc6lXGc8P5C5gM72gQsD2k4kDhaXJIqG5ct6YbiKvOnel+fOAmj1eWwbDowEirdxgs1yxLbFZfk9ok9i9Z3ohAf3biTSx3GLZ4Z0ZgifATBiNhZt5cTpDq3MnW2eZxIHLfwzDZRG77Rv3pXnDY20G8Anfiw6CsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rose-hulman.edu; dmarc=pass action=none
 header.from=rose-hulman.edu; dkim=pass header.d=rose-hulman.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rosehulman.onmicrosoft.com; s=selector1-rosehulman-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAcF+zeuNuiMeF4n7S9jgm17L14h/0Rj4zw8z1uGH8k=;
 b=mCoY7kw76po7/EgUeoecpfYKnIX5TViRWD0zhYbyFXwfseRvDauCBKAM4eOWz44cRJUeurRWkepfKqPKYbkTtUMAM5oc8owfEb+uQejFIGT2e+XpQ8a42ilPVkametZnko9HlidKayF2Dp0aV5+uSC58q2aXe/fxPolmKl4NuEA=
Received: from DM6PR18MB2475.namprd18.prod.outlook.com (2603:10b6:5:183::22)
 by DM6PR18MB3017.namprd18.prod.outlook.com (2603:10b6:5:18c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 16:28:57 +0000
Received: from DM6PR18MB2475.namprd18.prod.outlook.com
 ([fe80::3542:60a4:ebc1:cd7c]) by DM6PR18MB2475.namprd18.prod.outlook.com
 ([fe80::3542:60a4:ebc1:cd7c%3]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 16:28:57 +0000
From:   "Main, George" <mainge@rose-hulman.edu>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: XDP_PASS and XDP_REDIRECT
Thread-Topic: XDP_PASS and XDP_REDIRECT
Thread-Index: AQHWLTFlUgK3IeCSVE6TyCfDhMetjA==
Date:   Mon, 18 May 2020 16:28:57 +0000
Message-ID: <DM6PR18MB2475DD12FB5A8D747CA6ABEF9CB80@DM6PR18MB2475.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=rose-hulman.edu;
x-originating-ip: [73.61.13.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6590bb1c-ddad-444c-fa16-08d7fb48903d
x-ms-traffictypediagnostic: DM6PR18MB3017:
x-microsoft-antispam-prvs: <DM6PR18MB30177D6458E965DF6FD4045F9CB80@DM6PR18MB3017.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ee1QaT3WFVseyIAHXy88FzSv4iHUSwCYVkYRzNGBd83NnOfN77SASzXf54ULyw/+yJPLpx5fFEmetN+k/LXpezKbABoiomp+QskzFywgZrM976Y5/GC5Ap/6hdZRcp9ijBy2K5OqlA7GIO3LusbbBkrgRaEA+LRuWTS6z+exy3P/o6n3QQ/bWDvofV/XCfnF1hRO5dsBs7xl42K1qIOaPW0yKZ8uAbGwFrgtI9E0ebGWQUBitKstAuox+p5KiAMvxv3Uy+6/UF7TLx+Hsrsi85F71dsy1OLru7MsdHyp6di54FSioQGT//8zgmp3dB3nV2XLPDVzncPYIL7l9Wf7JGfL3EJ1c5NX8EL5oTUh15v7s/UTcZBBdeZvP3sdVNdkRMTNxuZqEiOoYfyE1ixw90aAIVRs34YEKG14LjmJyHvnwbEke2y9/Dsbn9/AS3VF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR18MB2475.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(6506007)(4744005)(66556008)(478600001)(66446008)(6916009)(64756008)(55016002)(316002)(786003)(52536014)(7116003)(76116006)(75432002)(66946007)(66476007)(8936002)(9686003)(2906002)(71200400001)(186003)(33656002)(26005)(7696005)(86362001)(8676002)(66574014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /GsbZ8w4hWyFBQL9x9UqZBvkD/CJDU9RzdhKjvJw9qogDczifRWcIH9fOp8zrybiW6nh53UkINcb3aSK9yKNRUuVvlJt6+57h3oWL8xrLAV1d3u2jzUkr4QP4Mf/BNlI10dSzOiMqeHDqVH+WJE+homIK6iNXEwpprEIR33hzXZ0AVe6TxfcCGzDSVGiDDCwpOTquSZ4XOLoBAINBVgyw+1fCysdqt2A3uJpvd+dqalqStHkmRrNVLE5GU2wlxozSSOf4ngrCk8lJohdo4bB97cIxRTAkxUVJy/RmRMv7+34yRN6z1l1tirOOBVFDiRrekQTf2YXDoYwbet3xsw/zfr6DhWAzib+MWrhOa0S4ojoZx90olTTxjQr/CUVWHe92FWrngsutrPNOKqjQLzD4XeE9RhdDKmIJFqd1EEmRY1/o+LrluF9BITtMTuMKOOtlRb5RmFCA8SJXZBNqWqMNKN7NMaVmZI8Nn+v8ARH1wk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: rose-hulman.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6590bb1c-ddad-444c-fa16-08d7fb48903d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 16:28:57.1482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6c373827-e5b7-45a7-ae27-b17e388fcad4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uL0m0efYNhfg8/ZKLMUMMoIYZgZWXSQrEFP5f8SzmTQ6u1qHC5Loo2KXZHNIUQ9ANcnTxtnf4yK/eFM7+yTgcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3017
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello All,=0A=
=0A=
I am working on an XDP Content Based Router project. The basic concept is t=
hat a machine running an XDP program acts as a gateway and accepts TCP conn=
ections from outside machines. Upon receiving a message it converts the pac=
ket to UDP and uses bpf_redirect_map to send the packet out through another=
 interface.=0A=
=0A=
The problem I am encountering is that I want to be able to pass the message=
 to userspace (where the TCP server resides) using XDP_PASS in addition to =
the redirect. I'm somewhat looking for a way to emulate the functionality o=
f bpf_clone_redirect, but with support for XDP driver mode.=0A=
=0A=
Is this even possible right now? Are there any workarounds?=0A=
=0A=
Thanks!=
