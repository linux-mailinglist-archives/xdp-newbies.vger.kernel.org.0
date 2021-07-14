Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA513C934C
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Jul 2021 23:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbhGNVsD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Wed, 14 Jul 2021 17:48:03 -0400
Received: from mail-eopbgr70074.outbound.protection.outlook.com ([40.107.7.74]:64238
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230352AbhGNVsD (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Jul 2021 17:48:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfSGc8N9GolIoHeMCGiQVNBjgjrBKUq6/n/ePf4k8PFrXgpnlw/3zT4JoxwzO5Guvjh0zgpwE92HzyRF0na8PKXS6wdKOUjl2TeKakT7L/smEd4/vymPJlgP777T5AWRRq4YVu2ms4b9rXmM7P378t+eR8kVb/ejVW4RlCjQ2lfiufZnUPdKfzc89lyTX0lSi7Wt89UgGmB6Ttu7Tmspvjq7YBRrakCUfembmFJbIL0nILO7lOIHFAxNz9ypeAWElCoTKA9fAbrjhRZL3eH9cQsT2aMmncQP91pnXvI21onT9jR5RUhvy+5SuIl6PdHkR7UI8KtQzSh1W1sn5xg4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=je3RpnGqpnL5RlCDp8Dx7EMfgNf4aFzLYyOLJefASH8=;
 b=EKw/4WvUIu3TMGCLB5s7LKFz9JU0WL/WagNk/tOf1ZUgDJWIX8PZCiyxQcckpZ11VI+kCNJLEl8Io1QY64XvxG91SieAVzN0ihq0jTyuO4EQL7r/FdBK6+rN2klTOcCKNFKpKPAk8XmBnNZteQBct29YTJ3arkn9V5jNvh6lr9ebxQTaB2GL5yV8d/nTK/GRXQniCPOgVBORK1QWT654qG/MmiN0is6wqTEmRX/gbwLCbV60BORiE3rUcMuro2lIgsmit1xQHxTJi6X32EGAhKTtsTr8C3FQN9eqf3+btwFW0s8Y35pVrV5h8pp4SDSRj5TpUYX8hCuno841Kqg0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=stud.acs.upb.ro; dmarc=pass action=none
 header.from=stud.acs.upb.ro; dkim=pass header.d=stud.acs.upb.ro; arc=none
Received: from VE1PR01MB5631.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:120::29) by VI1PR01MB7008.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:19c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 21:45:08 +0000
Received: from VE1PR01MB5631.eurprd01.prod.exchangelabs.com
 ([fe80::bd6c:809b:6e82:aa15]) by VE1PR01MB5631.eurprd01.prod.exchangelabs.com
 ([fe80::bd6c:809b:6e82:aa15%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 21:45:08 +0000
From:   "Marius-Cristian BACIU (87611)" <marius.baciu@stud.acs.upb.ro>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Random XDP detachments
Thread-Topic: Random XDP detachments
Thread-Index: AQHXePlc0uxNE12P4kqJHrRNlf3CoQ==
Date:   Wed, 14 Jul 2021 21:45:07 +0000
Message-ID: <VE1PR01MB563154CC7B9BBB5B750BF3A78A139@VE1PR01MB5631.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=stud.acs.upb.ro;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e15b0bd3-2832-49dc-d317-08d94710a60a
x-ms-traffictypediagnostic: VI1PR01MB7008:
x-microsoft-antispam-prvs: <VI1PR01MB700874378E3ADE140E9157638A139@VI1PR01MB7008.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LY4G2KWCGC9lmV/ngIPIS295EVs1rDahSAO5jLG/tTKEqUB7bXpt1pPvFlfCDkF3huvSX5vFvxIZ0Z161H74cFYDwW8WM7XRNi2O+XPykx9swBl5PAM4Nzqm/PmX0zt2LacJi08GgDEgn0eqO6t/gepbNhPpzeO9pDQemV3pfEidMWo4aDabfixiloXi1aZxtoOGueJffSooy0c0cIXc029K10mxNecYro7glhxXE2iIb/is4Pyrf9AfzMXUr0HW+a7kaZFqaHay2uo3gOheRUhBEE16nB2V18wDcEcGjnqlsr6fYO5yZUWKZTSU6yZSPj+VIVtXGIqofm2iBZ/rHqD0zwnxtNeB5+RKujS6dYx7M9PUgjinxcm1OOiukJCmHfJGdlWXvCJ7Ah2bPQJj5TQ5xdXL+LEtL3lG69yAXmei6oiKZ40MDEs/7NzXy5lRgV3Ff9PcjT2pQd4a7JG6OTohp0DgCbhFbV7h49pDZdNa0ruGoKJVCNuD89DNlvXPdXJjuVjQJPS19RjlysfTavCMZ69ml8GvDlv+71C8SmXpPCHkeoSdkzguEyb5RLphsBWwzJcIQFKsPf3InOyWPES16jPh+oQpgpSvhkkbys5s2QseLQ+gWI2B5xqQEM97bs9FQq0+S3F41qf2tHnTODSAUgod3C35DPJ9Hk2blNtdShZvfhTMhbWlP8PFkrlQY6XckohkvXvo7z6QL3OVdiaKU3Gtyl5EILqiAK8AdqE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5631.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39830400003)(786003)(6506007)(83380400001)(71200400001)(3480700007)(8936002)(478600001)(33656002)(55016002)(186003)(86362001)(26005)(8676002)(9686003)(316002)(52536014)(5660300002)(4744005)(6916009)(66476007)(66556008)(66446008)(38100700002)(64756008)(76116006)(122000001)(7116003)(7696005)(66946007)(2906002)(38070700004)(554374003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4KA5JZkcwXsJwN8p7BFbMqaWdiG0uuqKyIZPsBtTAGGnLM5fYrvq4z8tiX?=
 =?iso-8859-1?Q?r0hs0T9t84ohQkbe99h8Isy2m7rVC/N4ullQkQkWdpAiBaV1aU5VfZ58IS?=
 =?iso-8859-1?Q?WkS41sI2u8jv1juU6i+nl3wiex/bpBaxug9FzZ9K+Hc1cpTLW/HLpqr9Jo?=
 =?iso-8859-1?Q?bgGXiYObOOvD+870orU8NpE/JUwv+TWsgWG0Tr3v32NfaaRsbjQj+mXgu8?=
 =?iso-8859-1?Q?GaTHJTqSyndLrTaQaBvZBdgPOvqd8UA1oAawYrf60ExcHJvsjym2vqwTkd?=
 =?iso-8859-1?Q?I14N0g+NnIkYcsaxsEj8aJVxsFJnS8ISNhHi4Dliu6rBZJBgivRA/9+kxp?=
 =?iso-8859-1?Q?tzloobFE73k8bsRy9D9PGCc57xTOanQRarjxpC09rthVadUOhP5V9WJQEh?=
 =?iso-8859-1?Q?zGXadITKlBM6D915UDvydDWPNo4AR4tk4pyiSCMElHfw0n7902UEYoVWBE?=
 =?iso-8859-1?Q?Xn1RWek8STQ9uQZjlzZhRaBPUxTthh9Xwum02OpKqFbJwZd4DxPBn3QuSL?=
 =?iso-8859-1?Q?IxGoWqIlcBd22GBjMoIVbxObNhENplAaFdya6rPy0dAj8YN6Q9qYmyJeKp?=
 =?iso-8859-1?Q?QlEWL2ptLaROaZeEtV+S6GrYtjjHSap1QjUa+Fm73fKTwNKSYxBH5zaTsz?=
 =?iso-8859-1?Q?19WgPkNMcwlEsNHcSVjvvo6yndJeMzZXUX1flu7DrAkoPtVOcM/g7eKU7E?=
 =?iso-8859-1?Q?ay93w9bnojGKKtumt1+HnNIQX0IZ0eMjRqtCJKwCQoAHzUx9mDCxppoxw0?=
 =?iso-8859-1?Q?0jI+RIVHvIP66f0ro+svAOBWkO+5teikGwLpzq1HQ1JL77imi7JFZ3SRxf?=
 =?iso-8859-1?Q?KIVlGc5E5ZzNm2HLK+dx9L2xmLrDH3mkK/gCOzZcj+KyWToVnqo1k1Y/fZ?=
 =?iso-8859-1?Q?d5C1dfzz87KBbbiyFKqs/k5vMdsoNbUuqYHhiTXMnC3QWqjBWlKj7hMfpA?=
 =?iso-8859-1?Q?LlqNvIOnd1Ri5syLNSE6M+91FcPJRpuUrhGY3sEiKJZqnX9Ix/WzE9jSOi?=
 =?iso-8859-1?Q?SLC6CGezatJniyMKYKXxAMb2/32yPYCIl1gdh/tRbf8oow9G9v/KqF/AyB?=
 =?iso-8859-1?Q?bBvftzhUL8BH9KtLheSls4nlNacGRRzq50kf221yjad/UJjJHzsxj1jrav?=
 =?iso-8859-1?Q?nBbdGRti/hWPRZmpPVhX0BWlUd6g4tcWw/Q6LxqQ6BclW4uZG4hpTMV5OH?=
 =?iso-8859-1?Q?jpNTcCcHulKqeyimwtolPZQwBOZyioBu+m4tG9fT4FbM6Ljq6Gt0gewOgJ?=
 =?iso-8859-1?Q?n3tHrTF9v5xfLy5KGf51F1AFXShw+faYwdQMOzhkdJ5aDAe9nxMaZbBoiN?=
 =?iso-8859-1?Q?Rh5Js42e3l7hGMnOpJ0lN+ur9v34kE2QuW9qsomdi90BlhY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: stud.acs.upb.ro
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5631.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15b0bd3-2832-49dc-d317-08d94710a60a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 21:45:07.9262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2d8cc8ba-8dda-4334-9e5c-fac2092e9bac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMgx0Ost5mPfdTDtEul8WSFP9zNlRNftkz6iYbtfi3zB/G1SNpdDLw2x84z8E0uOQJzWSFsIaxp821LvrTKZCAY0/CiXlLjs5r5OmEv3L6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB7008
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi, 


I'm encountering a scenario in which at random periods of time, XDP programs attached on all interfaces suddenly detach.
I have not found any relevant kernel logs during the 
times this happens, and I could not link this to any userspace process, 
especially since I only need to bpftool attach in order to reproduce this.
Is there something from the kernel side that can cause 
this to happen? The XDP programs have also been used successfully in the
 past with no problems.
The obvious solution of a reboot is unfortunately not a possibility at the moment.


Thanks, Marius-Cristian Baciu
