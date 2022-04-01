Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256164EEEAE
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Apr 2022 15:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346612AbiDAOBM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 1 Apr 2022 10:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346611AbiDAOBL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 1 Apr 2022 10:01:11 -0400
X-Greylist: delayed 434 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Apr 2022 06:59:21 PDT
Received: from st43p00im-zteg10073401.me.com (st43p00im-zteg10073401.me.com [17.58.63.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC5152B34
        for <xdp-newbies@vger.kernel.org>; Fri,  1 Apr 2022 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sage.org; s=sig1;
        t=1648821126; bh=UJCTConiek+Y2mHwZU46cXj9x11XNMoNzXcoqEjiEck=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=eO5TIoYPqhFfTjWYwuIMFUtOcmq/Fbb1WFfdl2WNarLDg35hj7IgSr4WtbNzYI0EU
         516f/P0U1U0teKkLfY318gflE+/I/yBMmM6UePVtfN91tPl4eYbkySkd5E1zGdYI3m
         rkwNo+I9Ck/C36TfP2y/1gf4adZWxurRnkD5TOMaLqYcVxbMX1YG0piMerAgG5gpy6
         3nyK3vf6A/TvCUYyl8oGnA2g0z6AuJnug3B9O9w/mqIov+Wb/sAtmh1hhJ5JAR8xjF
         iPYbecj7UQhtp7h4s2UCCsnjetgz0q3uzuwobNMCTKGJTrUjapzAscK8YeFAH/Jroj
         E6JPFvUM4TQFA==
Received: from sage-macbook-pro.local (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
        by st43p00im-zteg10073401.me.com (Postfix) with ESMTPSA id 90A6CA813A3;
        Fri,  1 Apr 2022 13:52:05 +0000 (UTC)
Date:   Fri, 1 Apr 2022 09:52:02 -0400
From:   "eric@sage.org" <eric@sage.org>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
        Kal Cutter Conley <kal.conley@dectris.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
Subject: Re: XDP multi-buffer and AF_XDP
Message-ID: <YkcDgmldUGWoFWmQ@sage-macbook-pro.local>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk>
 <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
 <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.850
 definitions=2022-04-01_05:2022-03-30,2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1030 mlxscore=0
 mlxlogscore=638 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2204010064
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 01, 2022 at 01:26:12PM +0000, Karlsson, Magnus wrote:
> 
> 
> > -----Original Message-----
> > From: Jesper Dangaard Brouer <jbrouer@redhat.com>
> > Sent: Friday, April 1, 2022 3:13 PM
> > To: Toke Høiland-Jørgensen <toke@redhat.com>; Kal Cutter Conley
> > <kal.conley@dectris.com>; Xdp <xdp-newbies@vger.kernel.org>
> > Cc: Brouer, Jesper <brouer@redhat.com>; Lorenzo Bianconi
> > <lorenzo.bianconi@redhat.com>; Karlsson, Magnus
> > <magnus.karlsson@intel.com>; eric.david.sage@gmail.com
> > Subject: Re: XDP multi-buffer and AF_XDP
> > 
> > 
> > On 01/04/2022 13.39, Toke Høiland-Jørgensen wrote:
> > > Kal Cutter Conley <kal.conley@dectris.com> writes:
> > >
> > >>>
> > >>> Hi,
> > >>> We are very interested in receiving jumbo frames (> 8000 bytes) over
> > >>> AF_XDP. Does XDP multi-buffer support XDP_REDIRECT with AF_XDP?
> > What
> > >>> about in zero-copy mode?
> > >>>
> > >>> Cheers,
> > >>> Kal
> > >>
> > >> Looking into this more I found this comment in the mlx5 driver:
> > >>
> > >> /* Don't enable multi buffer on XDP_REDIRECT SQ, as it's not yet
> > >> * supported by upstream, and there is no defined trigger to allow
> > >> * transmitting redirected multi-buffer frames.
> > >> */
> > >>
> > >> So at least mlx5 does not yet support XDP multi-buffer with
> > >> XDP_REDIRECT. What "upstream" support is required to get
> > XDP_REDIRECT
> > >> to work with XSKs?
> > >
> > > Well, the initial patch set for multibuf explicitly blocked
> > > XDP_REDIRECT between interfaces, which is what that comment is
> > > referring to (the TX side).
> > >
> > > For AF_XDP we'd also need to define the UAPI, and maybe add a socket
> > > flag so the userspace program can signal to the kernel that it
> > > understands it? Not sure about the details.
> > >
> > > You're definitely not the only person who wants this, though; adding
> > > in some people who may have a better idea of the exact steps needed.
> > 
> > Cc. Eric Sage, as he also expressed interest in implementing this...
> 
> Adding Tirtha that has patches for the AF_XDP support of multi-buffer. Though, he is currently integrating his i40e multi-buffer driver support with Lorenzo's TX-patches that he sent as an RFC. Latest I heard is that Tirtha is planning on submitting this in a couple of weeks as a proper patch to the mailing list. And after that, the focus is to brush up the AF_XDP and ZC support patches as we stopped trying to track Lorenzo's multi-buffer patches at version 13 out of 23 ;-). We just could not keep up.

Ah, if there is anything I can do to help please let me know. My company needs this
feature so I can work on it full time. I would love to help out however I can.

Thanks,
Eric Sage
> 
> > --Jesper
> 
