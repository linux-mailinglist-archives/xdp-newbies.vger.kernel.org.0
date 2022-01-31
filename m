Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8644D4A49C8
	for <lists+xdp-newbies@lfdr.de>; Mon, 31 Jan 2022 16:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245296AbiAaPBn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 31 Jan 2022 10:01:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:13333 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244954AbiAaPBm (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 31 Jan 2022 10:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643641302; x=1675177302;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=21uP+n/i1t2R1dxXki/yFeq3sQRzOZJbA5nxXER1QsU=;
  b=VIiWH3j1n0KfoWpRl6J9rxdWtGLkbROU/aX54w3lQSqoMkwrnXR6twZA
   iekFniDPFT/H7NMLPKya4wneKxdxIHWkkVhnsQZTCx3I2MyAGLmnJC0kI
   Oq1l3FDT8QuU8As43SkcdhEJC7VwE9S2hDH2Tvkf8/EEhjvihsCpfDpKw
   gVePUDouuTEUmCzZLrB1J7XYZKPYp9t+6Ddz2BNmVXcyLZJGjk1T4TkrF
   QXODIGTR0ozcdsZ8fMpyV9VCUFbj7sqNGz3AuIn4cN37hYecRQc6bE13J
   zIdaIKT4c/vPIxN5k9pwxvSuVK1K7ronesn4uKVaW8guLRg7klFgHwqqu
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="228138188"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="228138188"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="598857390"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2022 07:01:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 31 Jan 2022 07:01:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 31 Jan 2022 07:01:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 31 Jan 2022 07:01:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 31 Jan 2022 07:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuKPM9DCaIeRQYNc0ads+2u8HD2ztp+6HXq7rqhU/ZjS3upmiYSt3lnvzW+VNsumplSlmt6WhrF4zAzVvcf0X6nvdQV4jhOoXCfMqE/q5odn/y9dQHywZEA/OTMVL55mJ5xq6e83/gNu2kccBNVsitmPOab8KI0TWUj/aMLX8MnOL79BUMj4GJ7RyxnA2ag3oxewmsn0P+/9RwyGs5s5/+vRykUfOXDT8aUdX8op+HoWQdyYl2kM6eo0ZRChlmRaeYM4mK2aLHkRPOtjkH7cO1JBg91GMk1gsLV1Yciw8XB+QsE5L4q2YqpV8BTBiA7ySEBS5rruXDMZ6t3IRKvN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21uP+n/i1t2R1dxXki/yFeq3sQRzOZJbA5nxXER1QsU=;
 b=K615KeRUANkAjrYgca3nJqSo20u/T8yI+etk5pxgPVArHCwlWnfFEXdE8FUBS0qEHxkH8Yglj7R0pIxhIAaC8U865+wvwE/kcUgsF2LgNIiC02UneXs5zCR/5X3vkohgV1x7MmpS4vsiwwKCxbWTWiDiCIq85y6LEB6UU8P/G/INqUjXZEZukWgw72PnHjKeYMNucneRsfzesmHAq6F5FLQjK2hR7ZXZhTtBJE78QWIUztW0VBcXEmxK99PRuuh0EBpgTsdFWP1loQNO9L4OzF/lPCKM05Y4pU9/nzhp+tnpZBgtkCwRFcXQD17yBsJ+8Mj0Aa59bmgY+MRAPogDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by BY5PR11MB4452.namprd11.prod.outlook.com (2603:10b6:a03:1bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 15:01:27 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::413:4dde:1e3b:fb0c]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::413:4dde:1e3b:fb0c%7]) with mapi id 15.20.4930.022; Mon, 31 Jan 2022
 15:01:27 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Haithem Jebali <h.jebali@acontis.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: RE: AF_XDP and kernel queue manger
Thread-Topic: AF_XDP and kernel queue manger
Thread-Index: AdgWeSyCUF6KWn6DSbatH8Q/MLjJJwAGkOQA
Date:   Mon, 31 Jan 2022 15:01:27 +0000
Message-ID: <MW3PR11MB46024129174D32A2ED9AEAE6F7259@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <296608b6-023e-445d-b082-7b358f760360@acontis.com>
In-Reply-To: <296608b6-023e-445d-b082-7b358f760360@acontis.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6373be7-ebdc-4856-b87e-08d9e4ca8eb4
x-ms-traffictypediagnostic: BY5PR11MB4452:EE_
x-microsoft-antispam-prvs: <BY5PR11MB44527C49E94DFB9D30F98E58F7259@BY5PR11MB4452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A1uQd/oqwRR0IwofXZTGiXCvxKscCxzzN5UYiV2f/MGmJD+KF6GloR1ZHKJMV+6GnJ1cLEiKohuzIbRs0Ooio+hPjFAvXdRNCXxQaS+8M7zyExUPncGVLlZLPBYvNHKaLrtyTYiMLseciNnavHNSF/hPyUIfegI7FloLxKHgKCZyX2khsfu1cr66lti3uuAVY38HZaNuIkiak7HGLTPgaPiJlSBNnpC2NNkDu+PvBEBxruN8EegZ1Zr3ZZqcBloKudeJTh59Ie4XKHZK+i0deAICpnabxA1l7rwl97K/uqeNlejrjxxx9YJQRbv1yuFlS2i+/1AQnBsL/E3HKAlYb8DRR4HYf3J8jiXm8H/+bJAsxke3ekLzjXY6+lS8Vdk+/zk6brxX58XpWRUsTGHt6Ci0l8/NNpKqQ3ccuNFP8K5XbceB6OjT07uXO82Io1lEvRR6VxQOLvRYX+tCSM9eMDqhUsEwTEgb5RLNkacc6bkBNZX3kU5MqLwEOp1BaEFPYgyk2MmWgWDFpaRg6epnLegr0h1X4Q/1NHeOT+n/VgjPgAbY3Rh0SHVm0jrBwiI+Fx+zY+fDUnffGBLH4F2AhMw9li9a5jauzBKVRPrg2SZC33IPt33XsVdahvLOrbQ//MzgqD/bEtRdBr7kejkp2Cwdfm3fnQgdRzdAEdI8u7YL5JgqGjTUY/2OEZUU+hP2xI9GVXnV0+/xmKm3w3ZPCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(122000001)(66476007)(38070700005)(66556008)(316002)(86362001)(64756008)(8676002)(66446008)(66946007)(8936002)(76116006)(110136005)(82960400001)(508600001)(71200400001)(9686003)(6506007)(26005)(52536014)(186003)(5660300002)(53546011)(55016003)(2906002)(33656002)(83380400001)(7696005)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tuvZjYWwff/+CHjimpXXtAS78CyKA67vO6bBuqMHHqYdJT0ZsceEHGiY+/?=
 =?iso-8859-1?Q?2KFGRW9L0WhEDuITgl+voteSDFqeZ0HU1K9dvNlKRw+dovwBPvXtilkwok?=
 =?iso-8859-1?Q?W5Eh7KSpz2CVl5ssG1e8x7Rh0cHn27vlinZtjc4siGaQJ5BG73c9H+6Xwu?=
 =?iso-8859-1?Q?JLtHkPMdsZIiVz0JuyAHO5XhycMxyFWj/Vs7hCxPcArOz5Mg4F3BCvDEQi?=
 =?iso-8859-1?Q?rv9DMUgKjL/w6pgpYULCHXNfYwyuw1zK9+Erd2Nw/AWq3aVkeJD6WM5fT8?=
 =?iso-8859-1?Q?Q4ghmfOH2K2Uy4ow/yg+kidSzSY3aiw1H+ZwzLW0gx+G/4YvJ0vj+6Vqzz?=
 =?iso-8859-1?Q?1GtmsN4BgpAU6HqCtvdQSJuoqaLd64tcn3obVoUj/pfMPgNjqpwKSK45t9?=
 =?iso-8859-1?Q?ltC0VLBoDoTE8JBbWUmejWFSM/Eg8mDhyk6d6Ily5Dnsdo4XjFKFPxLPHf?=
 =?iso-8859-1?Q?YX1Vz9ab+XZvs7ad68TbhI6bWs819ijm2bMIq2wrzcQB3mt6U9s53r5Q9r?=
 =?iso-8859-1?Q?qwM2kG43iwffVwIjrMAdpcfHpntH84CXyr65lyQsYjYIh4QSkJ+T5lPFIG?=
 =?iso-8859-1?Q?N2WCR8dbt3b9CAwfbu6wOGf1HVyv6reRwnNXkzZZL0T+s2IyXJeRuEbWSo?=
 =?iso-8859-1?Q?uZkAyKbwSF6soMBstP6oR/Zq7smiIykdjkN23jsi9i5sDj6Zir1v1s9n2i?=
 =?iso-8859-1?Q?FB4XnG3e+Ji1tNi2TGdmkdOI1t0tEzrr13/g9w0hcUrNkvLaQnhUwEGoXe?=
 =?iso-8859-1?Q?l0qIIvDCJPWt6r6z0HSCwjM0gcp9QQG3GvXPbLkaLyF1IeOYiQ4etcYTA2?=
 =?iso-8859-1?Q?xARC69WR2IWojMKSTROxAO5IkeKDFME30PJdAYFw6tn2y+PfV8Bm4QrLXv?=
 =?iso-8859-1?Q?SiPERN7Q8Lsfd4jNe7nWriCTWUjth6spKKFzedf1dPz0Gz6MhfISUC+S+Z?=
 =?iso-8859-1?Q?Eyhnq48JoEu0FMxozTJxsKXru+9QZFXhdebs1vim3AWW/RQdIq88JGZQCX?=
 =?iso-8859-1?Q?pr61nt9VpYWBnPV1WJIiO1Ae4fdvJr34vKy7cHSCcVQovbl6RNqdswdQor?=
 =?iso-8859-1?Q?4r5aHWwSHMlpA95+n434DV4ToBWsxN1HDKB+VJn5mXB3USfqpTC8vCOS4y?=
 =?iso-8859-1?Q?GEMWlyHgYQ6sO3fj8bG5dxok05OjbK/W4otrSPGcQ3pjtZFxHuvoXxEZDj?=
 =?iso-8859-1?Q?JUXFGh1Ayf/iahNFpgIzx6HuNMZKqV+nXIzSM2ABr7xY6xS5zGs4XWVZAG?=
 =?iso-8859-1?Q?6iZi86LQ4bx2Zv4wBjpZ8fAOjHURJyC5MkRecSE/MyxyAc8t9nWKo+mSra?=
 =?iso-8859-1?Q?jicbtO0ScNZgrpwP712HYNeewz+lDDxumpOP2Xx7fmVnY519beEcQQow1u?=
 =?iso-8859-1?Q?odPQ3vMQ/NvF8kdchYFd3HoWL1YGbsK0t8afylQ92LsHM/CicDProeaPXm?=
 =?iso-8859-1?Q?ZJdSTJaNdEaEkQTVl8p7BSRkvq+ABUDMJULHQ404kXjOIaJ+KLanrGpAF+?=
 =?iso-8859-1?Q?YsO/bT/Nw8s2vBrRlIvJ0IgVO4Ld3wwbBxlX2x4Ph9PEO7qJskAl3lcccl?=
 =?iso-8859-1?Q?1LLe/rRxLcs2cDoB7SlX0lhUQIyGdVGkPyQVkDHOP32C8hj6wO59U62Mfp?=
 =?iso-8859-1?Q?RgQotCBBhuzSgXSPV6lJ7rBihKzd76TVkVdWhlabtUeqocFB5P1JampLaU?=
 =?iso-8859-1?Q?ZA4SZg1uLNj1w9GUQwkleDvrCqM8vMq8QqEi9Oc0dl3SPVW13GThMgg/X6?=
 =?iso-8859-1?Q?RDKg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6373be7-ebdc-4856-b87e-08d9e4ca8eb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 15:01:27.7589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFGYHJ35DNb/cTcZYHIl2slskNAt/ZNDk2FVFkw2HADlC76nCF93pclKCDVNW3WO+E2BOzgby0TJAkYpZamKDrwfccnB0qF3GIlLtPt1c30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4452
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


> From: Haithem Jebali <h.jebali@acontis.com>=20
> Sent: Monday, January 31, 2022 9:07 AM
> To: xdp-newbies@vger.kernel.org
> Cc: Karlsson, Magnus <magnus.karlsson@intel.com>
> Subject: AF_XDP and kernel queue manger

> Hallo everyone,

> I am a software developer in Acontis, Germany and I am trying to use the =
AF_XDP socket to create a link-layer for an EtherCAT master.
> But I am currently running into the following problem: How can I use othe=
r queues to bind the socket to other than rx-0 and tx-0?

>When I call ethtool -L eth0 combined 1 for a NIC with multiple queues, the=
 linux kernel always =A0assign rx-0 and tx-0 to the device.
> Is there a way to assign rx-1 and tx-1(for example) to the NIC, because r=
x-0 and tx-0 is used by other adapters.
> When all adapters are using the same queues tx-0 and tx-0 , this affects =
the performance of the master and I can see a frame loss
> if the other adapters ( the ones not using the socket) are stressed and s=
trained.

Hi Jebali,

I do not fully understand this, but what you would like to do is to use que=
ue id 1 of a netdev and bind and AF_XDP socket to that? What is hindering y=
ou from issuing "ethtool -L eth0 combined 2" in that case and just bind to =
queue id 1? Why do you have to limit the number of queues to 1?

> To solve this issue I was trying to find a way to assign rx-1 and tx-1 to=
 the NIC I am using for the master, but I was not successful.
> I then found a document " Making Networking Queues a First Class Citizen =
in the Kernel" about a kernel queue manager, which may solve this issue.=20
> Is there any updates on this project? Is it still under development?

This is not under development and it is unlikely that it will be developed =
by me at least, due to changed priorities. The good news is that you can sl=
ice a netdev into smaller pieces with the rather new subfunction support, b=
ut it requires support in the driver which you might not have.

/Magnus

Best Regards
Haithem jebali

