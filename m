Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A83D1EE55A
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jun 2020 15:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgFDNav convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 4 Jun 2020 09:30:51 -0400
Received: from mail-oln040092071014.outbound.protection.outlook.com ([40.92.71.14]:30862
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728547AbgFDNav (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 4 Jun 2020 09:30:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj2le8VVjSl6g/iTHIGBctY+NIbsI44ram68pm1NkL3ebfkfk/7OVuwnQli9ntAHRVjH5fvchQyMN4NVK1yXl54sNLDUjeOmZ+cZfqJa4IF3aoX7DO9xRZJmQEYhcRgOXphF4acP6ZaIGtis1G68MIogN4AaworVDG1lnw9oup0bmxRmM08rQQ3qYzpeNFreRyTqCz5WQvZnxVomhu8E2XeCPa9GMacdy65ul2yjdvs8Wl74ld12UaI53psH8W1ImPhbgKB2RUexpMaTU+CGZ8B2sCn8BUYcfZoz/Cu0p45hqrN9oNH3EI4v1e++AEZIBAayItoAT3NDuEVFAIseMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8icrB5TcyRL0vXNn2eCjFSF0AO+tcfM1nYkL2cJ8/Z4=;
 b=MYdLrtjnzk2FkfHF83bvMkDwTKMshMRMcjvPOoss6GuV2eDAU7elwAkws5AnpKqm0wWFUunGjB85Mc/ZR0XsS7DQCz9DW7KfG+fthGlH2M8lnH892vZnxtIjiVl9fDfr/pW61uM+R5T6516B//6PNnffQD3T3DEnOkyvxM7e1YNwcgWgFfnWoAYUpGjmdymSv6/0JbzbksN2xlsiMm0uuBRnL2/dOl4odt5V4rTymq/Bwz/CLj3WMG/2wmEViUnptTSY6s8UVpriWmWJXBh1F3bMuUxkKK1gNTjz5vCD4fUyYz0XewFeHbDLUoIt7yoH/vhkeqz5QM7/FJ3DNc3Atg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e0a::4a) by
 DB5EUR03HT009.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e0a::132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 13:30:48 +0000
Received: from DB7PR08MB3130.eurprd08.prod.outlook.com
 (2a01:111:e400:7e0a::43) by DB5EUR03FT012.mail.protection.outlook.com
 (2a01:111:e400:7e0a::161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 13:30:48 +0000
Received: from DB7PR08MB3130.eurprd08.prod.outlook.com
 ([fe80::1096:7af0:893c:6f59]) by DB7PR08MB3130.eurprd08.prod.outlook.com
 ([fe80::1096:7af0:893c:6f59%4]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 13:30:48 +0000
From:   Federico Parola <fede.parola@hotmail.it>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Lightweight packet timestamping
Thread-Topic: Lightweight packet timestamping
Thread-Index: AQHWOnHQlLnyAZiVv0mslffaZPxs+qjIcifQgAABDww=
Date:   Thu, 4 Jun 2020 13:30:48 +0000
Message-ID: <DB7PR08MB3130BA2C0F90E0819577C5289E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
References: <DB7PR08MB3130BDD01387627E7FAD775F9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>,<DB7PR08MB3130C02AB04133E07146F40D9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
In-Reply-To: <DB7PR08MB3130C02AB04133E07146F40D9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:F7241F31D8C5152E63AE7DD0E314A258A40B75E517A6831ECDA66CDCDF675044;UpperCasedChecksum:9BF7FDFA76D22FB67FA515A780169F852FDB1752747171F0B3C74FF356D2D69E;SizeAsReceived:7014;Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [IjkTyoq6npXlqsXvhphd310wX6AJN7E6]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: da9b1129-0059-4483-6517-08d8088b7e48
x-ms-traffictypediagnostic: DB5EUR03HT009:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8CYTbWuncUl6np3y9M5d0mm96lCi+abjWnGvQ6wBvLIrWxD+83jh804BxZSUi7IHcXXytxn4C7esow+A34BZwvG9RT30+bcaM1GssCPfZCzFLcmGo6sIS54GIHxZ7yIEQwtv97pMAlRXALEH0JwqNMzsKhsq09jSKs1D1MGKN+iQQWu85N4oZPWPiuRCwjzOGGTuIFubXx9u2coNAQ89tQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3130.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
x-ms-exchange-antispam-messagedata: 7NoAVmupdjx4Y+LV00mcJ5wJHyrEPCoD/yBLaUfg57/e2dKTKEkVFWcxVgTdseHD+/X/GyGvH3M2gu73FpzqWPcHhMKsn+Q+gfCYcvqMeqOuS1253XDq+jIpeMPP3tGEuLfyI9fsqKCprk3k0V1axw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: da9b1129-0059-4483-6517-08d8088b7e48
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 13:30:48.4085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT009
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everybody,
I'm implementing a token bucket algorithm to apply rate limit to traffic and I need the timestamp of packets to update the bucket. To get this information I'm using the bpf_ktime_get_ns() helper but I've discovered it has a non negligible impact on performance. I've seen there is work in progress to make hardware timestamps available to XDP programs, but I don't know if this feature is already available. Is there a faster way to retrieve this information?
Thanks for your attention.

Federico Parola
