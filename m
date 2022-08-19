Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A84599D52
	for <lists+xdp-newbies@lfdr.de>; Fri, 19 Aug 2022 16:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349167AbiHSOF2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 19 Aug 2022 10:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349148AbiHSOF1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 19 Aug 2022 10:05:27 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30A1A1D7F
        for <xdp-newbies@vger.kernel.org>; Fri, 19 Aug 2022 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660917926; x=1692453926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+6EWHRybAkUZHezx7ZxwW9u/cuGUCTFRgPwjGWzplCY=;
  b=YfFscK1dbB4RDomvVJWKBjnA0n2G6RSM92hK2vjGQoBwO+8eK5h7FaoK
   0L1R7FyHAJzfdx5yg6eCjkJ6QdcFUGGMDNF1NUt/Nz7SP3defHOjKv/2v
   8JVmi9Bx6c+6L4rteLV5AF2UbnS7MMNZl6AsmH1BA61naJKXR6P9igf2Z
   ghKuUgxjqLbB5cGGBsH4Yjf+QF32xqlkq8sH+HWuDtiYt+P6Hnn3bBMb7
   QNeo7En5YUqNIER3e3ulY6Ghj03YEELAqEXqoswmAbFxQdE4zxydpYJCY
   hrjkfeXW23FFg+WTxmWtZHAaMtSzO4ts0I4f+XhX1hN4wvxtwJDzqNk3/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="291774086"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="291774086"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 07:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="734418338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 19 Aug 2022 07:05:26 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 07:05:26 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 07:05:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 07:05:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 07:05:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+/zArpwPYERXLkQ+CtyJrkQ7YF3MbICfzulk35eo+Lh1nRJvgZXztjp4k/JkURyTDOgQZEIclivOa2hU/+oyau5PSdwln+gEcFAUL7Zkr+bbXxZXXDSg2bcBmfVandr/3unpjrzICi+ynhNLyo//m8z6pNCzJtRBPmMSfr6SFZs/FB6K1wOrDYAUQzgJVlF8Yz0CvvNsjKNqA1dnSPhkYi4iMKM2AbqZIxyZWynqqUfbhZjHCsqzM5vNxXbAeF1M2GjJyfrDhJcfdEGiZA2Cr0s4H4aPbbzwTAV6HXUXeZmasjjgcL7kqzcW5PX+tVf95b5m0AQA7VbnAStUqOsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAu91Xg+6cuAyhonKglpSsqLTMWoLmsiuXqomDR1470=;
 b=EH9jOh5iN7p0LUPlcOgYeZJTg4IFauoETTvI/uSnp6lLmTKlWJFZLYl0uO2nj6y7pD+6tUKKaP99c2wTPKL9M+Gvyh8Pp84yJV3li/6gWGl0Z1kr8I8dWcvk1TWgxfe3CGWNaO5Bwk6YFMN5qA+4kwSL6z2CBJsaLq3xzHbNIZlXWsBTL/7W3+z5rXBoN82K7m/DrWRMasPlt/yXh22MBFYt7Jfe9bGKX7KBYs2gs7OlrAcnYhyE7V38vE6nArVmkczRJTClqg6BpVG1gCYQ2nnpApXn4cXMwTDsV2vjk/79wzf4FGi90zcG1dfxi3qOl6RUif062ygrF0c70fs8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 by DM5PR11MB1515.namprd11.prod.outlook.com (2603:10b6:4:11::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Fri, 19 Aug
 2022 14:05:23 +0000
Received: from PH0PR11MB5144.namprd11.prod.outlook.com
 ([fe80::c8fd:adf9:fbdd:e1d0]) by PH0PR11MB5144.namprd11.prod.outlook.com
 ([fe80::c8fd:adf9:fbdd:e1d0%9]) with mapi id 15.20.5525.019; Fri, 19 Aug 2022
 14:05:23 +0000
From:   "Kuruvinakunnel, George" <george.kuruvinakunnel@intel.com>
To:     "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
CC:     "alasdair.mcwilliam@outlook.com" <alasdair.mcwilliam@outlook.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Subject: RE: [Intel-wired-lan] [PATCH intel-net 2/2] ice: xsk: use Rx ring's
 XDP ring when picking NAPI context
Thread-Topic: [Intel-wired-lan] [PATCH intel-net 2/2] ice: xsk: use Rx ring's
 XDP ring when picking NAPI context
Thread-Index: AQHYra9V4BxtEw6kG02mWyf8ALW0f622Kulg
Date:   Fri, 19 Aug 2022 14:05:23 +0000
Message-ID: <PH0PR11MB51448EF4094FF8F262B1FD92E26C9@PH0PR11MB5144.namprd11.prod.outlook.com>
References: <20220811182149.145358-1-maciej.fijalkowski@intel.com>
 <20220811182149.145358-3-maciej.fijalkowski@intel.com>
In-Reply-To: <20220811182149.145358-3-maciej.fijalkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e915becc-16fa-4cd1-847d-08da81ebdbd9
x-ms-traffictypediagnostic: DM5PR11MB1515:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQ2ucgmXxyY8bdztxywI0dRmOc0hBEBRocK+FOLtWMnTFtHRVFkE9bHwlkCWqBBWX0iiqqhDeBoXNluCZMOBg7QNTMEhePJsYIIPGO5xKSuHNP3XT3UDfiiznym+90Yr0gh5kwqhRuwIhTzKjLDE5llXFdYd7gWTQx9DsxCVNPOJ2RsWztfMYyEkBtrN30Nb+An+JBzluCgco/Jsah5B/8wFY1RmbzI+cX1kd6x/CJLeusJdFVJGVMSpGg2OC2mmFBF3ArX3UgQCnB+u3xV+5tbat7T2M/WLvpgV5x/FJ/oA6sMRytj8f+zcjBwH7UoXCt4DqLhooUUhTixJmdyyJlhvpqzvWEnZn/2VWDan0QfFwgAKo8oDTRqLbxF8Svc1C3UpJ0yIKl43QdhendcwdcVacuJFrbEXbjFDNwc9WgYCS6t4DJjwR+TS4ijo6kEXY9JSvEpz6AKzpblNfk0YgCLH+ltPLjooZJq0pwLn36q5IFOr/mh8O46WgDB5vDLMr6nU+JaK9W2qJ+dEoKkQ3Iz7d2TuZOzS4ikywPsAUi8m0hggqxAIZBFdcXvbpCpMRMcmJMgm35rlz6LCg7nrmeW8vhU0nGbRhsDmbRgtImCu6HNkXMOn8t5iwrMeTRG2YuTX9mB5DpxlmsxJN1uKLO1XZW0SDlv23rA7Rq7nO0FEkUfypGMzB91oYWGtwfXiP9uIOnvB4GJhk+u48GwGSoSlTJ7Qt6RLFC1UkhpUoLtWVefBP9SIjVJ0cIlVWAA/dnRlmf4EbAluA3nSdl8oT4733vO9rryEL6B1KULspe0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5144.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(376002)(366004)(39860400002)(82960400001)(66476007)(76116006)(8676002)(66446008)(2906002)(38070700005)(4326008)(41300700001)(110136005)(45080400002)(86362001)(66946007)(54906003)(316002)(5660300002)(478600001)(33656002)(64756008)(71200400001)(966005)(83380400001)(66556008)(122000001)(52536014)(8936002)(55016003)(26005)(6506007)(53546011)(7696005)(9686003)(38100700002)(186003)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?taiHMZ+bm2pP36xROFzpppl2upMk8dk0anR9klDlmiAu8xdNB+jt1hDdwunG?=
 =?us-ascii?Q?1W/3jmdXoHzTr09Sd4LoXLw7Dg6t9L/ogokpwHMJRCrtkpEABdISstgZagK3?=
 =?us-ascii?Q?jGsXM6k/GSEsmYVV9MhtySlGNk8QLp21E8RdT8Yf3ZEPYZe2MbHSFA7Jg+fF?=
 =?us-ascii?Q?m1g9WUY1pam2TSY9/gzLzd9pH1Pf9L9EMWyhUBu5SXcoMNATDtrpPo42dbRJ?=
 =?us-ascii?Q?Mu7gmd0ejEo1iZLnqS/00HdaIYGz2VXo+v+YZAral7zjK2UIXfc5XNDtyYEm?=
 =?us-ascii?Q?0iZGAGGW+XhX9Q5tJcwJXPDDZVD2K1aR/gjcpDAJsBo1XOoTstaZcNSrlNom?=
 =?us-ascii?Q?kENoxggJpJ4O6BOOSZYF1MCquOOLFJD5CBjpEmK4PaGjr8C/csFggO+aBhui?=
 =?us-ascii?Q?/HzGWrHVCPIZZFnmU0hjvNqOdxqlu5skAc8njTRvU+ZasC03Byd4JSFGz4tD?=
 =?us-ascii?Q?D5p3rPpveZl0EPmi1BovIUZC3MAXJ991OFsFPyqRFiU/LM4XzmJ6WNm3u5t1?=
 =?us-ascii?Q?AOe9JtX5oLFZtv5Pt/4EzP7Q33pIlERfdqWyDj3o2XPe6wHxrKVTaLEtvuyL?=
 =?us-ascii?Q?49k6hoplWprPAkeBSw5NfKB+2Hnyge8abDvg1HTjDQyMoOmbhe1SixteuDft?=
 =?us-ascii?Q?oQL92/cMbhVZxBxWu1X0xKpwKqImHFV4uBBpO1nKPNOIlhcDrcC78k/I9Rcn?=
 =?us-ascii?Q?Flqe8kBFwydaWD0TePFtlcMdp/b9Vv5GPJKz6QNrwThmnEpV8uPNLAndfqxo?=
 =?us-ascii?Q?242HWkTbdI7tJEigDSrw0nP5n9xce5NWjE/HnaCdvlAb4e4SuBmY7h7rbFnW?=
 =?us-ascii?Q?cDQhsN9RzJby+DtE+fIULykAKADR6Xwebz8bRFHZjvv43CrMo2RhNoPM5CyV?=
 =?us-ascii?Q?nO6vZj0qcrB4mLwnbCKmOdC5AMruwBuFAN7xaYEuIb1odrYJegLwCi750Clw?=
 =?us-ascii?Q?FNPKYbtA6EXpGpNcmuUFsLkqZgATlfSt9llxlfcrOxSoNSo9yZR4uO0j/y3V?=
 =?us-ascii?Q?tEV8VPASYBAlhmMKyqCgdpMnClsA5WcqsR+F/OJjsHzF9ZXxFzW0qmIa3l7c?=
 =?us-ascii?Q?caR6KrEaRGI7A+TGCSV3YS3nLyYVIzt4JotiR4/Rd/k0EqDdcDG6EqOqBthL?=
 =?us-ascii?Q?KbSfHlrMivn93+UKYU6TPK9wsKMv6IGbYRy8qW4VS5ar/H012dVw/Y95j+B+?=
 =?us-ascii?Q?al7L1VG+kJOpZSddQ9YShW+S6q5IbmpfwsNeRX9hCXWqaO5uSW3V1AhGHQeg?=
 =?us-ascii?Q?X6HxMucqlydU9xGxBpQZCAritAJ/qVcdPPRkqrUc9J9fjAMhAZqAlVaWskuh?=
 =?us-ascii?Q?eW3JN0k+Y2a/J+pLsVbgUCG6oTXLgVt7ebeAmSRmvkl0cQ+MxtspgnuIO6rJ?=
 =?us-ascii?Q?waeju7+lE6MqhtjmDIvGnTd0r/W8F2haxCkIsEMRF9Y8QVTfmoaWqbKBii3k?=
 =?us-ascii?Q?mRoA4DZHQz+ct5OPChhtU51hdAfUbbZCgyXk+N2LUc/MxrxkBd6RP6ArERPR?=
 =?us-ascii?Q?M4LAhANlUXoEHR/gWW87k4W2yQgH+QsJmfSKZtFUM6y5/GRXV2pepVuyzjjG?=
 =?us-ascii?Q?cG1wLF9No7KkSHDXXio4rwAqK7Dv+LdycTI84KQmmI5hRw3iojR5MJIJ8++X?=
 =?us-ascii?Q?vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5144.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e915becc-16fa-4cd1-847d-08da81ebdbd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 14:05:23.1641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lf6R1iZvXO2UfHry2TfVhhKYp+viBDMZqzkLQtk8hStHhkOLfC2EHNsr3zohASubhwRxo9igI3q7IraVbGOoECKJpajewubwRVywrGw7Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1515
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> -----Original Message-----
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf Of M=
aciej
> Fijalkowski
> Sent: Thursday, August 11, 2022 11:52 PM
> To: intel-wired-lan@lists.osuosl.org
> Cc: alasdair.mcwilliam@outlook.com; xdp-newbies@vger.kernel.org; Karlsson=
,
> Magnus <magnus.karlsson@intel.com>
> Subject: [Intel-wired-lan] [PATCH intel-net 2/2] ice: xsk: use Rx ring's =
XDP ring
> when picking NAPI context
>=20
> Ice driver allocates per cpu XDP queues so that redirect path can safely =
use
> smp_processor_id() as an index to the array. At the same time though, XDP=
 rings
> are used to pick NAPI context to call napi_schedule() or set
> NAPIF_STATE_MISSED. When user reduces queue count, say to 8, and
> num_possible_cpus() of underlying platform is 44, then this means queue v=
ectors
> with correlated NAPI contexts will carry several XDP queues.
>=20
> This in turn can result in a broken behavior where NAPI context of intere=
st will
> never be scheduled and AF_XDP socket will not process any traffic.
>=20
> To fix this, let us change the way how XDP rings are assigned to Rx rings=
 and
> use this information later on when setting ice_tx_ring::xsk_pool pointer.=
 For each
> Rx ring, grab the associated queue vector and walk through Tx ring's link=
ed list.
> Once we stumble upon XDP ring in it, assign this ring to ice_rx_ring::xdp=
_ring.
>=20
> Previous [0] approach of fixing this issue was for txonly scenario becaus=
e of the
> described grouping of XDP rings across queue vectors. So, relying on Rx r=
ing
> meant that NAPI context could be scheduled with a queue vector without XD=
P ring
> with associated XSK pool.
>=20
> [0]: https://lore.kernel.org/netdev/20220707161128.54215-1-
> maciej.fijalkowski@intel.com/
>=20
> Fixes: 2d4238f55697 ("ice: Add support for AF_XDP")
> Fixes: 22bf877e528f ("ice: introduce XDP_TX fallback path")
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> ---
>  drivers/net/ethernet/intel/ice/ice.h      | 36 +++++++++++++++--------
>  drivers/net/ethernet/intel/ice/ice_lib.c  |  4 +--
> drivers/net/ethernet/intel/ice/ice_main.c | 25 +++++++++++-----
> drivers/net/ethernet/intel/ice/ice_xsk.c  | 12 ++++----
>  4 files changed, 48 insertions(+), 29 deletions(-)
>=20

Tested-by: George Kuruvinakunnel <george.kuruvinakunnel@intel.com>
