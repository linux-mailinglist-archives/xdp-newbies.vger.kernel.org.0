Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0B93DF8FD
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Aug 2021 02:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhHDAng (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 3 Aug 2021 20:43:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:61433 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229922AbhHDAnf (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 3 Aug 2021 20:43:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="210705922"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="210705922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 17:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="670727538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 03 Aug 2021 17:43:23 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 3 Aug 2021 17:43:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 3 Aug 2021 17:43:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 3 Aug 2021 17:43:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 3 Aug 2021 17:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5Jlq7zEobwBps/10Kd3C59auopCLWZsmEJoifBQYtWw8tp/ZJsGiWUHbSxE4dgZXmXzhC41H1OBehj634vhGoZTqT158ALHUKHyUHqWE2XmFoB8sxC7OWT8H5Y2y5iYsg2cU4MkJK6lNKqS7smD0O96lRhfXZ75cMoekOlhyI2plE5B0DutXOrjaCYxyhURBEnWAVk/X3SJXW3s2le1RDqyCXw76uJPPYzqLtP6ljjsbdjNRJkBVi2gEhSJamfMdptcoqSXWLjQFY9zEcc5wJhk9czXW6Axx+K5cdWdI4oJTtI2RDKZKKsKzMSkCqMOtJFDpkc6a3eqV5jMR+qoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFKzq/1ohmdeEQ6P4TrTY759PvmBP6GauhEYVuew4tw=;
 b=Ow7tH3b1WK05gAye29WwCa0br8mKV/J2o5jo7sb8vsP6Hmabww7t6L3aga4XrWmEXGh82nuOz9JFsP9fnHxNexXgypCCvyycFSrLF1QF+inVnMCGAyf3p/64bdaSOGDEtgS9+0YJvHaij3eGx5V0qkv8CzLvuSYfVqZezY7Ojl1Zq1Zak6nIHAZ5ERr4lY7PMlrquYeVH+Xaq9RrsXTEh9UJoPndhAQCWPbbP6UVjf2H1mw5jOC3FVmVaF2p7T7nv8K3XONDfRUC/aMhtutMZM8Zl2pm4J47Xn8TcVloO0diaM4LbJpSMRLigHUZq/JtXEk5r5K30Pnq3FymzrwieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFKzq/1ohmdeEQ6P4TrTY759PvmBP6GauhEYVuew4tw=;
 b=TJw/cZHKTtLeFUfL8RrepqpgyFccFGAD9xW+/BpbxWtoV5KHTBkTKYf5SlzmmbvxnlmXuy4hG0Z3XXVmPM5EC/FMZpWKdm8ahkxsP0Jar2suV+IBYTGkrAdB1muMjxKNAEAkjCLuyzVRdsyv9oN3Ntrw9FF9jkUBBvojgNf204A=
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by MN2PR11MB4269.namprd11.prod.outlook.com (2603:10b6:208:190::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 00:43:21 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::4830:43ae:7d53:36d5]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::4830:43ae:7d53:36d5%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 00:43:21 +0000
From:   "Fingerhut, John Andy" <john.andy.fingerhut@intel.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Instructions to enable spin locks?
Thread-Topic: Instructions to enable spin locks?
Thread-Index: AdeIybIxm60qzT1lTzSHh2c6VFed3Q==
Date:   Wed, 4 Aug 2021 00:43:21 +0000
Message-ID: <MN2PR11MB41739E5557BB1CCA85CC703EA6F19@MN2PR11MB4173.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1765a814-7a41-4db6-202c-08d956e0dc1c
x-ms-traffictypediagnostic: MN2PR11MB4269:
x-microsoft-antispam-prvs: <MN2PR11MB4269F2CB10375162CBB584A1A6F19@MN2PR11MB4269.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZVtAxnEPIQEu9J0UW52UeJ+PaEwi0PY8Cv5ZBvtf8W6JtdR9dGN+EGNRpM75N6r8cWJOBzkvTOmFdQKvMFwIhjbNh73ega0+/jQ3h9wMdNosvIFOvW92gAUlN/ne2UnXtamvpvYFVfV2NmXgHuBH1uXnJWAT2HcCTWzm1T7PgWaGVUnXYCuOJwBw8O7nN9vJ6lxtn9XkMv6pF7kccYPuCam3vEaFHfsIb6DEmIGFRbToV1Hbwt0OcKFu+nfFA2KS/fvur99f3+9ADrSRnEGBHSGjdzKtIkqkhojt6yocu2ITOqay0yAGiHUXcN1gt6MR4EAQ0QpnX9OpZAIexUj9yBnuKCCbUlli+KO6aKCPcq/fHQvgPm8KSW6mHfuxjE9OY8kLZN+umVkEyQhhpGnHQCNZvDz2iilLNdqjZsNUjbTzP4DuMrEw8x7X2c9PA5KCHzxd2UYGyVWKnO9ERwcf6aLq9TFgM2/kEPDrzrij2qgtqy5G1fX1ROmQxSJvKa8tQdl+Qo2wKdv7rfKWW5gagelKTouzP0IUCjhUEDnX9GzuG1oi19bA+TP25uEf/utsKZ35Nb29O9uzIknAwLwps5YCXanX4VKC0itKgjMaQQl4Pg9K2WYKCpmH54Fug7kuVtxncRX/wBLc3WzyOnthNIiKwINrw4RucdN/zzipFkJph4eitIwkb/St3FqQCwXauXB8Q8o6aNvqePUbCnK6dg7VlgdQIBnq1xvWTT4vz5M5BdRhaiWo2MDKPLt6u2VY03FOmr922iaac6Gv45V5PFiDCIc3PW+fJpzxYorMIaI4sp+4V8CtSckg6efs2OkDLigAT85hGbk0zVOc7rx6iw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4173.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(66556008)(76116006)(9686003)(64756008)(66446008)(186003)(52536014)(83380400001)(26005)(7696005)(33656002)(6916009)(66946007)(478600001)(55016002)(38070700005)(316002)(8676002)(8936002)(6506007)(38100700002)(5660300002)(966005)(71200400001)(2906002)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jDRfZ2TqO2CloJYlHtWCf/lCg8ymYcoZ8q8fygMW8Qz/majcAVDD02xyclX+?=
 =?us-ascii?Q?9e9ioNYjYAWkFfQr7oDcR4Vfdr0wdJykvV0Lmdhw7R9lNw/hIZFiidSuWL/B?=
 =?us-ascii?Q?WZGk0vAy1/RkqRfuQ6vFJqIrVjPh6ls+RGTUmpLoW7LYxam3yYGUSEAsnI05?=
 =?us-ascii?Q?U75eXV5v1Tc9wOFF3llQjlqN4yIS9U3beohIU2bGu6x4TkH9lop3udRhNlJ+?=
 =?us-ascii?Q?v/MjXXq6kQ7YR8tgXGfwrNm9y7pZ6xLnYBEgntpeDzCcgGTQEjP5LoFh63CS?=
 =?us-ascii?Q?U8tpJxcgBRO6uYeVX+v4V8bmCjJuNoEylLfIqJen4HFSF+Wr5ZXEjnwNvAXL?=
 =?us-ascii?Q?lNS5yXDj0Xu8gotat/EKv3KPqsq3JzMl4FA8MYStWKVMLf3YDp4yCK7WLEKm?=
 =?us-ascii?Q?zyimzNa64VXOoPhUw+/m3muhyiCf+5oXKgasw8rpmI+EY1vMcQbUR03hlzES?=
 =?us-ascii?Q?qLM3FgVL1hI/vKaI1nqb30dVhzlA9ckbkN2PTSCLai16cYv/gJ5ovSQlKbVl?=
 =?us-ascii?Q?YwlAtR3dLWheV7qMwgQDRzwKeMwem/Zgn7QKKi+9oMgyGehRQhi3ToYx8bTH?=
 =?us-ascii?Q?SuBeXkMP0n9o+HKqhEJSjRKUuTgxOK4ORh/9uxZ+lbLvCypTyceKFGhCj3sc?=
 =?us-ascii?Q?BlRslTajNbhSNgWYhVeQRZdxMUG/6sQccNcKoKcsUzXmhgkXFBl9LCIUCCqR?=
 =?us-ascii?Q?jy0rA9fs/HoXbkN7MBr482SgEP3EXA9NZNfBq/1m3KPgx7VNlfiWrmBfx+uB?=
 =?us-ascii?Q?3a4jsZkNnghGQz7pQKmyRYBEi9W9QxTdVYu0DTGWA5QduGP1B82SjuSDMF7z?=
 =?us-ascii?Q?nfk5/irU94APBC+O8Kx99e6XZrqOYAo6VkZrkpXSTRnhZuE94K1BlW/+4RPS?=
 =?us-ascii?Q?qDmc2LdEEK5AlSD0SEenOm3pht28eAp2irGwSZ4JMRWmg4/xwB8qc1wUtBW6?=
 =?us-ascii?Q?+dvh0qmkjseQPR5EozcOrQPOi7EV8IF5jZZkiLoUHKXih8tYCz1sB1dMcxJR?=
 =?us-ascii?Q?suJU1iUa67ECsjjCIVCSwURnAKsJ+MVkaFWP7Nca5pc2mVH/BBIHRKlS7XXH?=
 =?us-ascii?Q?RrQKd0t9NtixSIicquPPL27kr6oZnFOrSloERFcOkX9X4xI+stE3IaKWwPH7?=
 =?us-ascii?Q?f0B0p6Mrtxsg8yyb6W+Q1r5wzHSwwGqvETbZgdX7kTV4iuZjJAMJH+fA/w4v?=
 =?us-ascii?Q?Sz0gpr3JqzW9Ch9HElVxIaXyUxDqvTdlreD69eXequog0at3mHp5rMS+ivUS?=
 =?us-ascii?Q?XHznLO+02Tl5f45lXEsSnQnVxZ6f6N8HgGpvOrp46AoSwW2CVgaKPdU0MSxG?=
 =?us-ascii?Q?4kE8cT+H26MuXJ53/y3A4+HM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1765a814-7a41-4db6-202c-08d956e0dc1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 00:43:21.4210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3p+0KvijdACOIvQBmoyW560Hm+CT7kNOfC3jASlJpn82e2aOB0mbxOCaCW9XjZgFiDUYpisc2lU3Hl2O1mrPI9YP+Om3X+5qKUCHPTJADAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4269
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Greetings:

I believe the way that this project is using EBPF hash maps in an EBPF prog=
ram that processes received packets on the XDP receive hook, we need to acq=
uire spin locks while updating map entries, or else we are subject to multi=
ple packets being processed in parallel on multiple CPU cores, and causing =
incorrect updates to the map values.

https://github.com/intel/host-int

In particular, we should use spin locks at least for this map in the progra=
m intmd_xdp_ksink.c: https://github.com/intel/host-int/blob/main/src/xdp/in=
tmd_xdp_ksink.c#L27-L31

I have made at least a few small code changes that seem like they might be =
correct, in this commit (on my personal fork of that Gitub repo above): htt=
ps://github.com/jafingerhut/host-int/commit/55577a6efd9d2f5c067f7761aeae01d=
5669b57fc

While those modifications still allow me to compile the program intmd_xdp_k=
sink.c, the program fails to pass the kernel verifier when I attempt to loa=
d it.  The error messages I see from the verifier can be found at the end o=
f this file: https://github.com/jafingerhut/host-int/blob/partial-spin-lock=
-implementation/README-verifier-error.txt

The last file I linked also shows steps to reproduce the error, at least on=
 an Ubuntu 20.04 Linux system.  I have not tried reproducing it on other Li=
nux distributions.  I am not aware of any part of that code that depends up=
on the Linux distribution, other than the Bash install scripts, which insta=
ll particular Ubuntu packages for build dependencies.

As mentioned in that README, my best guess is that the main piece I am miss=
ing is a BTF description of the map, mentioned as a requirement for using s=
pin locks in the bpf-helpers man page in the section describing the bpf_spi=
n_lock function: https://man7.org/linux/man-pages/man7/bpf-helpers.7.html

I would greatly appreciate any steps or example code that would help me get=
 to a working implementation of spin locks for this map.  Bonus points for =
me if the steps work on a freshly installed Ubuntu 20.04 Linux system, but =
hopefully an example working on a different Linux distribution would help m=
e see what I'm missing, and lead me to a working EBPF program.

I have attempted to compile all of the EBPF programs in the samples/bpf dir=
ectory of an Ubuntu-specific Linux kernel source tree, but so far have fail=
ed to determine the exact sequence of package installations and/or commands=
 required to successfully compile them all.  I know there is at least one s=
ample program there using spin locks.  I have heard that DWARF and/or pahol=
e might be useful here, and I see pahole mentioned in the kernel samples/bp=
f/Makefile, but have not yet been able to see the pahole command ever execu=
ted by the Makefile (likely because I am missing some necessary setup steps=
 before trying to use that Makefile).

Thanks,
Andy Fingerhut
