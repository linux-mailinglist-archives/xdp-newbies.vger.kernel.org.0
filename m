Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBC21E1BA6
	for <lists+xdp-newbies@lfdr.de>; Tue, 26 May 2020 09:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbgEZHAg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 26 May 2020 03:00:36 -0400
Received: from mail-db8eur05on2068.outbound.protection.outlook.com ([40.107.20.68]:30049
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731341AbgEZHAd (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 26 May 2020 03:00:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD6MqHcFm5jUySvTlz+4RgYZmP1NtwRVoTDQqxObsLuVklAPAQQG2988D9dE0mMOWDOg8SBnLzhO9ywZY1W45NhQhj9DuT02JKifnI+ObOzJG4L74DoLIWSZl6XF8FuM7s1gyefa4kOR0qA6lUhYf7Sb82xHosw/uNtQ17DJpM8ecfD36nxLdIYmchsPuZgz8FvoZb9jbq4iWVzLNyvJgTcF56oXyIGJrIyo2IuNVlgPGp7YEatmg4yLEAdgtgqzYszopF95Q685bwUDwQgKIbmPv5aIltAZCifs4iPqT1vbFXtTCuyAp9VqBiZXxnxkFX5zkjke/BhqbgIPAWvLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGbk3p3BDgiYCRwTyrqy/oYHEPOjsRGpe3kRS4bTzxg=;
 b=R/TzK27+CzNo6YXe7WNdNw6xlEsifob/T/uoZda3TDIatFn1UzQVoUIc1PtYt9a5ukyvWqXfUBiGCiY2qAu7YrJrKuAsDT6Nseos2o0izhZ2vkrKBOoORmbUdXt3O48AD5HriqYlU6izLBbNtDLzkBKs/NcyLJhtvmsei/BguiBtMTsdB6KKyHTdhjhOEAuHeBNO7jMHLcrwB7qSG0EgPAPRiE41/+c5nXpORz1wQ/gavW70eX5LyrF6OO0BgoOZ1abQUtkIcfTphkDBnNeoLs8l0b/phe3ikeJQUb9+ZRcGccYN7arK+Xh/9Ki/tWW/tK62INoUnxKgxBM/qY3kMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fer.hr; dmarc=pass action=none header.from=fer.hr; dkim=pass
 header.d=fer.hr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ferhr.onmicrosoft.com;
 s=selector2-ferhr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGbk3p3BDgiYCRwTyrqy/oYHEPOjsRGpe3kRS4bTzxg=;
 b=l2JrRd/8EAHLoG6FFSubImc/zN2iqV2k+6HA9WGfeQvmmnK2Knvuj23cOOzTLT/SioCs3LYf4Byo6hcxjVR5KtYamo5UbS0Gck3rZyIImJKwt+rFnu18RF6IuN1Pb36Etkc/vbve+ZkW7mafJcN25niIF6K6krWT5wz1VKqzYpg=
Received: from AM0PR08MB3345.eurprd08.prod.outlook.com (2603:10a6:208:5c::30)
 by AM0PR08MB2945.eurprd08.prod.outlook.com (2603:10a6:208:63::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 07:00:30 +0000
Received: from AM0PR08MB3345.eurprd08.prod.outlook.com
 ([fe80::e85c:2e73:cb2:5f4]) by AM0PR08MB3345.eurprd08.prod.outlook.com
 ([fe80::e85c:2e73:cb2:5f4%3]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 07:00:30 +0000
From:   Denis Salopek <Denis.Salopek@fer.hr>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: XDP_REDIRECT forwarding speed
Thread-Topic: XDP_REDIRECT forwarding speed
Thread-Index: AQHWMytXvoozc+R8o0SstslgMG/5uA==
Date:   Tue, 26 May 2020 07:00:30 +0000
Message-ID: <AM0PR08MB3345DF6A3FABBCF262B39E968BB00@AM0PR08MB3345.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=fer.hr;
x-originating-ip: [93.138.136.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc997399-92c0-48fe-c9cf-08d801427a9c
x-ms-traffictypediagnostic: AM0PR08MB2945:
x-microsoft-antispam-prvs: <AM0PR08MB2945692C0A700F66DAC8145B8BB00@AM0PR08MB2945.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wN9isiU0seUmSiND6saUefoxwPY4pL36eJ6zR+oBfLl+kk5qMkWsmhJKa4F6R0nQT45zTGvN83N6Awbne0g7cBdHbA47mgo1cLE3SmLd3xWE6Yaht940n4Pu6VXOeuyy58d3a84VMEWgh44OvrE+ru8NStpc2u578iA5GYkkhysUv6XVyLj1MohGkjvDAHneuJjVWzNGgsXJ9Pai5lM4Q6LgFVyISumjU1kiPDNn0UX2Ep8ixIqsQZxaGzMykO5Dl/+aaEkqtSit5O3aFhmfEsV6Yah0s3xXu0zpBtw3D43fo9skvMIPOB5ZYiKiMMShnAmBChbhyC96OzG4GdgWw/HfKkTfvGhWzDKQMSzC6/FxvGQmPMEeQwOTknunZMBF3xQdAaJCSszRNNvX6p0FeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3345.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(39850400004)(136003)(346002)(396003)(26005)(316002)(6506007)(786003)(186003)(9686003)(86362001)(66946007)(66446008)(64756008)(66476007)(8676002)(8936002)(71200400001)(76116006)(66556008)(4744005)(7696005)(55016002)(5660300002)(966005)(7116003)(6916009)(33656002)(91956017)(2906002)(478600001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Eer45z+sTZlSyHe1g0/fFdxP8Zry3I0ye3ELN5CTJ1qdDZRFuqaqrVlger5qyufQKp8Hta2ljysGLDioqPSDWzrrgkJpcLjq3FHBSAuNDkAa70Mdi1ApcYL86W456fT0BK9xQhJBSKncYtihnV5fG9pQtO5OXFaj31I1Ik6nyd3ff64JlHVeA0l19M3dIYdKGD+2uPmAEpv+iyJ0L2TeiLLlkR6vzi6jx7tVa716w7p1f0FHDWtuFZtZwBZjCt3WP8Mye71Lspoa2/P1mYKB7lLoQEBhSIARdG8WkxfQ4E5JyRlf0qxh5spv226fMMGvET7IIufteOiCYmBm/nH2GPqW1RYfKpZpiDbASu+FU1Lt7ibHgUxQttFeza4Scflcy8vHcOZlY/RSZMbzklKrgq+KXJRzmU79F/1UGk6dlIea6xcPwd5kaVsY/RYFCPxXVlLMjDthba0VbwN/U+hihT8MhtgvBXV7marSjtilte6kjtTcJCfcK4szkFVeSidG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fer.hr
X-MS-Exchange-CrossTenant-Network-Message-Id: cc997399-92c0-48fe-c9cf-08d801427a9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 07:00:30.8070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca71eddc-cc7b-4e5b-95bd-55b658e696be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmUl7mbFSQUshxtpZnSY7OcvjkeehNgC28cF+9FvFrEcKCy4fDG055zzxkHaR1k2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2945
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi!=0A=
=0A=
I want to make sure I did everything right to make my XDP program=0A=
(simple forwarding with bpf_redirect_map) as fast as possible. Is following=
=0A=
advices and gotchas from this: =0A=
https://www.mail-archive.com/netdev@vger.kernel.org/msg184139.html enough=
=0A=
or are there some additional/newer recommendations? I managed to get near=
=0A=
line-rate on my Intel X520s (on Ryzen 3700X and one queue/CPU), but not=0A=
quite 14.88 Mpps so I was wondering is there something else to speed=0A=
things up even more.=0A=
=0A=
Also, are there any recommended settings/tweaks for bidirectional=0A=
forwarding? I suppose there would be a drop in performance compared to=0A=
single direction, but has anyone done any benchmarks?=0A=
=0A=
Regards,=0A=
Denis=
