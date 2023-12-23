Return-Path: <xdp-newbies+bounces-23-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9B81D6C9
	for <lists+xdp-newbies@lfdr.de>; Sat, 23 Dec 2023 23:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7D2628271E
	for <lists+xdp-newbies@lfdr.de>; Sat, 23 Dec 2023 22:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58871D53B;
	Sat, 23 Dec 2023 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=radware.com header.i=@radware.com header.b="FVkJzIWI"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2133.outbound.protection.outlook.com [40.107.105.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6E1D527
	for <xdp-newbies@vger.kernel.org>; Sat, 23 Dec 2023 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radware.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAZEJwMLVqCklwTRhQCeeTDfPe5Gfs9iSubDxuxiwwqGXltjZWghHZnIytQetp8VmJuixX171v06+qNL7CsMu7WMgrVTiFUxb5q+XTgPkKvGJT67M4Pkdok0t16t/j76DON+iMXVDfz3R2Xo+xqjOMtOC0lKQHEJxwp5PRD7UGMa1JyCvNW7m5aI5QyOo2Qja1sdgbWh1GegHDTqrb8GvQMW8u5c47UBYO7GiytCRfhv/8Eoig0CjuDtvQ0dlekveIsAI7AjMjTu8YGOSDby6Fs7A/BPJ3KAxUpAPP+I7rxBlghdAwhVJfRjKB/c+X8O5dheeVElE8ZcMxBkqUrbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+3rRhEUe16z9bup6wHH9xXnelzfmZBDtueX60Fm/D4=;
 b=lS/FNrcMOALfhgjfr/dAsuAvWbVzGyS82vYn/R18Dhi9W7cFKLfgE/03fm6s40j4q5k2ZEvDGXSIdMTqJPRPC6daqL7QLsjR1pl2jSqad161GcoT4mR3QhHC4g7fQzfdCAWb4KnJRy2Ndtf3UsqB92bt+se7PAKDUMKLwYFl+eo7B0WPDMeHbzkJInPkP8BdkKkTiaMRAt/VgQBcpeUougCw2YQHiC/mH7s5MVRgJMK1x3MMQnnjeANopAWHcXGQ2V7y29dqTH9uS66gAr84mXIP1sH2Q8kQit1pRh+IdzTu9xTPAHiNu7SU1kh4Qig12tl1FE7dIA7QAsQUTqQiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=radware.com; dmarc=pass action=none header.from=radware.com;
 dkim=pass header.d=radware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=radware.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+3rRhEUe16z9bup6wHH9xXnelzfmZBDtueX60Fm/D4=;
 b=FVkJzIWI62aI8k7In0shYLv2lpiLCIJPCwaZUtLAEe0V8EJFTm9Pa8bZub/0pyL1Q36FYT/Tc194zGdW0FswGbGuUkTqWEbz9Qj2hR/sGKiPGTrzZlImQHEmZ4qO7XG29YJtp3hiZfxyi8dCqD1o6yI/A41QGQ9ClObMiR9g3PnLvyl4jdS6q2ZmV0ubXDJrAD2Tvo1ex0s5FBbS+0iX/Xkhf9vQg+M7lc9RwFMEZpZH/+rZzv76sR0+nx4KOoAsYsC+VG6WaMRNk7XQkXOLGaQGfAHv1AlZ/vrsoSY3xwbmD68qZkjGXrCFSFTWCnaBYFEiN0DJa87w/gxCaKhEvA==
Received: from VI1PR01MB3807.eurprd01.prod.exchangelabs.com
 (2603:10a6:802:65::22) by DBAPR01MB6839.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:192::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.24; Sat, 23 Dec
 2023 22:24:51 +0000
Received: from VI1PR01MB3807.eurprd01.prod.exchangelabs.com
 ([fe80::ef21:2a9d:3d2:e750]) by VI1PR01MB3807.eurprd01.prod.exchangelabs.com
 ([fe80::ef21:2a9d:3d2:e750%3]) with mapi id 15.20.7113.023; Sat, 23 Dec 2023
 22:24:50 +0000
From: Yuval El-Hanany <yuvale@radware.com>
To: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Switching packets between queues in XDP program
Thread-Topic: Switching packets between queues in XDP program
Thread-Index: AQHaNe7X8gP71i0WGE+d1MjtKBFQfA==
Date: Sat, 23 Dec 2023 22:24:49 +0000
Message-ID: <52605D3E-4242-46D9-BFA8-50DDA0F6A84F@radware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.300.61.1.2)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=radware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR01MB3807:EE_|DBAPR01MB6839:EE_
x-ms-office365-filtering-correlation-id: acf5501e-c5e2-42c0-23f4-08dc0405fa2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nrPoKhTqx6L9mSHjqQD6r3+z7VMRuCaR6l6+UUAsZ9x32SCSsIubplOt0OvCh7ChqU4XeecikO4DUUbsGMJp9WBaXCjv60/gTktcFXYePtGvXuNWZQfjew1JY+qWXs10GSqUeKWKGwY0xAYNVurOA47InlO9Djf6CsUVHcZ+bo0JMCGtewAwrBjRsnm2e9Icd8ZtEtpEtQaSXmzUTztpAiT11+XaWE/86Pt0XsEavNu6rprMUZ8O5rli2W/TdAz0wyJ4KEgmT7ePeWQ+ll0AVbT47Jq6VQ7HIXDEkK25AweQd3+kEjbj+6DhTW+fYDHKqjzYEiMz5VZzIdP4i8iMjVUDEgUMjNUO5atfepzTxlPwvKz6VMYbNAFAbXKeO46YMJNRoM/RR+ZzmhR0lA9gXW479qu7/ywvWDr0acFs2wfOUtr+ugdTFFxABXP10/l5AqnDj+3cLTgvW9HJauPVN6rHVv41UzjTCp5zv8wHZljvF25uxzIBFbTTSGYaVqN9RstLLLwFFLygsfmwlvTVfmVXGtHFiyuxVhGME167w/vC0MOKY+PJVe68IjRCueIg/B8Qfv+eOkc+bA0O3WgGu1nGFk7AcNJUYM7FErY8w05WcjXLEmPTPf585mXdhmQu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB3807.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(6916009)(6512007)(6506007)(2906002)(478600001)(71200400001)(26005)(2616005)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(91956017)(8676002)(8936002)(316002)(6486002)(5660300002)(122000001)(41300700001)(38100700002)(83380400001)(33656002)(36756003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGRkcFNBTUs0TWJzWSt6dkpPb2xoeURrSXdPY2tOR0FsYTBneFRxM0Q0UFhV?=
 =?utf-8?B?Q3lSV05KaFZOMWFOZVZpYlV0dHp3L01iU3o2dVNsL08xc2F4YVdZdHhQY0Z5?=
 =?utf-8?B?bEpOc2diQklrMFlkUlZISnAvdC9jaytVSStSb3A1dlVibHE1UEJiZ2RIb1F3?=
 =?utf-8?B?MGs2dWo5N2NLeEphM3BSbGpNRk12VlJyU0wwWEErMTZEczlrdEpiTkJQd1pn?=
 =?utf-8?B?YWpNVzhEbDhkQXRTT3QyNWt1Q1lyZmtzRjVMY245emQ2OUowZS9uWkFFQy9E?=
 =?utf-8?B?djQra0lWL3dmRUlTN1lKUWE2L0lEb1E5b0JuOFg0OXhRMFYvL2llZkdNejZG?=
 =?utf-8?B?cVhhWmVkR1ppWXhxd3JYQk4yRTdOQ0FJRHVxK2J6aGdxKzFqSG1wdDl2U05z?=
 =?utf-8?B?ZjhVTGdhanhyb2lNa094ZkkyM0ozWVNFdVpPakROZDV1Yk5xWUs5ZUlSMkhU?=
 =?utf-8?B?NkhVMUZoNy9kdUdHd0k1T1M1U1VaVXFTSy9GNFREWDBMQmlySllIWVBnWnIv?=
 =?utf-8?B?KzFyaEhsMTM4dlllWHRBUkVhbXg2T2Uyb3UwYXV0ZWJaMk83a1RneEZqOTAv?=
 =?utf-8?B?R0ZSWGNhLzRZUmczaVlhdS92VHFhOFdNOUpTNmhPZnl0ekxaaldLYUlkQThM?=
 =?utf-8?B?cFVaRzBCMjYvM0xSVmNMZkFRS2ZaOGllOU12T3FyNkZublFkdmZsdXR4N0tv?=
 =?utf-8?B?NWFUV01SMURFd25qa3FIUU5tdFNaam53WVFncUJ2UXc2TGZvYWF4eVk3TGtt?=
 =?utf-8?B?dU4raWt3WGcreTJPbVJRMjhJNXhoVGhRY1g1WWVoTEZXcUpiWWdPQk9DNkJD?=
 =?utf-8?B?Rkw2ZG82Q1c1TjBwTkMrcWpEUVpUWHhIRklscVNua01WKzBBMU1RVEF4UTJo?=
 =?utf-8?B?c2pwdjY2WEZhNEZHQU1QMkxBODluQXpmV0VuRCtXWXZCTFRyckhuUHUvTjha?=
 =?utf-8?B?VXZoUjBqRXFBZWhSRW1YSTEzNjJseXpBQjdOUkRKVDB1Slk3UW1iSmM5VG1l?=
 =?utf-8?B?TUUrWU9tR1RSZVNmSlRuV1BUN2dQTFgyWU9QTVFFRXhXSEVZYTZtUmFpWXdG?=
 =?utf-8?B?bWMrWVFKNytqSVlzTXdOc2JER09YZmI5bTNCVTN4QVgyVW5ZR3JhMXlXV0NK?=
 =?utf-8?B?N25xWGRSVWhLRUdGQXpId055SDN1dDRaa1NWU1F3ZWFEMTJEcFg1WFBCS0Zy?=
 =?utf-8?B?ZHpwd0xYZ0VLaG9EelpmWUtBZGFPTDZGdFpUL0ZETEg2dFVoOTVEUzFXUWRo?=
 =?utf-8?B?b0F3a3lnaWFLUTYzSFVNMUErYjh6bHM5c3J4eGZEOEFITVg5SUs2Ylp3RS9a?=
 =?utf-8?B?d0dueU0yMzhTUHhra2tFNHFUdU5zMUN0VytTVTYva2g2dkNnd28zcTYwUkJH?=
 =?utf-8?B?RFk4U2RxaDhYdHhmVWM5dFhjeUN1djQzOCs5ektBOUpSVXJsTkdOMVIzVEVn?=
 =?utf-8?B?WHExelZpOHNLNVlRNUFlZCtHVmptN2IrZ0RBdFhObDRSNGM0dFhUL0tJN1NX?=
 =?utf-8?B?SG42bHhxVk1TQzFjSlVnUDEvT2MxNVFjb0YvVGJidG5CTnFPN0t5eGo1MEo1?=
 =?utf-8?B?RzhGTWJNSkM2d2dxV2V4NXg5NDF1aitDQkRZRE5jVytJdEE4a2lqNVJCVlBj?=
 =?utf-8?B?ek5XVkdYdnVReDZRa1NxeXRodkJ0TDVtTGEzQk5LNmx5SHViZ0ZmSno3TVJR?=
 =?utf-8?B?UW1uaGlUK3lvQlJhcDhtOWZLNG9yNCsvVjhNNVd1Uk9PNU1JQlNPVEY3bUNl?=
 =?utf-8?B?bDgxMmpmcEtOOU92UFpuemtSaEZJeWl1VUcwMFU0SUJ6Z0o1T1hvS0dPYlZZ?=
 =?utf-8?B?dnA0Nll0MUlFZndCRmNkcDdQV2xJaEo4dFMxeEtRMFNtU2lXVlZ0VEdPN1R2?=
 =?utf-8?B?TlI1RjV0SFpLSEZFN3pCV0pYbHU5SWxRZWtsUElQdFI3elo4T2E4aksyekhk?=
 =?utf-8?B?cTZjSlJJay9TTlBrVmFMM1laS2lyVDZKMURGbWNoNGRFTjlvaUZNVVNnZEJi?=
 =?utf-8?B?dFR0cU1tdG80Y1hwQ1JndkE0U1VycXlSdFhvcDhrS1NEcnprcXhWcWx3cFlC?=
 =?utf-8?B?NWw0MERpR1FEQTk0UlMwRXo1VTBCMVoxNXJPWjRJL0JVVHFCMkJqa04vbTVk?=
 =?utf-8?Q?71y28mzh6/uGd4tTyu6CySZB+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26A8EB4F9212AC4782BA71384C5AD02A@eurprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: radware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB3807.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf5501e-c5e2-42c0-23f4-08dc0405fa2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2023 22:24:49.8222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6ae4e000-b5d0-4f48-a766-402d46119b76
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6cLJ9GdqIH9KPrm8OZIR/qX8rfvXk57yOdWgehjzInbjnBZAHE1q1quat0XxTUPDD1JJU97XK9H0jm5pnEJgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6839

SGksDQoJSeKAmW0gZGVzaWduaW5nIGEgUE9DIHRvIHBvcnQgYSBsYXJnZSBhcHBsaWNhdGlvbiBm
cm9tIERQREsgdG8gWERQLiBTd2l0Y2hpbmcgaW5ncmVzc2luZyBwYWNrZXRzIGJldHdlZW4gZGlm
ZmVyZW50IHByb2Nlc3NlcyBpcyBwYXJ0IG9mIHRoZSBjb3JlIGNvbmNlcHQgb2YgdGhlIFBPQy4g
SSBzYXcgYSBxdWVzdGlvbiBpbiB0aGUgUSZBIG9mIEFGX1hEUCBidXQgdGhlIHF1ZXN0aW9uIGFu
ZCBhbnN3ZXIgc2VlbSBhIGJpdCBtaXNtYXRjaGVkLiBUaGUgcXVlc3Rpb24gaXMgYWJvdXQgc3dp
dGNoaW5nIHVtZW1zIGluIGNvcHkgbW9kZSBhbmQgdGhlIGFuc3dlciBpcyBnZW5lcmljIGFib3V0
IHN3aXRjaGluZyBxdWV1ZXMuDQoNClE6IENhbiBJIHVzZSB0aGUgWFNLTUFQIHRvIGltcGxlbWVu
dCBhIHN3aXRjaCBiZXR3ZWVuIGRpZmZlcmVudCB1bWVtcyBpbiBjb3B5IG1vZGU/DQpBOiBUaGUg
c2hvcnQgYW5zd2VyIGlzIG5vLCB0aGF0IGlzIG5vdCBzdXBwb3J0ZWQgYXQgdGhlIG1vbWVudC4g
VGhlIFhTS01BUCBjYW4gb25seSBiZSB1c2VkIHRvIHN3aXRjaCB0cmFmZmljIGNvbWluZyBpbiBv
biBxdWV1ZSBpZCBYIHRvIHNvY2tldHMgYm91bmQgdG8gdGhlIHNhbWUgcXVldWUgaWQgWC4gVGhl
IFhTS01BUCBjYW4gY29udGFpbiBzb2NrZXRzIGJvdW5kIHRvIGRpZmZlcmVudCBxdWV1ZSBpZHMs
IGZvciBleGFtcGxlIFggYW5kIFksIGJ1dCBvbmx5IHRyYWZmaWMgZ29taW5nIGluIGZyb20gcXVl
dWUgaWQgWSBjYW4gYmUgZGlyZWN0ZWQgdG8gc29ja2V0cyBib3VuZCB0byB0aGUgc2FtZSBxdWV1
ZSBpZCBZLiBJbiB6ZXJvLWNvcHkgbW9kZSwgeW91IHNob3VsZCB1c2UgdGhlIHN3aXRjaCwgb3Ig
b3RoZXIgZGlzdHJpYnV0aW9uIG1lY2hhbmlzbSwgaW4geW91ciBOSUMgdG8gZGlyZWN0IHRyYWZm
aWMgdG8gdGhlIGNvcnJlY3QgcXVldWUgaWQgYW5kIHNvY2tldC4NCg0KCU15IGZvbGxvdyB1cCBx
dWVzdGlvbiBpcyB3aGV0aGVyIHRoaXMgYXBwbGllcyBpZiBJIHVzZSBhIHNoYXJlZCB1bWVtIHRv
IGFsbCBxdWV1ZXMgYW5kIGRldmljZXMuIE9idmlvdXNseSwgaXQgZG9lcyBub3QgYXBwbHkgaW4g
dXNlciBtb2RlLCBhcyBpdOKAmXMgcG9zc2libGUgdG8gc2VuZCB0aGUgcGFja2V0cyB0byBhbnkg
ZGV2aWNlIGFuZCBxdWV1ZSBzaGFyaW5nIHRoZSB1bWVtLiBJcyBpdCBpbXBvc3NpYmxlIHRvIHNl
bmQgcGFja2V0cyB0byBkaWZmZXJlbnQgcXVldWVzIGV2ZW4gaWYgdGhleSBzaGFyZSB1bWVtIGlu
IHRoZSBYRFAgcHJvZ3JhbSB1c2luZyB0aGUgWFNLTUFQPyBJcyB0aGlzIGEgaGFyZCBsaW1pdCBv
ciBhIHNhZmV0eSBtZWFzdXJlLCB0aGF0IG1heSBiZSBsaWZ0ZWQgdXNpbmcgc29tZSBrZXJuZWwg
cGF0Y2g/IEZvciB0aGUgUE9DLCB0aGUgbGltaXRhdGlvbiBtYXkgZmFpbCB0aGUgd2hvbGUgcG9y
dC4gSSd2ZSB0cmllZCB0byBzd2l0Y2ggcGFja2V0cyBiZXR3ZWVuIHF1ZXVlcyBpbiBhIHNpbXBs
ZSBzaW5nbGUgcHJvY2VzcyBhcHBsaWNhdGlvbiBpbiBza2IgbW9kZSB3aXRoIGEgc2hhcmVkIHVt
ZW0gYW5kIGluZGVlZCBpdCBzZWVtcyB0aGUgcGFja2V0cyBkaWQgbm90IHJlYWNoIHRoZWlyIGRl
c3RpbmF0aW9uLg0KDQoJVGhhbmtzLA0KCQlZdXZhbC4=

