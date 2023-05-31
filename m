Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F442718123
	for <lists+xdp-newbies@lfdr.de>; Wed, 31 May 2023 15:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236327AbjEaNLJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 31 May 2023 09:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236086AbjEaNLH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 31 May 2023 09:11:07 -0400
X-Greylist: delayed 94523 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 31 May 2023 06:10:11 PDT
Received: from us-smtp-delivery-119.mimecast.com (us-smtp-delivery-119.mimecast.com [170.10.133.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D1419F
        for <xdp-newbies@vger.kernel.org>; Wed, 31 May 2023 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=progress.com;
        s=mimecast2021; t=1685538610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=GT5i70JngofmRhQemGCMy+wHnXb+d5TqUH/GIZGwTfQ=;
        b=PYv7YjytgHq9rVy9VuYcI1AmWiarRndWpRQTbol++QIB8qMy9p8evyrqoEMm0AA141O8a4
        mLDjx8C/Z8zbciAojAckWJ50iJL6WeQV4+lD3htg3JeEEVTnm6J+neBJEC0nDBLntHxcEN
        /Qna+bnqezqPr0Tm945zlSNtAjETi8gFCa+XPQ1i5hegYTgKU/z8FsEDwqQCCcXWVHhktC
        VKiyp+fYTijcVPqd19J4nJCbhP/bWUK7b96kdDQJSQYv1iwVgfXs9g+idg6eDvNvAB8ww7
        tmgL2cIlY1HK0B70uWhdNIj6YXsykdJiYcBQmzc+QGmA/Z7Ly4lpfTVQ5DXyRw==
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-z2aeSBe0Oc2BKe0C601uNw-1; Wed, 31 May 2023 09:10:09 -0400
X-MC-Unique: z2aeSBe0Oc2BKe0C601uNw-1
Received: from SA1PR13MB4925.namprd13.prod.outlook.com (2603:10b6:806:1a7::8)
 by SA1PR13MB4992.namprd13.prod.outlook.com (2603:10b6:806:186::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 13:10:07 +0000
Received: from SA1PR13MB4925.namprd13.prod.outlook.com
 ([fe80::fe02:e5ed:f217:94c3]) by SA1PR13MB4925.namprd13.prod.outlook.com
 ([fe80::fe02:e5ed:f217:94c3%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 13:10:07 +0000
From:   Tomas Jansky <Tomas.Jansky@progress.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Processing Jumbo Packets via AF_XDP Sockets
Thread-Topic: Processing Jumbo Packets via AF_XDP Sockets
Thread-Index: AQHZk8E4COvLXQdOK0q6QxNZCnDzQw==
Date:   Wed, 31 May 2023 13:10:07 +0000
Message-ID: <SA1PR13MB4925B288F75F21F3709C8049E6489@SA1PR13MB4925.namprd13.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR13MB4925:EE_|SA1PR13MB4992:EE_
x-ms-office365-filtering-correlation-id: 0337841c-f2a7-4fd7-47c3-08db61d85b53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: SUXF/+jPgRlMFUs1SCMwRC2qn+hKuZi4mJ9ijG05GuAkHQNEJtwlJL7jKA3hJBj2AB1SB2Lu9whUJvektUP/jk4WFfAAEp5uQnCk8QY82eGDnXhHrP7x010kMutGw4ecZEPg9zcOYzX8QZcCXeYak+OTxRvs6vYj73xDZC2fk4K9DMmFyqJ/EMG8FkKK+7l4E8xaS+NVp+Ebk72WLhBup+vaifzQPC0mzGRhzEpQBMxSOKYgprBZ2Oy8SBwaJ/8p/T0HzQ5iho5W0aHRJaxRd05dbCCxkYcfnYWIT/oMpQ6MD9pRuaYVs8TOA1051XEgi/9pCQTDSi5Zmp/r/kV732MRVasm2jq/UbgdA5lMXGXURPlYTlLVvhzu0K8b5cFCurvtL2aWb9ukU9h6qBnvYjkCmXSPKid0xjPN+nmAC/s3g1JkDoJCkNipepuh54PZyvmv60wQmwncX3viqtJSclBn5WM7m19eErQEp6+0yJI1gzo+iOvCxbP6cDqa2dmgBrrex5Y8brF6a29zoLsnulmAXnnGsffxn2ueBb8dfrxyHc0U/4HqvF2/hm0uWW7NPrsq/aeuOil9dBCfq2k+MZd3PQglymA4dk33iVVY8DZ41HOHL9tJzec5T4E2mglZWk2y8bUFtvQ4E/gIJ/bfQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR13MB4925.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199021)(316002)(66946007)(76116006)(91956017)(64756008)(71200400001)(6916009)(66556008)(478600001)(66446008)(66476007)(33656002)(86362001)(38070700005)(6506007)(26005)(9686003)(186003)(41300700001)(4744005)(2906002)(8676002)(8936002)(52536014)(5660300002)(7696005)(55016003)(122000001)(38100700002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?asTJdjH0NLrGK+CyyK7T92CTPtd5lPaHbSKYj9Gpwv7WLXvbxp1sD8JZ5E?=
 =?iso-8859-1?Q?wZAU2uxgM3w5YpWwJvVgR3K2FP4fCVr4l7jdZOMID8zugn2nerjo+rr8m8?=
 =?iso-8859-1?Q?PgNSL2fNTdfN/wra5dY3w1H/yGQB/6mNg5gYMpDrmyVqLiInaoNHDMfCfu?=
 =?iso-8859-1?Q?xs30pfLt1i7anNX6gaXwAlCJU23v1Kz2a98HD44VqZWN8QFKNeVppcy4Wl?=
 =?iso-8859-1?Q?kosbpnkqkUdT2sGy3939nFLV1Q2F4mS2llPbKoiYB2BBhgDYXHDfcm3IJy?=
 =?iso-8859-1?Q?4qVhFKHJfy77ljXg1YPH0rapQosVgveY8tOEZ4LIy3EjCZJlOZ/DRDhwNY?=
 =?iso-8859-1?Q?C6Jaa9QWcgrt3ddHoGqN2S5RPhfsJa6OpHgKFwzlYFVmYTpuVZNaqfyxEH?=
 =?iso-8859-1?Q?RLxqfHrXTknU2khGlyKlwqZs+6ZMdyp11NsK78p/BNa4LUAuJfZSNbNCIb?=
 =?iso-8859-1?Q?yHQJZTCXNxk1bBO8/nKWY1Arocx/FBzHDPxzlv1IZ9KakzdBuGohGFmEN2?=
 =?iso-8859-1?Q?Kw1Dk/L6PoTBWr3ReFF63ApoGisYWS4gXjQrDuO1qhvJ93wvjwPNCRPQNb?=
 =?iso-8859-1?Q?vABGJz19foSidujSBU6GDSv0JG9xghBf7yj0uJ/+HM5oZRPykUSg0pTDLi?=
 =?iso-8859-1?Q?/Uap/jRFj0G805J0DpowN5l6jCyh14rH0xUQgOaHM28Z7lkWuu1fHCHMq+?=
 =?iso-8859-1?Q?Qtrd2oLS9axehgESYG5Sem32nrxdPbXHzTYIzZOjx6ni6y3eweCqAcoA4n?=
 =?iso-8859-1?Q?zX7bapJQERC3loE59HtD0QUG+t8XBjfHuu3uJOjDfBF3GLNP4PRIU04fpY?=
 =?iso-8859-1?Q?+StSqVjMi7Pi84H8RJz1aW3j0Mu2a7EuUhGQ7V6fRXP/DNabAYqh/miALa?=
 =?iso-8859-1?Q?8W9KEWPNkqN9AcWMcasylO2pSjypDwYaeaygSC02MQwBCSh0lgcX5GrYA7?=
 =?iso-8859-1?Q?+Qkgh2PbW0VerMB0LJLgFvPBZTKsGx3D8QfO855wsG7wi5xbSJwpn0PNdb?=
 =?iso-8859-1?Q?kEgv+mRcPgq7KP01wRjwtRYnjgnvQNZ9XUYvPwkzfI/lYYjaORZIe33c+X?=
 =?iso-8859-1?Q?Zzzjmy/cM/vtZeaKG74ioCzU2Rex2ZWLy41meAfTW5fiQtGT/zTcmheIWS?=
 =?iso-8859-1?Q?ioH+yZR73wqWEIGV/PUJfhifCNMPZRqhYB8C3tKVNnARu0Bfs94A0RkPTE?=
 =?iso-8859-1?Q?LYvfYSmjwdpe5AH06KjF2oZkxId2TV6kA+DH3Xfr+FsAozXrMmOekHxa9v?=
 =?iso-8859-1?Q?xw6YdlAhNBHK9tvZyNviff7B6XSqCNgMBVTYL3jJXgnWOu1DBGcJi8Grm0?=
 =?iso-8859-1?Q?T/UzK9dB4ZGm7QCnAUfektuc8ZNQzQEcnuA2SbDRWlw1PgYWWZnjHM5bPa?=
 =?iso-8859-1?Q?D+ARaAFfTp+Pl97XWDYJV3RcHAiD7GIVRI3NFk2yduKv3ZhRCRvjH7LKfy?=
 =?iso-8859-1?Q?eQLDxMPOXZjwD0jKK8jluqAwsHlNwZZZ0rZn3qw6WjWc1+Ojj8bq/s3584?=
 =?iso-8859-1?Q?bVhf0di4RizHfGA5RMLuOF6xdh/3vtiGNNkddnb9OmOV8m6bxCPmzxphus?=
 =?iso-8859-1?Q?b7Ect23vj1D4BJaWQ8B59ILL/wmuaTk9VHHPOuVZnigEqNWB1uaf10BTWT?=
 =?iso-8859-1?Q?uAHUwjRDJsS0I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: progress.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR13MB4925.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0337841c-f2a7-4fd7-47c3-08db61d85b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 13:10:07.5540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: db266a67-cbe0-4d26-ae1a-d0581fe03535
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: faynD69S43WZebBTt0s8EzqPwiQoIpbBSnjNVZ19Fxcqeutqu8TSE8Xe0k7TduvZm+IZU+ZoWbv1UtP/pavp5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB4992
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: progress.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,=0A=0AI came across a year-old thread about multipacket buffer support i=
n AF_XDP (https://www.spinics.net/lists/xdp-newbies/msg02212.html).=0A=0AMy=
 company is very interested in the possibility of processing jumbo packets =
via AF_XDP socket with Intel X710 and Mellanox ConnectX-5 cards, so I wante=
d to ask about the current status of multipacket buffer support in AF_XDP s=
ockets and also the possibility of using huge pages for UMEM with unaligned=
 chunk flag to achieve the same goal.=0A=0ACould we expect any of these fea=
tures to be supported in the nearby future? Let's say a year from now.=0A=
=0AThanks for any information,=0ATomas=0A

