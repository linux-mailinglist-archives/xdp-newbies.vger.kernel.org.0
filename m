Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6C2475757
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Dec 2021 12:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbhLOLHu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Dec 2021 06:07:50 -0500
Received: from mga07.intel.com ([134.134.136.100]:54654 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233002AbhLOLHu (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Dec 2021 06:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639566469; x=1671102469;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qt24APDMTKmTOxHRnh+Lt+pT6L336AZ7ntlNNHc93tE=;
  b=KzhaKhgP25Crub4vuW6KeR2R8VafSGaU/P7KTOGhjinwrR/zE8T4UteA
   Q1sWDPdp2FZ7gEp2sFhBkdwBe9XK0k0NjBn1laPC2r5UZEpRiaR1Ngb3I
   UndrjFUYUGSKtmlijTAJHZTcLnT+8v4khk2UOduvtj1CLrK6qopyodr//
   Bi5NH8hEJSLI6G765TUNqppSXri6zsFLp8ODdIYDc6h+VmJbueCqGuLIw
   J2ZW0erTX86MrfxusYJ62aDKs5CC16P/FAG2YLrm1BURgaviEj84M/gkt
   06jjCTJs4jiWlh3hzBnpy13dqYjfxBW5w+UWrYZPtjJmtCOfoTvTihgri
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="302577576"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="302577576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 03:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="682451740"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2021 03:07:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 03:07:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 15 Dec 2021 03:07:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 15 Dec 2021 03:07:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjeFDVof2KSX/a5r0m0CYL/dljNFgNjXoYrIbHMUgFtRIdftxsyH2gJcmNhanNjfRq6sYc6daNcLAcrzA75S70fK4tERYOUmSP+8W4AHsOMRBxYOs/DJmWjynuuU6T13tMaL3Sgj0FuWEdLy0JLuCZXNADh1w0ZH06pMYJB5TKgVL+PZdnnkQP/LQ309rldZyMPadDQHe8ZCiNhMVy/Rfxdc3H48O2JmfzyvIH1sXrdMzLp7MK2Wfbeb8Y3aqcQJWr9RkaGLfIA2ho75IgNCd2dijKTSfhouVh7+hvrGTgI9AwJfOdQ9SrY7ZNAMDTCZm6/PD+6ir97tkm42N4c/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt24APDMTKmTOxHRnh+Lt+pT6L336AZ7ntlNNHc93tE=;
 b=jwHuI5ItbMcTs2mnh/B03aLFV0Loz7reIsVo9u69hg0q/kMePIcwlcNMzEsLnmWwWwrlphwtR4se2Q71EwompSvxFbFy+zyNcIbvJDXJXzXmOmQRymHqNVocsn5vqxgB+HbTGbzTtoA3zEnmox8KuRi+eh0dpVHNPTeQXZBFEUpuLvem9MZazW1tTrzCLwRdnSTZyaMHRzCCAK4e9mrxD70vsd1FKF8OQSl8ZpBT6QIvzkv1TrD6ekluJ/7cs0NhT8Mp1oLSVS9lPkesBMUq84zEHoqexAet14cJyia0cCKTuNBL7rgYmnq7K6C+DzcmR80C9uHYmCtvCtKQ872ALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Wed, 15 Dec
 2021 11:07:23 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e%3]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 11:07:23 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
CC:     "Brouer, Jesper" <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: RE: AF_XDP not transmitting frames immediately
Thread-Topic: AF_XDP not transmitting frames immediately
Thread-Index: AQHX8GUHNSZY1C3+jUCqvu6qhHX+16wxn+nQgAG5WACAAAyfYA==
Date:   Wed, 15 Dec 2021 11:07:23 +0000
Message-ID: <MW3PR11MB460208C3A86CF7D4B9B2E1C3F7769@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <9e18a444-e30f-4ae8-4e3b-af5e9393e971@redhat.com>
In-Reply-To: <9e18a444-e30f-4ae8-4e3b-af5e9393e971@redhat.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjhjNzIwMzItM2E2OC00YTc0LTg3YTItYzAzYTQ3OWRjZjVkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUWhNaVRtNW82Vlpjc0ZoNFNWMGo1Yk9hdTdadHRmazZaaHpKN29ScTliUVZBWmJYTzhaTmJPMFlqV0FEUkNLNiJ9
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-ctpclassification: CTP_NT
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7fbdffe-fc35-4bd8-c78f-08d9bfbb1227
x-ms-traffictypediagnostic: CO1PR11MB4867:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB4867009E1537226D9E426917F7769@CO1PR11MB4867.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9gK8w6ZYRWyRog5hd0aStpsGwjKDfJ1J5v2EXFuRtsjkXsY54W1lo8zW/S3twXQ8db/sGn7BRsELXh+5MFJgi+Zri68A+xRZv/Utc2NILMzj98/mI92kges8Xq61zgxUmtoQWxsNio2AFH0ZBexuu31asCXCT9AP8bc0MS6HWZZ08lot8nAeGzZzI4YL36udw5J5VK6EZoNtOcgkYRXA2i9Wp3V97tmNRTxUvX4++gwuVJSmVfQ69oj7RGnh4DIBJ6jw71HWqZkfOcaFM1PU8CRGsFrvfJvD4qVfR45EbiowzmbsrwpRfK949OCPCMXOKXAlz8eoBw4/vKCRcbddgKXN5iMU7U0XUL3bT1GNCKljztCze19Dv6B9yOwtgdOD3BUjJZ8j4aNhGz2SlRr9aG1DyW73WZT76voBV5iwfCe+nWqHpJPBFjLl9zCNZEdDXYzoEjEQDVH4+TBZQ/rqwBffb8U7qhBr8JsGxPhnLPzl+D6iCgtIrg5MkVQKvbM21C9yF4+1CJkwom5RrrZ7eTLpft9Yms7fw3IvpEeV2DsNeRK7CIox7zh5QVzJ7z5+SCNuhJF8GqF0hwmwpppo3qO52oGLIGFXMkTwaoErUKkZtgjCSnizgicfX58DOJyOL9sl/lz++YlDYnrCK2F4N5kiEOMYQx+hUq0uoI2SboI623CKUNNgCQldnejwIVAfzB7lbCkDcbhVfXF95ePUCJ6Uk0KmAYpgQlu1dz3TJghluvanee9RHW9vJnVWk1A9Vu9PqblAsq2Qnapqgwqx1r6rXrPosmkRoJym3dTG/y9+yTjPToEfwKx2osL4p1VF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(66476007)(8676002)(52536014)(54906003)(66446008)(2906002)(508600001)(8936002)(38070700005)(53546011)(5660300002)(26005)(71200400001)(55016003)(316002)(82960400001)(66946007)(7696005)(110136005)(66574015)(122000001)(186003)(4326008)(38100700002)(64756008)(33656002)(66556008)(76116006)(966005)(9686003)(6506007)(86362001)(14773001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amZ6YVpZRnFoK0xZbExvMnhQdytzZy9TOWU4MkJiOExLZ2RnTTB1dHc5SUxJ?=
 =?utf-8?B?MU1pQWY2WlVmZFZJdXZOSjNiU3VvNzhyNjIxUGNrNyszc0RpQnFPRGMvWmxl?=
 =?utf-8?B?T1FnWm9HTFFDS0pOY1ZkdG5iSVBlT0tuNUtETHNoWmY0QVdkV3lITldRV0pI?=
 =?utf-8?B?R0lZUTEvSnZFeExOYy9oTS9QRkNSRGExaDgxMTkxZmMraEN4WHYwb0lsLzhz?=
 =?utf-8?B?RlpjM3A0aFc2VVZOdUxLc0hjVExldHd0VGJ1V3EycmJEcHdvU0NtbWJJSzhu?=
 =?utf-8?B?SHRwdlhldEdQTmRuVXpkMGdEQVoxSVhWZ0R5dXFpWkhTMzJFbko0d1YzdTJC?=
 =?utf-8?B?K0ZWOVRTemYveloxeWNsTm9XVm10TmtEeWlDUGdidFdCZVhFTS9aY0dNUVI1?=
 =?utf-8?B?TXRZbjdOS1kydytya3liZHM2SmxTWDE2Mm9yODJBZVRtUXAyOEdzWmxKaXRC?=
 =?utf-8?B?b3FCbTFmK0ljZ0JDREFRWmlhOGJYWmRNVkg2eU4zcVRINU53ZFdQNmN2d2c1?=
 =?utf-8?B?alpZU2JhZ0ZOMGZxaS96bHV2dFlWcVdqUjgrNDV2NEFNclkzclFRMWhBb3FS?=
 =?utf-8?B?cnRnNVRHNTBuR282SEdOZGhJTnpoTFFwRUNxcmJsaUEvOTFwL0VLY0ZIMWdI?=
 =?utf-8?B?T3JQeEN3UzRXRFVDd0RNaVMyQkhwNWxNT0sxTk5mdDNPOHRnS2g1NlEyci85?=
 =?utf-8?B?TWlmUUZrOGl5Z0JDbnVCUDV6TlBlNURNaG5ha2FNRlVKSWZ5RjhFdklBY2VY?=
 =?utf-8?B?bThjclRJSFFEVWVNWnA4V3JwT2R1MW9Qcmw3QVBaZ1dxZ2NqbzdhWEZGY2w3?=
 =?utf-8?B?NVRNMTBtaUMxZ0ZSeGlxMGF6UEd2clB3L2hqREM5b2lZSFBPa3hhb1E5ZlBw?=
 =?utf-8?B?bjB4NGRZWWExN0JmZk5OcXE4OVYyY2hsODB4V2tnSmVpVTFjdU9TSHdmSXFy?=
 =?utf-8?B?TUhqZnRzMjY4L2tKb1lQanlWbkxxNDQzMDh0WnJBU012aS8yOFJzMTVhckNs?=
 =?utf-8?B?OFZ1azlWZWZZR0ZiN2JKNTlEdk1PaXNjTnNZUCtqcGNFMGZ0SmQ0V0xicDlT?=
 =?utf-8?B?OWNBYjRxcmxiZGw5bTc5cG1QOTRYdUtSWHRraGpPbk1BTUFwU3BxZVdtVERG?=
 =?utf-8?B?ejRGVkNRZHpiSGROSENNbDNtcnlPTGlVQ3lXRVdVeDF3YUVpTkhyRXBkN2Ry?=
 =?utf-8?B?ZElLa2ZoL3BBaTdlZk5BT0dJVEdLZm43L09POW4yNGVlQjZHY2xsV2tuSnpD?=
 =?utf-8?B?azdZZEEyOXFqNTR5Vk5mZFhJZVZ5NWlpZW1CbHdSbm9VZnQyYTllSzBBRXZX?=
 =?utf-8?B?SHRjSTdvUFVvWHEwWVkvaXJFSXhTWTd6WFozYnZHNnN6Rk8rMCtWNUhYSzkx?=
 =?utf-8?B?eE1yTGVuTDNUTWZvZEw3NTdLenBkTHVqeG14Mk5lMUhPSVFoVkdaQXJ4S3Uw?=
 =?utf-8?B?OG5hTURQbzZUeUtYNVFTbWVJNEhyNDRkcWVZeWZWM3hwb3JsZ1NNK2FxZUFF?=
 =?utf-8?B?YmJzdm55Sk42bDhXV3pxUkIxdWEwUlppK3p0cVg4UGUyUnZpUWx4Zk1DVEF6?=
 =?utf-8?B?VmZNUVMxOEZ6QmtTNE45Z010RnZOUjdpT3VhbmdreXhCU2lEVzZhelIvTEYv?=
 =?utf-8?B?Q29SbUhHbUhHS0JCSUtCcm1SdUplaFRvd1drTnlsVGUzS2VMOEtHOHFZdHFE?=
 =?utf-8?B?NEJ6M1dNQ1pCekNqWnBVV2hkN3puSEZHbmdnTUxnMGU4WnhZUHRoUXF3Tm5B?=
 =?utf-8?B?clN5Qld0VG1uQkRQaW5QVWQwY2dLRkZpdGd1enZaNyttNXJPY1FKS0hpNnB5?=
 =?utf-8?B?UUoyU3dGeVpVNjJBNGlvTzlGSTlEbWNxRTIxZXNDREIwSVVYL1BtdDFNK1ZQ?=
 =?utf-8?B?UklBZU40MHg0czZQVjJZYlJlVUc0Q1RleG1yS3YzYUlQKzg4WEFEaWp1V1Nr?=
 =?utf-8?B?TWpYd1JiUEN3UzEraW1tMDJwTzFqQkNIRXdZdFFaZlFSYUFYK05IWGdZb1JS?=
 =?utf-8?B?MGh5SDZkOUFXbTBGL1p1ZW9ScWtiRHh1UWNsMWpiK3cxME92eXhRdUswaEhw?=
 =?utf-8?B?aGI3TDA4cjhFc2hKU3BLSUZRS1dPYXFRSHB0cEhWVGFlTGorNHBmOHRLblR6?=
 =?utf-8?B?NXBzZjdsR3JPZk5CR2kzYmdBbGdyVjN4MzU5ZE04UlpWVEdrN0svSERBc0xy?=
 =?utf-8?B?V3ZuWitlbGx2Z052UkpKeXZndXo5M2xZdSs0MFJxeW13emtON1I2TUdRQlNq?=
 =?utf-8?B?T0EzVmZ1UGtIQVNxRnN4V0IxK0t3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fbdffe-fc35-4bd8-c78f-08d9bfbb1227
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 11:07:23.3315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmaTwOF33XOmgYHpsznEIqiONv3DmHYosaD0RTJJnySnM744G0R+H7zwVvJhzAnhrTU9XEd1ozEqEZfVTSTLp+pfYDb6DoxS9DkW0jBFIEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4867
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmVzcGVyIERhbmdhYXJk
IEJyb3VlciA8amJyb3VlckByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVy
IDE1LCAyMDIxIDExOjE4IEFNDQo+IFRvOiBLYXJsc3NvbiwgTWFnbnVzIDxtYWdudXMua2FybHNz
b25AaW50ZWwuY29tPjsgSmVzcGVyIERhbmdhYXJkDQo+IEJyb3VlciA8amJyb3VlckByZWRoYXQu
Y29tPjsgQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4NCj4gQ2M6IEJyb3VlciwgSmVz
cGVyIDxicm91ZXJAcmVkaGF0LmNvbT47IFhkcCA8eGRwLQ0KPiBuZXdiaWVzQHZnZXIua2VybmVs
Lm9yZz47IE9uZywgQm9vbiBMZW9uZyA8Ym9vbi5sZW9uZy5vbmdAaW50ZWwuY29tPjsNCj4gSm9h
byBQZWRybyBCYXJyb3MgU2lsdmEgPGpvcGJzQHZlc3Rhcy5jb20+OyBEaW9nbyBBbGV4YW5kcmUg
RGEgU2lsdmEgTGltYQ0KPiA8ZGlvbGlAdmVzdGFzLmNvbT4NCj4gU3ViamVjdDogUmU6IEFGX1hE
UCBub3QgdHJhbnNtaXR0aW5nIGZyYW1lcyBpbW1lZGlhdGVseQ0KPiANCj4gDQo+IA0KPiBPbiAx
NC8xMi8yMDIxIDA5LjA3LCBLYXJsc3NvbiwgTWFnbnVzIHdyb3RlOg0KPiA+DQo+ID4+DQo+ID4+
IEknbSBjb2Rpbmcgb24gYW4gQUZfWERQIHByb2dyYW1bMV0gdGhhdCBuZWVkIHRvIHNlbmQgKGEg
YnVsayBvZg0KPiA+PiBwYWNrZXRzKSBpbiBhIHNob3J0IHRpbWUtd2luZG93IChyZWxhdGVkIHRv
IFRpbWUtVHJpZ2dlcmVkIEV0aGVybmV0KS4NCj4gPj4NCj4gWy4uLl0NCj4gPg0KPiA+PiBIb3cg
Y2FuIEkgZ2V0IEFGX1hEUCB0byAiZmx1c2giIFRYIHBhY2tldHMgd2hlbiBjYWxsaW5nIHNlbmR0
bygpPw0KPiA+PiBTaG91bGQgd2UgYWRkIGFub3RoZXIgZmxhZyB0aGFuIHRoZSBjdXJyZW50IE1T
R19ET05UV0FJVD8NCj4gPg0KPiA+IEluIHplcm8tY29weSBtb2RlIHdpdGggc29mdGlycSBkcml2
ZXIgcHJvY2Vzc2luZyAobm90IGJ1c3kgcG9sbCksIGENCj4gPiBzZW5kdG8gd2lsbCBqdXN0IHRy
aWdnZXIgdGhlIHhza193YWtldXAgbmRvIHRoYXQgc2NoZWR1bGVzIG5hcGkgdW5sZXNzDQo+ID4g
aXQgaXMgYWxyZWFkeSBleGVjdXRpbmcuIEl0IGlzIHVwIHRvIHRoZSBkcml2ZXIgdG8gdGhlbiBn
ZXQgcGFja2V0cw0KPiA+IGZyb20gdGhlIFR4IHJpbmcgYW5kIHB1dCB0aGVtIG9uIHRoZSBIVyBh
bmQgbWFrZSBzdXJlIHRoZXkgYXJlIHNlbnQuDQo+ID4gQmFycmluZyBhbnkgSFcgcXVpcmtzLCBz
ZW5kaW5nIG9uZSBwYWNrZXRzIHNob3VsZCBiZSBwZXJmZWN0bHkgZmluZS4NCj4gDQo+IFRoaXMg
YWN0dWFsbHkgZG9lc24ndCBzb3VuZCBzbyBnb29kIGZyb20gbXkgY3VzdG9tZXJzIHVzZS1jYXNl
IFBvVi4NCj4gVGhhdCB3ZSBvbmx5IHRyaWdnZXIgYSBuZG9feHNrX3dha2V1cCB0aGF0IHNjaGVk
dWxlcyBuYXBpLg0KPiANCj4gV2Ugd2FudCB0byB0cmlnZ2VyIEhXIHRyYW5zbWlzc2lvbiBpbW1l
ZGlhdGVseS4NCj4gQ2FuIHdlIGFjaGlldmUgdGhpcyB2aWEgdXNpbmcgYnVzeS1wb2xsIG1vZGU/
DQoNClllcywgYnV0IG5vdCB3aXRob3V0IG5hcGkuIFRoZSBuYXBpIGNvbnRleHQgd2lsbCBpbiB0
aGlzIGNhc2UgYmUgZXhlY3V0ZWQgaW4gcHJvY2VzcyBjb250ZXh0IHJpZ2h0IGF3YXksIHVubGVz
cyBpdCBpcyBhbHJlYWR5IHJ1bm5pbmcgc29tZXdoZXJlIGVsc2UgYnV0IHRoYXQgc2hvdWxkIG5v
dCBiZSB0aGUgY2FzZS4gV2lsbCB0aGlzIGJlIGdvb2QgZW5vdWdoPw0KDQo+IA0KPiA+PiBIaW50
LCBJJ20gdXNpbmcgdGNwZHVtcCBoYXJkd2FyZSB0aW1lc3RhbXBpbmcgb24gcmVjZWl2aW5nIGhp
c3QgdmlhDQo+ID4+IGNtZGxpbmU6DQo+ID4+DQo+ID4+IHRjcGR1bXAgLXZ2IC1zMCAtbmkgZXRo
MSAtaiBhZGFwdGVyX3Vuc3luY2VkDQo+ID4+IC0tdGltZS1zdGFtcC1wcmVjaXNpb249bmFubyAt
dyBhZl94ZHBfdHhfY3ljbGljLmR1bXA0Mg0KPiA+Pg0KPiA+PiBOb3RpY2VbMV0gb24gc3BlY2lm
aWMgYnJhbmNoOiBbMV0NCj4gPj4gaHR0cHM6Ly9naXRodWIuY29tL3hkcC1wcm9qZWN0L2JwZi0N
Cj4gZXhhbXBsZXMvdHJlZS92ZXN0YXMwM19BRl9YRFBfZXhhbQ0KPiA+PiBwbGUvQUZfWERQLWlu
dGVyYWN0aW9uDQoNCg==
