Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51EC655C3A8
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Jun 2022 14:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234019AbiF0NRf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Jun 2022 09:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235465AbiF0NRX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Jun 2022 09:17:23 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127D91276F
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Jun 2022 06:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656335701; x=1687871701;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lAKDO2T6dmlN17fCjijd9X0nQzKbhNl5TZZCsqlyAM0=;
  b=WshkN8JmOlpP9OzE4iREpnbtsTV4U+aYsTucJfy28mq9q/6GPHIAOGHr
   QYX6kcwh4tBOBnYXemZ8OvHgEiBF3LubCTmfnPR7D+HzikwMP/oR+irJo
   K+Zn59BMPdFYb52SbFumW50b3D17AuWGyhGL+woQY3xXK8Jmy1U40xEzn
   6Oz1ME6zodh6Nn7j0wy0HrN6whNSktum3m/Y1Bd6JyL7AvvjL+dfzpFxH
   eRkA/4cwclYARj4cZOPl7RQVa251BmPcVF1tEoT09rm1z+vBnpKu6AH9X
   qgtobE9wKx7ljIRmHc5+ivc1EcC14CdUG/PrvP3LoaxEaSDhV9AjlJqVw
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="261252019"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="261252019"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 06:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="679577011"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2022 06:15:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 06:15:00 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 06:15:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 06:15:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 06:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpuXrsR8hIPmu9MYMs05zO6VJYfpydVgaH4JF5dIiCGUxxk1xmpGKLOk2L+7waeIxhqo6P+lI+zNL8cK0do1hJV5TZ6uCkRsTmPShntSUTxLWscIAQaDgGuXJT/Rv3a/mOCNlUvaTJtk3q+llT+YJB2VzHmlInyWjiIWJGsOHxrn1UySqlCDmDM62sx9uCDErhHcoWHiges/X1AMJKMM2qFXa07V+8i7axkScRM6fnD89ldwKdaCS2DEORQhBXMgLQrTBCl5AhkcEwQ8SEWSAUfwe++IhxLGOKI4hD5jM1FTRn3Zpzlj+jVlSjS8qd39zbySu3uheVevG/iQlul6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAKDO2T6dmlN17fCjijd9X0nQzKbhNl5TZZCsqlyAM0=;
 b=JJTVbDR6ic2+1oNQ5Ul5gPzAtd9mU+0pmgCAjtmKKnbqpLeGH5eOoHamPRCO968nOhjBzn8eADlzc+PZayTwonqCojAtf5dm6nN5tZcCN0VbPDV+m//+2WRSQy4a9SYAhIV4QH2vSaAJUEfLeq1Xy8QgRN8Ff3qiuJXUdBeVy+X8YN/iqfy/wca50FELQbROScDk+V4w7c4ohixoR/es4Lfhs8/t/Nsu0tkVFb91HvdDYWtuaCogEskeiFi2crWcsqd9Ld3i2Oe0YYXwb8B56YIXNFgkVOK616pnUzc4u0Afj+/w2NqoJJsxrR6NbzapOVKI+2+QYe8AdZv3jgSpzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by SN6PR11MB2768.namprd11.prod.outlook.com (2603:10b6:805:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:14:57 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::3ccd:c1dd:c9ca:6bf0]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::3ccd:c1dd:c9ca:6bf0%9]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:14:57 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Kal Cutter Conley <kal.conley@dectris.com>,
        "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
CC:     "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "eric@sage.org" <eric@sage.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: RE: XDP multi-buffer and AF_XDP
Thread-Topic: XDP multi-buffer and AF_XDP
Thread-Index: AQHYRb0fn/IWROZgkEG00H7CPEzuhKzbCRKAgAAAaQCAAApeAIAGHJeAgHqpgwCAB6WYAIAAHJ2AgAAnD3A=
Date:   Mon, 27 Jun 2022 13:14:57 +0000
Message-ID: <MW3PR11MB46029B6913E4AFBA24816155F7B99@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk> <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
 <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
 <YkcDgmldUGWoFWmQ@sage-macbook-pro.local> <Ykwj+ycjc+F70iko@boxer>
 <CAHApi-nTBXLUB+3jt27A2Qiewfam_YjfFXZs0mKu2qarPXAguQ@mail.gmail.com>
 <CY4PR1101MB2360C2F07AEC4EAB9043A64B90B99@CY4PR1101MB2360.namprd11.prod.outlook.com>
 <CAHApi-na1Oq9gvho92gAMtLJT5OKE9z7nNbopZ4Br7uCZom9ug@mail.gmail.com>
In-Reply-To: <CAHApi-na1Oq9gvho92gAMtLJT5OKE9z7nNbopZ4Br7uCZom9ug@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2911dcc9-88c4-4984-3a14-08da583f08ad
x-ms-traffictypediagnostic: SN6PR11MB2768:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ix3+7ryyBUCbrqP0Wx63BzBDokCqLQWl5U+YEgel2YJA9b1DsAGjOLZUfjfOsrc4TBNRRRDGnU0jC0Gj7Nma3vI+GUgw4Av/GvKrBSPmxyZzKiLREeGiWnXpK6OOTUfYKELxnIeyTtEsU7EQDiyobREcrN7+Enbv/ppiSdrDg2SQJaJe36fTz71rBqKJuzDivQRdHGeY7buK8FOIc/XO84NRRq4jqSjkL0azGkrmvREhx3b/gl+hMIhePfOizMPQktTV9JZW4smFCauTrbj0IieNdFnFatw+eMy9LquCGkgCCo+zMRWbWWjzxb/gKHHD8Z1J6hbwkKaQ9ljFOQMvSYFTievMF6fh2ZByFizzbsk5ndRdYYQK1IoSy4f/BfBAgJZum22fZ6AMp3ZkOkObnuasasXbCcR6WN8iiUxb1btVj6fneypUIE8Kzr4hrxJe41bQKsLvBkeyvb06QdvsV9kUGmjdebdp4CicaXMNCm/8LfOUl0NP7EuIgvrOnXdh4xgg8OKbli0C3X9xnHjLvGNU3ScOFMEtZtDAq630Iu2MGJQ1YKuXapRKic1TufeQufNKiWXWOBeDx3uFGhBvOZECUosZs11HON7qpMQQjENP8Gtqk/fY4U98+aMoiirXZLQP9IcAq1TqhUv1w2NGSnwzSeAFLceUf4KEaS7Kmi5UcsPuSW4oXGGs15ASCOCjpq+dR802nDNq/7x1THJ7E5+LRaKcyHjE3bDocRNDg5hBtHzPj82zDIexGd8o4P0EH9xUFy/qU1AuIU2JNcTs5/biZ70VUZ/laNgTrEMQW+A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(396003)(366004)(136003)(346002)(9686003)(86362001)(66556008)(52536014)(33656002)(38070700005)(66574015)(82960400001)(53546011)(4326008)(8936002)(26005)(2906002)(6506007)(66476007)(76116006)(8676002)(64756008)(66446008)(66946007)(41300700001)(5660300002)(83380400001)(7696005)(54906003)(186003)(38100700002)(71200400001)(55016003)(6636002)(122000001)(110136005)(478600001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3RTOHBuRk91dXR2bXJjY2ViSzk3S2lZU2dEQWo3MVFicHo1RzlBZDVrWkFj?=
 =?utf-8?B?UmZrR01LNnNNNE5sdU1Ea0IwN29tM0cxVmVUY1ZFZGYyeEdyWUV2WmJCWGpU?=
 =?utf-8?B?U25vYXBwcmc1UUd4WXFvSmp5UWh1blNGaElPZmhlN25IOHgxTEhSbjdURm5O?=
 =?utf-8?B?L3dpbWNtZ1FvZjFNSzY1dHljN0R2azg0eXJpTVBSUllZK3RqcDZWUnBqYWor?=
 =?utf-8?B?bnlza1BRSzFMbHlyMXlGUFlZaXFURFhpTXROU1hkRlJlMHhzb2xIZHhUL3U2?=
 =?utf-8?B?L3lDVHlhOTV3UkZNNHo3d3RWMGhidVZsRE1lL1hIdzQ4dlJyTGdpT1krVlo1?=
 =?utf-8?B?RFludVNBTHcxeFBrMmtNL2tFWE9Qckk3R3Z0WjI0TFdXMHR4VkhzYVVLVk9X?=
 =?utf-8?B?bGhQcHZ0S0Q0SzJXeHFhdjRhY2ZNVEdDQjdROHZRM0k3QjNRc2FYS3JLb1pL?=
 =?utf-8?B?R3EwYmpVcjRTTjhaQnA5RndyMy9neHVYUWs5UXZOS1ZicjVnTWtpYnY2ZElT?=
 =?utf-8?B?QUwvU2d6M1pwUmduSXdHRVlwdGoweEJ5RnN3eUpBcVI1VnI4K056MWpOaGVV?=
 =?utf-8?B?VnNHUWdid0d0Z3JrNUhEMkF1S2dtWmZEOXVsWmFTMnFnU0dicTZzQzZyK2l5?=
 =?utf-8?B?M0MxOEVMVE5aTGU5eHFtb2VmalM2UVNuY2ZEd2xhVHZhbEwwdjAwVGp6MVQ0?=
 =?utf-8?B?Y0tObVRFNXl2RVpweVdWZUFqZ3NQa3VZUDNPOTZuRnBPZVczR0lUaXZKZVdr?=
 =?utf-8?B?TWRtRWFuK3BMYW05eDdmYWZUSnpnWXNYTjlrRmZWakZpTGQySzFvdjVaVXpp?=
 =?utf-8?B?REhCM3hyOXVGajA1cmFJZGVYVWRteDBDanBKaUZ6OFVTc1EwUFNtMW9LSnNB?=
 =?utf-8?B?Y1ZsWTREQ0d0NGZsV0VwdTdvQTdTcWhJT280NXB6dzBPRnlDWXd4Y0lnUERE?=
 =?utf-8?B?NHNRR1lhWHV6MnZJV2M3YmFRS25DQmJ2WDdSWEZVQmdVNTFCWS9FaXh6bHRF?=
 =?utf-8?B?VU1lZWJkNVJPeCs4UTBpWVN2OUpVd2s1eTVnTzJDbjZLTUtZd0I0SHJMWVl3?=
 =?utf-8?B?SWtIbTN0aE83RjlSSlp3QkRIdDFxR3kyYVhVb0Q1eitkZFB3Rk15akRVL3h4?=
 =?utf-8?B?a1doRUVPQXZzeEEyd2JJd1NjUUZMVitwbGRsMFg0OTl5NTF1TXl1MGRJbnE1?=
 =?utf-8?B?anVRaUZCYnJaWU5lTXlDWkFwbVRMYXFUc0x6Z0V3azdsOTRtOW1RZlI1ckZP?=
 =?utf-8?B?YmdNbml1eTBSVkJBRjluWFZUdkRnSEtVY2FPZSs0T0pWMStsOXArUzUvOTZo?=
 =?utf-8?B?ckZzNENpd1ZiRFhsMHphQTkwZVdVQ1NjVEtlREpicUJZQkNhYjRYRnF3TTVL?=
 =?utf-8?B?TlgyOHAzTUtMZmwwS3JOMU82ZURIelJVbTRaYzdTaDI5NGFWOFB2aWNzcWlD?=
 =?utf-8?B?SDN3VHUrU2NnUHh2RDVUTjFmL0NzYmdHcWNWVlYzOW4rTWdGZG1xd09Xek5R?=
 =?utf-8?B?WVFyM1Z3U1FYMkh4V2JkY3BXRzF5LzR3Y3pEd0xUQVpNeTB6K0U4TWFSa1Zt?=
 =?utf-8?B?WUpueXlMK0pjSmJUdk1yUGZHTmVPazJXazBQOXNmbWRvakhoQXhVc1R5NXZv?=
 =?utf-8?B?NzhPSXZTOHpsSXNUeXVoaTE4K3lEeHNmUGZHUWxzMDBJWTVVaENHWENjcllz?=
 =?utf-8?B?TFRvMlpFcGhHMDcxaU5pb2hya2tUYWUxRUFQUHpybUdBYkxjWGJyQ3dOTU9D?=
 =?utf-8?B?Ui80UGtQUWxNcnlkd0dvdEI1S0xYdm1kTkk4dFNXK1ZUc29UTFFnYXhSVEFF?=
 =?utf-8?B?cXhXellNanVjSGJZMUlQV01LWXI3RFpLbktiUE1ubXBWcVdPZ244ajhLenp0?=
 =?utf-8?B?MTdzZFo0U2p1aGNxaFpHdDdVL0pQam1NS3BLVllHbUZNam1wdDlmWVp2SjYw?=
 =?utf-8?B?TmVJTFJtcWRYVERGSEhNWTBDTkNXN3o2emlDWk0zWUc4cS9BRlprWWduVnM0?=
 =?utf-8?B?RE14VHBCV1lyQ0hUWDlmVzlCeUtOR0xWWW5BT2s3WnhLQmhYeVNsbW8yL0tr?=
 =?utf-8?B?SllXREErc0g3ODR3VTlSY2FrV1BDWjllREVzbW0rOUJzVjdQY2pvN0lUZnlj?=
 =?utf-8?Q?myqcTeyJ2jZ/N4UZlAW+lJw6U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2911dcc9-88c4-4984-3a14-08da583f08ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 13:14:57.7631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tKAPiw0hmTg5+JhzlU5wKtgK3dwj0kJMyuGnnzwhZgv24JC6ZvBPCSxyMc1QkpcxVLH4A7stKB+OzqgLTS02Xd/Wc7Ml+CVFHlE/so21Cl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2768
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FsIEN1dHRlciBDb25s
ZXkgPGthbC5jb25sZXlAZGVjdHJpcy5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyNywgMjAy
MiAxMjo1MSBQTQ0KPiBUbzogU2Fya2FyLCBUaXJ0aGVuZHUgPHRpcnRoZW5kdS5zYXJrYXJAaW50
ZWwuY29tPg0KPiBDYzogRmlqYWxrb3dza2ksIE1hY2llaiA8bWFjaWVqLmZpamFsa293c2tpQGlu
dGVsLmNvbT47IEthcmxzc29uLCBNYWdudXMNCj4gPG1hZ251cy5rYXJsc3NvbkBpbnRlbC5jb20+
OyBlcmljQHNhZ2Uub3JnOyBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyDQo+IDxqYnJvdWVyQHJlZGhh
dC5jb20+OyBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT47IFhkcA0K
PiA8eGRwLW5ld2JpZXNAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogWERQIG11bHRp
LWJ1ZmZlciBhbmQgQUZfWERQDQo+IA0KPiBXaGF0IGFib3V0IHVzaW5nIGh1Z2UgcGFnZXMgZm9y
IHRoZSBVTUVNIGFuZCB0aGUgdW5hbGlnbmVkIGNodW5rIGZsYWcgdG8NCj4gcmVjZWl2ZSBqdW1i
byBmcmFtZXMgd2l0aCBBRl9YRFA/IExhc3QgdGltZSBJIGNoZWNrZWQgdGhpcyB3YXNuJ3QNCj4g
c3VwcG9ydGVkLiBJcyB0aGlzIHNvbWV0aGluZyB0aGF0IHdvcmtzIHRvZGF5IHdpdGhvdXQgWERQ
IG11bHRpLWJ1ZmZlcj8NCg0KU3RpbGwgZG9lcyBub3Qgd29yayBidXQgd291bGQgYmUgYSB2ZXJ5
IHdlbGNvbWUgYWRkaXRpb24gc2luY2UgaXQgaXMgZmFzdGVyIHRoYW4gbXVsdGktYnVmZmVyLiBO
b3RlIHRoYXQgdGhpcyByZXF1aXJlcyBkcml2ZXIgd29yayB0b28sIGF0IGxlYXN0IGZvciBJbnRl
bCBkcml2ZXJzLiBUaGV5IHdpbGwgc3BsaXQgYSA5SyBwYWNrZXQgaW50byAzIGZyYW1lcyBpbnN0
ZWFkIG9mIGtlZXBpbmcgaXQgaW4gb25lIHNpbmdsZSA5SyBmcmFtZSBldmVuIHRob3VnaCB0aGUg
aGFyZHdhcmUgc3VwcG9ydHMgaXQuIFRoZSB1bmFsaWduZWQgZXh0ZW5zaW9ucyB0byB0aGUgY29y
ZSBBRl9YRFAgY29kZSwgSSBiZWxpZXZlIHdvdWxkIGJlIHN0cmFpZ2h0LWZvcndhcmQgdGhvdWdo
Lg0KDQovTWFnbnVzDQoNCj4gS2FsDQo+IA0KPiANCj4gT24gTW9uLCBKdW4gMjcsIDIwMjIgYXQg
MTE6MTIgQU0gU2Fya2FyLCBUaXJ0aGVuZHUNCj4gPHRpcnRoZW5kdS5zYXJrYXJAaW50ZWwuY29t
PiB3cm90ZToNCj4gPg0KPiA+IEhpIEthbCwNCj4gPg0KPiA+IEkgaGF2ZSBiZWVuIHdvcmtpbmcg
b24gaW1wbGVtZW50aW5nIHRoZSBYRFAgbXVsdGktYnVmZmVyIGZvciBpNDBlIGJ1dCBnb3QNCj4g
c3R1Y2sgd2l0aCBwZXJmb3JtYW5jZSBpc3N1ZXMuIEkgYWxzbyBoYXZlIHRoZSBBRl9YRFAgcGF0
Y2hlcyBhbmQgbWF5IGJlDQo+IHdlIGNhbiBmb2N1cyBvbiB0aGVtIGluc3RlYWQuIFdoYXQgTklD
IGFyZSB5b3Ugd29ya2luZyBvbj8NCj4gPg0KPiA+ICsgTWFnbnVzDQo+ID4NCj4gPiBSZWdhcmRz
LA0KPiA+IFRpcnRoYQ0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogS2FsIEN1dHRlciBDb25sZXkgPGthbC5jb25sZXlAZGVjdHJpcy5jb20+DQo+ID4g
PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjIsIDIwMjIgNTo1MiBQTQ0KPiA+ID4gVG86IEZpamFs
a293c2tpLCBNYWNpZWogPG1hY2llai5maWphbGtvd3NraUBpbnRlbC5jb20+DQo+ID4gPiBDYzog
ZXJpY0BzYWdlLm9yZzsgSmVzcGVyIERhbmdhYXJkIEJyb3VlciA8amJyb3VlckByZWRoYXQuY29t
PjsgVG9rZQ0KPiA+ID4gSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUByZWRoYXQuY29tPjsgWGRw
IDx4ZHAtDQo+ID4gPiBuZXdiaWVzQHZnZXIua2VybmVsLm9yZz47IFNhcmthciwgVGlydGhlbmR1
DQo+ID4gPiA8dGlydGhlbmR1LnNhcmthckBpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTog
WERQIG11bHRpLWJ1ZmZlciBhbmQgQUZfWERQDQo+ID4gPg0KPiA+ID4gSGkgQWxsLA0KPiA+ID4g
RG9lcyBhbnlvbmUga25vdyBpZiBhbnkgcHJvZ3Jlc3MgaGFzIGJlZW4gbWFkZSB3aXRoIHJlc3Bl
Y3QgdG8NCj4gPiA+IG11bHRpLSBidWZmZXIgc3VwcG9ydCB3aXRoIEFGX1hEUD8gSSB3b3VsZCBh
bHNvIGxpa2UgdG8gaGVscC4NCj4gPiA+DQo+ID4gPiBLYWwNCj4gPiA+DQo+ID4gPiBPbiBUdWUs
IEFwciA1LCAyMDIyIGF0IDE6MTIgUE0gTWFjaWVqIEZpamFsa293c2tpDQo+ID4gPiA8bWFjaWVq
LmZpamFsa293c2tpQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IE9uIEZyaSwg
QXByIDAxLCAyMDIyIGF0IDA5OjUyOjAyQU0gLTA0MDAsIGVyaWNAc2FnZS5vcmcgd3JvdGU6DQo+
ID4gPiA+ID4gT24gRnJpLCBBcHIgMDEsIDIwMjIgYXQgMDE6MjY6MTJQTSArMDAwMCwgS2FybHNz
b24sIE1hZ251cyB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gPiBGcm9tOiBKZXNwZXIg
RGFuZ2FhcmQgQnJvdWVyIDxqYnJvdWVyQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4gPiA+IFNlbnQ6
IEZyaWRheSwgQXByaWwgMSwgMjAyMiAzOjEzIFBNDQo+ID4gPiA+ID4gPiA+IFRvOiBUb2tlIEjD
uGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT47IEthbCBDdXR0ZXINCj4gPiA+ID4g
PiA+ID4gQ29ubGV5IDxrYWwuY29ubGV5QGRlY3RyaXMuY29tPjsgWGRwDQo+ID4gPiA+ID4gPiA+
IDx4ZHAtbmV3Ymllc0B2Z2VyLmtlcm5lbC5vcmc+DQo+ID4gPiA+ID4gPiA+IENjOiBCcm91ZXIs
IEplc3BlciA8YnJvdWVyQHJlZGhhdC5jb20+OyBMb3JlbnpvIEJpYW5jb25pDQo+ID4gPiA+ID4g
PiA+IDxsb3JlbnpvLmJpYW5jb25pQHJlZGhhdC5jb20+OyBLYXJsc3NvbiwgTWFnbnVzDQo+ID4g
PiA+ID4gPiA+IDxtYWdudXMua2FybHNzb25AaW50ZWwuY29tPjsgZXJpYy5kYXZpZC5zYWdlQGdt
YWlsLmNvbQ0KPiA+ID4gPiA+ID4gPiBTdWJqZWN0OiBSZTogWERQIG11bHRpLWJ1ZmZlciBhbmQg
QUZfWERQDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IE9uIDAx
LzA0LzIwMjIgMTMuMzksIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gPiBLYWwgQ3V0dGVyIENvbmxleSA8a2FsLmNvbmxleUBkZWN0cmlzLmNvbT4gd3JpdGVz
Og0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4gPiA+Pj4g
SGksDQo+ID4gPiA+ID4gPiA+ID4+PiBXZSBhcmUgdmVyeSBpbnRlcmVzdGVkIGluIHJlY2Vpdmlu
ZyBqdW1ibyBmcmFtZXMgKD4gODAwMA0KPiA+ID4gPiA+ID4gPiA+Pj4gYnl0ZXMpIG92ZXIgQUZf
WERQLiBEb2VzIFhEUCBtdWx0aS1idWZmZXIgc3VwcG9ydA0KPiA+ID4gWERQX1JFRElSRUNUIHdp
dGggQUZfWERQPw0KPiA+ID4gPiA+ID4gPiBXaGF0DQo+ID4gPiA+ID4gPiA+ID4+PiBhYm91dCBp
biB6ZXJvLWNvcHkgbW9kZT8NCj4gPiA+ID4gPiA+ID4gPj4+DQo+ID4gPiA+ID4gPiA+ID4+PiBD
aGVlcnMsDQo+ID4gPiA+ID4gPiA+ID4+PiBLYWwNCj4gPiA+ID4gPiA+ID4gPj4NCj4gPiA+ID4g
PiA+ID4gPj4gTG9va2luZyBpbnRvIHRoaXMgbW9yZSBJIGZvdW5kIHRoaXMgY29tbWVudCBpbiB0
aGUgbWx4NSBkcml2ZXI6DQo+ID4gPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiA+ID4+IC8qIERv
bid0IGVuYWJsZSBtdWx0aSBidWZmZXIgb24gWERQX1JFRElSRUNUIFNRLCBhcyBpdCdzDQo+ID4g
PiA+ID4gPiA+ID4+IG5vdCB5ZXQNCj4gPiA+ID4gPiA+ID4gPj4gKiBzdXBwb3J0ZWQgYnkgdXBz
dHJlYW0sIGFuZCB0aGVyZSBpcyBubyBkZWZpbmVkIHRyaWdnZXINCj4gPiA+ID4gPiA+ID4gPj4g
dG8gYWxsb3cNCj4gPiA+ID4gPiA+ID4gPj4gKiB0cmFuc21pdHRpbmcgcmVkaXJlY3RlZCBtdWx0
aS1idWZmZXIgZnJhbWVzLg0KPiA+ID4gPiA+ID4gPiA+PiAqLw0KPiA+ID4gPiA+ID4gPiA+Pg0K
PiA+ID4gPiA+ID4gPiA+PiBTbyBhdCBsZWFzdCBtbHg1IGRvZXMgbm90IHlldCBzdXBwb3J0IFhE
UCBtdWx0aS1idWZmZXINCj4gPiA+ID4gPiA+ID4gPj4gd2l0aCBYRFBfUkVESVJFQ1QuIFdoYXQg
InVwc3RyZWFtIiBzdXBwb3J0IGlzIHJlcXVpcmVkIHRvDQo+ID4gPiA+ID4gPiA+ID4+IGdldA0K
PiA+ID4gPiA+ID4gPiBYRFBfUkVESVJFQ1QNCj4gPiA+ID4gPiA+ID4gPj4gdG8gd29yayB3aXRo
IFhTS3M/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBXZWxsLCB0aGUgaW5pdGlh
bCBwYXRjaCBzZXQgZm9yIG11bHRpYnVmIGV4cGxpY2l0bHkNCj4gPiA+ID4gPiA+ID4gPiBibG9j
a2VkIFhEUF9SRURJUkVDVCBiZXR3ZWVuIGludGVyZmFjZXMsIHdoaWNoIGlzIHdoYXQNCj4gPiA+
ID4gPiA+ID4gPiB0aGF0IGNvbW1lbnQgaXMgcmVmZXJyaW5nIHRvICh0aGUgVFggc2lkZSkuDQo+
ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBGb3IgQUZfWERQIHdlJ2QgYWxzbyBuZWVk
IHRvIGRlZmluZSB0aGUgVUFQSSwgYW5kIG1heWJlDQo+ID4gPiA+ID4gPiA+ID4gYWRkIGEgc29j
a2V0IGZsYWcgc28gdGhlIHVzZXJzcGFjZSBwcm9ncmFtIGNhbiBzaWduYWwgdG8NCj4gPiA+ID4g
PiA+ID4gPiB0aGUga2VybmVsIHRoYXQgaXQgdW5kZXJzdGFuZHMgaXQ/IE5vdCBzdXJlIGFib3V0
IHRoZSBkZXRhaWxzLg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gWW91J3JlIGRl
ZmluaXRlbHkgbm90IHRoZSBvbmx5IHBlcnNvbiB3aG8gd2FudHMgdGhpcywNCj4gPiA+ID4gPiA+
ID4gPiB0aG91Z2g7IGFkZGluZyBpbiBzb21lIHBlb3BsZSB3aG8gbWF5IGhhdmUgYSBiZXR0ZXIg
aWRlYQ0KPiA+ID4gPiA+ID4gPiA+IG9mIHRoZSBleGFjdA0KPiA+ID4gc3RlcHMgbmVlZGVkLg0K
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBDYy4gRXJpYyBTYWdlLCBhcyBoZSBhbHNvIGV4
cHJlc3NlZCBpbnRlcmVzdCBpbiBpbXBsZW1lbnRpbmcgdGhpcy4uLg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IEFkZGluZyBUaXJ0aGEgdGhhdCBoYXMgcGF0Y2hlcyBmb3IgdGhlIEFGX1hEUCBz
dXBwb3J0IG9mIG11bHRpLQ0KPiBidWZmZXIuDQo+ID4gPiA+ID4gPiBUaG91Z2gsIGhlIGlzIGN1
cnJlbnRseSBpbnRlZ3JhdGluZyBoaXMgaTQwZSBtdWx0aS1idWZmZXINCj4gPiA+ID4gPiA+IGRy
aXZlciBzdXBwb3J0IHdpdGggTG9yZW56bydzIFRYLXBhdGNoZXMgdGhhdCBoZSBzZW50IGFzIGFu
DQo+ID4gPiA+ID4gPiBSRkMuIExhdGVzdCBJIGhlYXJkIGlzIHRoYXQgVGlydGhhIGlzIHBsYW5u
aW5nIG9uIHN1Ym1pdHRpbmcNCj4gPiA+ID4gPiA+IHRoaXMgaW4gYSBjb3VwbGUgb2Ygd2Vla3Mg
YXMgYSBwcm9wZXIgcGF0Y2ggdG8gdGhlIG1haWxpbmcNCj4gPiA+ID4gPiA+IGxpc3QuIEFuZCBh
ZnRlciB0aGF0LCB0aGUgZm9jdXMgaXMgdG8gYnJ1c2ggdXAgdGhlIEFGX1hEUCBhbmQNCj4gPiA+
ID4gPiA+IFpDIHN1cHBvcnQgcGF0Y2hlcyBhcyB3ZSBzdG9wcGVkIHRyeWluZyB0byB0cmFjayBM
b3JlbnpvJ3MNCj4gPiA+ID4gPiA+IG11bHRpLWJ1ZmZlciBwYXRjaGVzIGF0IHZlcnNpb24gMTMg
b3V0DQo+ID4gPiBvZiAyMyA7LSkuDQo+ID4gPiA+ID4gPiBXZSBqdXN0IGNvdWxkIG5vdCBrZWVw
IHVwLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQWgsIGlmIHRoZXJlIGlzIGFueXRoaW5nIEkgY2Fu
IGRvIHRvIGhlbHAgcGxlYXNlIGxldCBtZSBrbm93LiBNeQ0KPiA+ID4gPiA+IGNvbXBhbnkgbmVl
ZHMgdGhpcyBmZWF0dXJlIHNvIEkgY2FuIHdvcmsgb24gaXQgZnVsbCB0aW1lLiBJDQo+ID4gPiA+
ID4gd291bGQgbG92ZSB0bw0KPiA+ID4gaGVscCBvdXQgaG93ZXZlciBJIGNhbi4NCj4gPiA+ID4N
Cj4gPiA+ID4gSGV5IEVyaWMhIFdlJ2xsIGtlZXAgeW91IGluIGxvb3AgaW4gdGVybXMgb2YgcHJv
Z3Jlc3MgYXJvdW5kIHRoaXMgd29yay4NCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRo
YW5rcywNCj4gPiA+ID4gPiBFcmljIFNhZ2UNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IC0t
SmVzcGVyDQo+ID4gPiA+ID4gPg0K
