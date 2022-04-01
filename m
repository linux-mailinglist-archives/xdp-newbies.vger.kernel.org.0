Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446AD4EEE0E
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Apr 2022 15:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234879AbiDAN2J (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 1 Apr 2022 09:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346306AbiDAN2I (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 1 Apr 2022 09:28:08 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EDA27D560
        for <xdp-newbies@vger.kernel.org>; Fri,  1 Apr 2022 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648819578; x=1680355578;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gFdrCXDFAsFt56FAWLHEof6TqEGGOZaz2vEHFD6OZfk=;
  b=FRKRDeZPRlWrafdVn3ACLbQvkqqwVD1f0DIsDXEqoovfR0UFSrIkZUaD
   ZSAHbmYKu1PtKPGCzTmqVUEuvtRyKWOU5Is+LeN/KQyS1Ms/z6xGheSnh
   sYAj+WHSYnQbKD/pYEjqhx5Ld2d7gWGcMrgjsVqnl67sZsuEs01oHzPfl
   HCkYHBFSpoJ9On/t93IAN6ShCUhdi1W6zrRZbW7H8bSUgRI+3kkgWZ0jO
   igd3UmgWozaRexo3flsvvGixXYMy78gRTQCafZtOBFG8Nzq2qNcLRheUd
   HJ2SkL+K+pyb3cTCGxiwjoElP/bMfaUGAFM6Zx18Y5c5EFth0fBmr5G40
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260121674"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="260121674"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 06:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="547798779"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 01 Apr 2022 06:26:18 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 06:26:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Apr 2022 06:26:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Apr 2022 06:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEapx3MYIiKhg00fE42cYw1AWVkuIMifIaqkoSbEYoPqml6UqAJfvitMLAA0pzr/Re/G2I1jjDJ3mp5Fpec8WV3Kb5kwXOAop+3lY64Jp01yd1Y2RZ+snt86pJ2Sl1TNZgvZ+54zXc5GAxLCqdOmFPD3gHCAId4n+es5xA5DKM2wg/XjOHkG3dAuvnt0yemP1Yb3HjL2cOrnngiQyXrcXVYnE1xhirNiuEYD0HJFedHs44SXRAruLsQZi1rEpACa9RQbcMOJN+R0Oo5gcE5km0GBkwNhmXuafEN7S93oERsl2aztFXuRUZe7N+iC2L0d7Qytidi3YkdZRbW9Tr7GLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFdrCXDFAsFt56FAWLHEof6TqEGGOZaz2vEHFD6OZfk=;
 b=aNQDpa/ZbOL0FNi2CeFbhOQxCQdXuHATubUxqxdodRv2kg3+75OoNEMPWJs0eWXlqWDy/Q4Feh5fG1bt1T6tMtB6P1+HIKCOEeAXqjk/usKvyVAur2ll8osSK6qy7AlNoafvUf6lfsxq6V3ooZh4Hnz6uhUy0N9w3VP5wsCgFNvYCFdajTyfyUxozyuIKq4AXL//TZb3Z9pPRBoZMdi/1gtTYffMKGyWKZYnm4MWw0e2VXJkpv1/c1EpfubAB7SBEdfvs7RvfFv75o8dUTnzMk9SaQiuEbLebXQDPDDh6oFM1F0z93j705dbLG/vg1PwyNectObrk0weHijgqcCx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by BN6PR11MB1763.namprd11.prod.outlook.com (2603:10b6:404:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 13:26:12 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::d104:4271:111f:5816]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::d104:4271:111f:5816%8]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:26:12 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        "Kal Cutter Conley" <kal.conley@dectris.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
CC:     "Brouer, Jesper" <brouer@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        "eric.david.sage@gmail.com" <eric.david.sage@gmail.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Subject: RE: XDP multi-buffer and AF_XDP
Thread-Topic: XDP multi-buffer and AF_XDP
Thread-Index: AQHYRb0fn/IWROZgkEG00H7CPEzuhKzbCRKAgAAAaQA=
Date:   Fri, 1 Apr 2022 13:26:12 +0000
Message-ID: <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk> <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
In-Reply-To: <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.15
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f681f616-9ad0-460c-a6b0-08da13e330c8
x-ms-traffictypediagnostic: BN6PR11MB1763:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB1763E8716FC7CF4EAB97D692F7E09@BN6PR11MB1763.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uaasYfe5Yq0cY1NdJfy2GV8IUJonuwyf26S9Kr52mlRoj1V/NvLCHM/Mf/gfWNqCun4b/gPMJy9d2jpjfdQmZx1b7JiElfcYRAptp2RfX+tArI6KMyTXtwDWzgRxdFBKS8FNlcL+NNa2LADBszKJHZlhT7kg7wDmW5FReNwFF8WuBwqENUVUmMUukWEfSSQyK12XjCmtF+h0aehXj8cY3Ltru39/9RUVAQl9rnUOS+rVW5ycoo9Q64Pw9mKTdzjEuEzg9+NF6rNfs8fcFTYJRA5Y85v0U95pVC88c+6s5x1vlWtMsi7V/ggGUvvvSCyORTIjcRIuf5LFezOiRIx+83Yz3VqdyVBhTbk7hS+60t4vMDRxBKsnK95DKftmkeec+QKHBzKOJUVnMyfG9VHygPu0sRwxaZYYYLyp3qEME6Il6Eg7qqrkXVYDiUVH1O0T4OcClIQncFck+slqOj/U5BfGguagQuRE21r+2ZeL+Xv5id5wXEHoiJAOz8qEyKFbPHG27sEaZ70zLXXvIzF8wTOjlcNvESyyGMlIYQccmMKB3FzeR80Bj1RTZkX21i6TGiixh7F6FDt9vztcwA2NmnNOswV3XMQ+JamLwAf1nnwYs5tMkSI+MQM/7OVgcsioeoYzm5Y1USJqOMHBuOi50sVRIz0B6E9daoi6cKgISCkVtcN92jqOjCr6vWCnWM0ow/P7uM+qIkn7VrcBZXmcPA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(55016003)(66556008)(33656002)(76116006)(2906002)(8676002)(64756008)(4326008)(9686003)(7696005)(66946007)(6506007)(66446008)(110136005)(38100700002)(66476007)(53546011)(82960400001)(38070700005)(316002)(6636002)(54906003)(71200400001)(122000001)(52536014)(66574015)(83380400001)(5660300002)(508600001)(8936002)(26005)(107886003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW94dU1qZ08ycVpCcVR3YmRHUWtZbWpoV3I3Z0JCUm9ZRXc3d20wVWxFRElk?=
 =?utf-8?B?RHJoWVRvb0NJVFVVOTVya0ErbUdTQ3JYUnlBWGxTZHVDWlEyOGVFK2dtQWpZ?=
 =?utf-8?B?QWo3ZW1MSTZnT2RVeHFINmhNMk0yZFgyUFVzLzh4dEhOWFJYYWdaNkpDRGl6?=
 =?utf-8?B?TU1xeVN0aGhhWmZ4b1hualo3ZzBLZEtkT2d4ZWVBM2lLWUd5K0pUN0I4YWwx?=
 =?utf-8?B?K3dPcjZyZDd6T1k0eUtNbDB6bTM5Qmp4ZlVrNmxlTkJaWlUxd2pLamFlU2kr?=
 =?utf-8?B?U1czT3BaTFFHcXZjT0p4ejFhc1RWZ2VnMnZTZkJyT0xGeFBpNHdXMFpOa0xF?=
 =?utf-8?B?U0syd3JXQWIrZXB5MGxzZTFGdXJIQ0dOdGtQSE85K2R0NnMyYjI2dlM2R0hw?=
 =?utf-8?B?MVJvclNuZ3pKRW1NQ0Y2S3JVRGtMaG1NZ2k3bTZyeVVLZnc4MWlDc0o5c1Zs?=
 =?utf-8?B?R3NZSGhaYVpEUjlNWDZiMkJWT1dRRUM1TExORGY1VEg4TXlHZGNnZ29qVVI4?=
 =?utf-8?B?aTVsUWxnTFJNZSs5NlB1UEhzT1hyOEVmTjdpekdHcHVHUGN1MDJZRFRLeDFZ?=
 =?utf-8?B?aUFjczhZRGRkTEFnamhVYTErZ0lhcmRPZTcwdmV1dGV5WG9wMnROZUExWEly?=
 =?utf-8?B?c3pldXlPWUdwSXZuaUZWUGJSdzF1SEpvMU5GNWxwNVVnL0dKanZDZlI1WjRP?=
 =?utf-8?B?S3F6b2I0TXV6eXI3T0grTkovaE9rV1loT1lteVdTbGpMU2J1emdzbnlPcG1M?=
 =?utf-8?B?WGZXVDhQQTZwMVpXc3Ywc2hnbk5qdUtVMHd0QkdtdysrcGVTNVdNZU9TMzFy?=
 =?utf-8?B?S04zRElyZ3RRcmZpSlJFRTZ5Q3V2enpWUitFeVhrRmppRWE3NnoxVDVQZjh6?=
 =?utf-8?B?VG5ubmpHanR5TTVkaTJLNWRPMmEyVUNxaEdyU3Z2NldRNGJGTk43eTNkcHIy?=
 =?utf-8?B?U2NLUXRGdnMrRUxxeUJoUCsrK2JDcW9zdWowVFNuRld3b0xibHNuSERWL1Qw?=
 =?utf-8?B?U0IvTjFTVDM5ZW5JSjdYZ0xOT3hmbG1kNmtNTXc0NkZTTm05RkYxMmlHQmdP?=
 =?utf-8?B?OTkzM3pZTWI1WFRkN0FxQTYxYnRKNk1pQ2ZnenhJVXo0MXpFMzBSR0FXMGFk?=
 =?utf-8?B?V2FOTDZHM0lSaUllUzFTa1BPZXdpVk95bFRZdWJtb1Uybm1sMDNXL1c4cVNi?=
 =?utf-8?B?NCtYOFVPdDZSTGpueXAxOVJULzBXeDh5RzR6d3RabjUyb0RwMm5vend6SEx6?=
 =?utf-8?B?cmJudVNSZTM4YWJKNGJ1Z3VvSU0wdDYxeW5MV3k2andBWklLVnczeC9XalZJ?=
 =?utf-8?B?NVFnYkZUa2hsaGR0bjkwU1BBWjA4eEFEL1dXV3dqSEkybVd5YWJhaUxlZ3M4?=
 =?utf-8?B?Y2t2ZWhHRkZZVTdDNUJQTjF4Z1hDdzV4Q0VucDJRZGh3S0FIcytROWExUzNW?=
 =?utf-8?B?SnhxeDJtWWVzZFF5eEJSN05OUGdyQ2NTVFFHV2VHUHlsUnI2c1FPcHY2YjVi?=
 =?utf-8?B?OE5DMFRpMDJSVFJCNGt1Ni9oVTE0YmFOc1I1bmUrQ0tsaUwwa0tZREdMb0k4?=
 =?utf-8?B?Q0VQYlh0UjJUVEJvUU5ua2U1U0lTZ1lsVE5hUm5BUVA4aCsrSnM5bU96VVJX?=
 =?utf-8?B?dUUrWFJ4REdqcXRNcG1xblNjT3JENXZabFczRGFIU2d4Y2VpcVZMekJqWndy?=
 =?utf-8?B?bXp4MVVOWHBncCt4MUtoVko1Z0NKV1JoT2thVHhpSWlzVlRGT3h4R3BiY2Uv?=
 =?utf-8?B?MmxrcmdMVFJHdGpVRjdBQ3VWa1AzMVVSWkJXT3QyWjlRa1M5UFF2QUMrRjFm?=
 =?utf-8?B?bmNlQ3p2ZFZxbk9XSWY0aFJOczhjOXFGcGJkMXVVUGhDZ0prTEg1MjJUM1lI?=
 =?utf-8?B?eTBDN1JNZUZJa0pDaVQrb1Z2SFlpZGRSb21MT1JWdk1ZaVJlTklGWEYyT2xl?=
 =?utf-8?B?VDZQQWFja1VhSFRCTFpvOVpmdUxLOXVnbTFrZlB4bU9ubTdTNmdsSjh4bEtu?=
 =?utf-8?B?dWttQWJjTGJHTTJ4ODAwNnROdHB1ck9FSlQ3dkdRRHBiNUlIYStxODlPRVow?=
 =?utf-8?B?MFQ0TkVrU2FxdG8ySklQTTJUZGY3Sng3ZUg0Q1A1cDhrV2FjR0k1WGtzNll1?=
 =?utf-8?B?dENGSXNwd0lGR0JCN3A2UU1ybW52VVg5MWp2Sjhkc2swM2JwUjN6cGpxeWZp?=
 =?utf-8?B?TGRISGEvelM0cy9LTldNbnpEbmtCdE9JR2NabTlUOGwxVUkvRjlmLzdjM1A5?=
 =?utf-8?B?SjZQaW85RlQ4SWdJRFZnd0FFSGIvcGJVTGVhdkVPa3V1MlE2RlZmYlE0enhj?=
 =?utf-8?B?b1hQWm5ncEQxZjM2U3pUV05mZVJ6SEFXRGdGMlIzV3JDS1hwcDdWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f681f616-9ad0-460c-a6b0-08da13e330c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 13:26:12.2056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UmD9525a9d5E5ZiiTlfqLvND/SO1MxM5zk++IlGJH3QX95W78vQfKaibjqDsuBeF1y0LhI3UpO2T6L/Un74SHxhGFM9PcIiGBrG5t2uqnAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1763
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmVzcGVyIERhbmdhYXJk
IEJyb3VlciA8amJyb3VlckByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDEsIDIw
MjIgMzoxMyBQTQ0KPiBUbzogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5j
b20+OyBLYWwgQ3V0dGVyIENvbmxleQ0KPiA8a2FsLmNvbmxleUBkZWN0cmlzLmNvbT47IFhkcCA8
eGRwLW5ld2JpZXNAdmdlci5rZXJuZWwub3JnPg0KPiBDYzogQnJvdWVyLCBKZXNwZXIgPGJyb3Vl
ckByZWRoYXQuY29tPjsgTG9yZW56byBCaWFuY29uaQ0KPiA8bG9yZW56by5iaWFuY29uaUByZWRo
YXQuY29tPjsgS2FybHNzb24sIE1hZ251cw0KPiA8bWFnbnVzLmthcmxzc29uQGludGVsLmNvbT47
IGVyaWMuZGF2aWQuc2FnZUBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFhEUCBtdWx0aS1idWZm
ZXIgYW5kIEFGX1hEUA0KPiANCj4gDQo+IE9uIDAxLzA0LzIwMjIgMTMuMzksIFRva2UgSMO4aWxh
bmQtSsO4cmdlbnNlbiB3cm90ZToNCj4gPiBLYWwgQ3V0dGVyIENvbmxleSA8a2FsLmNvbmxleUBk
ZWN0cmlzLmNvbT4gd3JpdGVzOg0KPiA+DQo+ID4+Pg0KPiA+Pj4gSGksDQo+ID4+PiBXZSBhcmUg
dmVyeSBpbnRlcmVzdGVkIGluIHJlY2VpdmluZyBqdW1ibyBmcmFtZXMgKD4gODAwMCBieXRlcykg
b3Zlcg0KPiA+Pj4gQUZfWERQLiBEb2VzIFhEUCBtdWx0aS1idWZmZXIgc3VwcG9ydCBYRFBfUkVE
SVJFQ1Qgd2l0aCBBRl9YRFA/DQo+IFdoYXQNCj4gPj4+IGFib3V0IGluIHplcm8tY29weSBtb2Rl
Pw0KPiA+Pj4NCj4gPj4+IENoZWVycywNCj4gPj4+IEthbA0KPiA+Pg0KPiA+PiBMb29raW5nIGlu
dG8gdGhpcyBtb3JlIEkgZm91bmQgdGhpcyBjb21tZW50IGluIHRoZSBtbHg1IGRyaXZlcjoNCj4g
Pj4NCj4gPj4gLyogRG9uJ3QgZW5hYmxlIG11bHRpIGJ1ZmZlciBvbiBYRFBfUkVESVJFQ1QgU1Es
IGFzIGl0J3Mgbm90IHlldA0KPiA+PiAqIHN1cHBvcnRlZCBieSB1cHN0cmVhbSwgYW5kIHRoZXJl
IGlzIG5vIGRlZmluZWQgdHJpZ2dlciB0byBhbGxvdw0KPiA+PiAqIHRyYW5zbWl0dGluZyByZWRp
cmVjdGVkIG11bHRpLWJ1ZmZlciBmcmFtZXMuDQo+ID4+ICovDQo+ID4+DQo+ID4+IFNvIGF0IGxl
YXN0IG1seDUgZG9lcyBub3QgeWV0IHN1cHBvcnQgWERQIG11bHRpLWJ1ZmZlciB3aXRoDQo+ID4+
IFhEUF9SRURJUkVDVC4gV2hhdCAidXBzdHJlYW0iIHN1cHBvcnQgaXMgcmVxdWlyZWQgdG8gZ2V0
DQo+IFhEUF9SRURJUkVDVA0KPiA+PiB0byB3b3JrIHdpdGggWFNLcz8NCj4gPg0KPiA+IFdlbGws
IHRoZSBpbml0aWFsIHBhdGNoIHNldCBmb3IgbXVsdGlidWYgZXhwbGljaXRseSBibG9ja2VkDQo+
ID4gWERQX1JFRElSRUNUIGJldHdlZW4gaW50ZXJmYWNlcywgd2hpY2ggaXMgd2hhdCB0aGF0IGNv
bW1lbnQgaXMNCj4gPiByZWZlcnJpbmcgdG8gKHRoZSBUWCBzaWRlKS4NCj4gPg0KPiA+IEZvciBB
Rl9YRFAgd2UnZCBhbHNvIG5lZWQgdG8gZGVmaW5lIHRoZSBVQVBJLCBhbmQgbWF5YmUgYWRkIGEg
c29ja2V0DQo+ID4gZmxhZyBzbyB0aGUgdXNlcnNwYWNlIHByb2dyYW0gY2FuIHNpZ25hbCB0byB0
aGUga2VybmVsIHRoYXQgaXQNCj4gPiB1bmRlcnN0YW5kcyBpdD8gTm90IHN1cmUgYWJvdXQgdGhl
IGRldGFpbHMuDQo+ID4NCj4gPiBZb3UncmUgZGVmaW5pdGVseSBub3QgdGhlIG9ubHkgcGVyc29u
IHdobyB3YW50cyB0aGlzLCB0aG91Z2g7IGFkZGluZw0KPiA+IGluIHNvbWUgcGVvcGxlIHdobyBt
YXkgaGF2ZSBhIGJldHRlciBpZGVhIG9mIHRoZSBleGFjdCBzdGVwcyBuZWVkZWQuDQo+IA0KPiBD
Yy4gRXJpYyBTYWdlLCBhcyBoZSBhbHNvIGV4cHJlc3NlZCBpbnRlcmVzdCBpbiBpbXBsZW1lbnRp
bmcgdGhpcy4uLg0KDQpBZGRpbmcgVGlydGhhIHRoYXQgaGFzIHBhdGNoZXMgZm9yIHRoZSBBRl9Y
RFAgc3VwcG9ydCBvZiBtdWx0aS1idWZmZXIuIFRob3VnaCwgaGUgaXMgY3VycmVudGx5IGludGVn
cmF0aW5nIGhpcyBpNDBlIG11bHRpLWJ1ZmZlciBkcml2ZXIgc3VwcG9ydCB3aXRoIExvcmVuem8n
cyBUWC1wYXRjaGVzIHRoYXQgaGUgc2VudCBhcyBhbiBSRkMuIExhdGVzdCBJIGhlYXJkIGlzIHRo
YXQgVGlydGhhIGlzIHBsYW5uaW5nIG9uIHN1Ym1pdHRpbmcgdGhpcyBpbiBhIGNvdXBsZSBvZiB3
ZWVrcyBhcyBhIHByb3BlciBwYXRjaCB0byB0aGUgbWFpbGluZyBsaXN0LiBBbmQgYWZ0ZXIgdGhh
dCwgdGhlIGZvY3VzIGlzIHRvIGJydXNoIHVwIHRoZSBBRl9YRFAgYW5kIFpDIHN1cHBvcnQgcGF0
Y2hlcyBhcyB3ZSBzdG9wcGVkIHRyeWluZyB0byB0cmFjayBMb3JlbnpvJ3MgbXVsdGktYnVmZmVy
IHBhdGNoZXMgYXQgdmVyc2lvbiAxMyBvdXQgb2YgMjMgOy0pLiBXZSBqdXN0IGNvdWxkIG5vdCBr
ZWVwIHVwLg0KDQo+IC0tSmVzcGVyDQoNCg==
