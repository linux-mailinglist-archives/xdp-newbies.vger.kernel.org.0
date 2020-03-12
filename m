Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF62C182C09
	for <lists+xdp-newbies@lfdr.de>; Thu, 12 Mar 2020 10:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgCLJK2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 12 Mar 2020 05:10:28 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37218 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJK2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 12 Mar 2020 05:10:28 -0400
Received: by mail-qt1-f196.google.com with SMTP id l20so3732355qtp.4
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Mar 2020 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gXdiJGBHLzAIErF7rZJHcRsN5wioeFK99wQfoWa7zSI=;
        b=RklhgWH+NHtRUxNpW0hXckyqxeT9zFqqfkkcg+v+fYg3skMBSFD/Uuz8ew7KZE3qBK
         pPMwOQyjRO6xWXiOAZbdNJZfTKwbW/QIx79phfq9yVtQturH4L/IeYAXMKYypwAUEw+K
         jODYV722yc6dfSokVe0nIW/1tKIJjRjWmM/HvTS8ZcbsJRmYo+697FC2eGTirnP+7lT4
         un+iEFb21U05ilb7X8tXfXpKq8lye0ruHBU35qPrOqjYh5DoqHXtwuUH7cVSaHLhmE1X
         cXIeE30K7F73MNL9ooK2VdhZjw+Ft+oU95MHCOt6S9tvEQCtLMERTinPi7NSES4OOmeK
         6lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gXdiJGBHLzAIErF7rZJHcRsN5wioeFK99wQfoWa7zSI=;
        b=fxFkp8UApM3/Zk4Ok3UfChHxIb7PUmcXrdmVNjWFo+YFHTLaGPXavUnUQMfU5EdwvM
         M8bNmkG5Iq4/vB9SC+V9qp33Ofze8aWXyW83xOkGItoHMU5J7NkKmMothhH532XsTgwu
         MNB0oF0HmvDwA9QJu5nIohfPeKeshEYC5Qq5mujN7isZRcZC3h+b1oaGTTVEWE4FwpC3
         aKqdQ0eadsDJvfHW3ZcPveP7IhUmnhwIl33RFXRfyhnlTNsBtC4Re6vTNlA273le0x1X
         y1uTQLicmsnrkNCCA2jKwcYZBiotFUORFnHi9Zht7k4qOnL3H0dyRUb63dRu1pntInYI
         NHWg==
X-Gm-Message-State: ANhLgQ0+ag0fqruFy9Uir/8GI5LEuo8+VdYdcdN7bDgU/N6gS/4W+t3Q
        iJQIADPe/6cmKGGEM9UCw5Ko5KK3awSRwt/UJkc=
X-Google-Smtp-Source: ADFU+vtZg1RZLfsWmxMikTFm2O7gLDoum1R2ZlpmSVqtFucR2UUnugD6ngUAK/YSlnODhNW3ExQL8iejZ8M1nGw1dlg=
X-Received: by 2002:aed:2f01:: with SMTP id l1mr1691629qtd.37.1584004226327;
 Thu, 12 Mar 2020 02:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <fd5e40efd5c1426cb4a5942682407ea2@hm.edu> <CAJ+HfNghFctg3L=3QdeoWyqDdj4wP4EKWjYyF01=SmCO5+=32g@mail.gmail.com>
 <a80ec2c07cb9493eafabb9decf479c60@hm.edu> <CAJ+HfNjiDCdaQm_PocHXC+gHABAO67b6H+f2pf+ZdHRu2uhMVA@mail.gmail.com>
 <69569dcbc4ce450eb5b2c1905bf11208@hm.edu>
In-Reply-To: <69569dcbc4ce450eb5b2c1905bf11208@hm.edu>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Thu, 12 Mar 2020 10:10:15 +0100
Message-ID: <CAJ+HfNi5sstcz20EGq2sak0RpYdBwVO5P+NLX8cALBuG_xsnHw@mail.gmail.com>
Subject: Re: Shared Umem between processes
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 12 Mar 2020 at 09:49, Gaul, Maximilian <maximilian.gaul@hm.edu> wro=
te:
>
> Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com> wrote:
>
> >On Thu, 12 Mar 2020 at 09:20, Gaul, Maximilian <maximilian.gaul@hm.edu> =
wrote:
> >>
> >> I don't know if this reply works but I will try.
> >>
> >
> >It worked! :-)
> >
> >> On Thu, 12 Mar 2020 at 08:55, Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail=
.com> wrote:
> >> >>
> >> >> Hello everyone,
> >> >>
> >> >
> >> > Hi! I'm moving this to the XDP newbies list, which is a more proper
> >> > place for these kind of discussions!
> >> >
> >> Sure, no problem. Thank you.
> >> >>
> >> >> I am not sure if this is the correct address for my question / prob=
lem but I was forwarded to this e-mail from the libbpf github-issue section=
, so this is my excuse.
> >> >>
> >> >>
> >> >> Just a few information at the start of this e-mail: My program is l=
argely based on:   https://github.com/xdp-project/xdp-tutorial/tree/master/=
advanced03-AF_XDP and I am using libbpf: https://github.com/libbpf/libbpf
> >> >>
> >> >>
> >> >> I am currently trying to build an application that enables me to pr=
ocess multiple udp-multicast streams at once in parallel (each with up to s=
everal ten-thousands of packets per second).
> >> >>
> >> >>
> >> >> My first solution was to steer each multicast-stream on a separate =
RX-Queue on my NIC via `ethtool -N <if> flow-type udp4 ...` and to spawn as=
 much user-space processes (each with a separate AF-XDP socket connected to=
 one of the RX-Queues) as there are  streams  to process.
> >> >>
> >> >>
> >> >> But because this solution is limited to the amount of RX-Queues the=
 NIC has and I wanted to build something hardware-independent, I looked aro=
und a bit and found a feature called `XDP_SHARED_UMEM`.
> >> >>
> >>
> >> > Let's start with defining what shared-umem is: The idea is to share
> >> > the same umem, fill ring, and completion ring for multiple
> >> > sockets. The sockets sharing that umem/fr/cr are tied (bound) to one
> >> > hardware ring. It's a mechanism to load-balance a HW queue over
> >> > multiple sockets.
> >> >
> >> > If I'm reading you correctly, you'd like a solution:
> >> >
> >> >            hw_q0,
> >> > xsk_q0_0, xsk_q0_1, xsk_q0_2,
> >> >
> >> > instead of:
> >> >
> >> > hw_q0,    hw_q1,    hw_q2,
> >> > xsk_q0_0, xsk_q1_0, xsk_q2_0,
> >> >
> >> > In the first case you'll need to mux the flows in the XDP program
> >> > using an XSKMAP.
> >> >
> >> > Is this what you're trying to do?
> >> >
> >> Yes it is. But I had the problem that I couldn't create multiple socke=
ts (no sharing, everyone with its own umem and rx/tx queues) tied to the sa=
me RX-Queue. Maybe I did something wrong. But is this possible?
> >
> >No; one socket, one umem, one queue. Unless you're using shared umem,
> >then multiple sockets, one umem, one queue.
> >
> >> >>
> >> >>
> >> >> As far as I understand (please correct me if I am wrong), at the mo=
ment libbpf only supports shared umem between threads of a process but not =
between processes - right?
> >> >>
> >> >
> >> > Yes, that is correct, and for a reason! :-) Note that if you'd like =
to
> >> > do a multi-*process* setup with shared umem, you: need to have a
> >> > control process that manages the fill/completion rings, and
> >> > synchronize between the processes, OR re-mmap the fill/completetion
> >> > ring from the socket owning the umem in multiple processes *and*
> >> > synchronize the access to them. Neither is pleasant.
> >> >
> >> > Honestly, not a setup I'd recommend.
> >> >
> >> This indeed sounds very unpleasent. So instead, if I understand correc=
tly, you would go with the version above (the XDP program distributing the =
packets on the sockets via a XSKMAP). Is there something I have to watch ou=
t for? As I said, I wasn't able to  create multiple sockets for the same RX=
-Queue.
> >
> >I would probably go for the first option, without shared umem, but
> >that's really up to you! If you're going for the shared umem, I'd do
> >it single process.
> >
>
> I am sorry but I am confused, you just said *No; one socket, one umem, on=
e queue.*. How would I be able to follow your rough sketch of
>
>                     hw_q0
> xsk_q0_0, xsk_q0_1, xsk_q0_2
>
> I don't have deep knowledge about XDP and the pipeline, maybe there is so=
mething I am missing. I am sorry.
>

No worries! :-)

Above you wrote "I couldn't create multiple sockets (no sharing,
everyone with its own umem and rx/tx queues) tied to the same
RX-Queue. Maybe I did something wrong."  You can *only* tie multiple
sockets to one queue by using shared umem. You said that "everyone
with its own umem and rx/tx queues) tied to the same RX-Queue".

If you'd like to go for the setup above, you can do this with libbpf
today (have a look at the sample, where opt_num_xsks > 1). That will
however be a single process solution.

Clearer?


Bj=C3=B6rn


> >> >> I ran unto the problem, that `struct xsk_umem` is hidden in `xsk.c`=
. This prevents me from copying the content from the original socket / umem=
 into shared memory. I am not sure, what information the sub-process (the o=
ne which is using the umem from another   process) needs so I figured the s=
implest solution would be to just copy the whole umem struct.
> >> >>
> >> >
> >> > Just for completeness; To setup shared umem:
> >> >
> >> > 1. create socket 0 and register the umem to this.
> >> > 2. mmap the fr/cr using socket 0
> >> > 3. create socket 1, 2, n and refer to socket 0 for the umem.
> >> >
> >> > So, in a multiprocess solution step 3 would be done in separate
> >> > processes, and step 2 depending on your application. You'd need to
> >> > pass socket 0 to the other processes *and* share the umem memory fro=
m
> >> > the process where socket 0 was created. This is pretty much a thread=
ed
> >> > solution, given all the shared state.
> >> >
> >> > I advice not taking this path.
> >> >
> >> I am not entirely sure what you mean with *passing socket 0* is this j=
ust the fd of the socket? What's about the `struct xsk_umem`? Do I need tha=
t? I guess so because `xsk_socket__create()` has a parameter `struct xsk_um=
em`.
> >> >>
> >> >>
> >> >> So I went with the "quick-fix" to just move the definition of `stru=
ct xsk_umem` into `xsk.h` and to copy the umem-information from the origina=
l process into a shared memory. This process then calls `fork()` thus spawn=
ing a sub-process. This sub-process  then  reads the previously written ume=
m-information from shared memory and passes it into `xsk_configure_socket` =
(af_xdp_user.c) which then eventually calls `xsk_socket__create` in `xsk.c`=
. This function then checks for `umem->refcount` and sets the flags  for sh=
ared  umem accordingly.
> >> >>
> >> >>
> >> >>
> >> >> After returning from `xsk_socket__create` (we are still in `xsk_con=
figure_socket` in af_xdp_user.c), `bpf_get_link_xdp_id` is called (I don't =
know if that's necessary). But after that call I exit the function `xsk_soc=
ket__create` in the sub-process because   I figured it is probably bad to c=
onfigure the umem a second time by calling `xsk_ring_prod__reserve` after t=
hat:
> >> >>
> >> >>
> >> >>
> >> >>
> >> >> static struct xsk_socket_info *xsk_configure_socket(struct config *=
cfg, struct xsk_umem_info *umem) {
> >> >>
> >> >> struct xsk_socket_config xsk_cfg;
> >> >> struct xsk_socket_info *xsk_info;
> >> >> uint32_t idx;
> >> >> uint32_t prog_id =3D 0;
> >> >> int i;
> >> >> int ret;
> >> >>
> >> >> xsk_info =3D calloc(1, sizeof(*xsk_info));
> >> >> if (!xsk_info)
> >> >> return NULL;
> >> >>
> >> >> xsk_info->umem =3D umem;
> >> >> xsk_cfg.rx_size =3D XSK_RING_CONS__DEFAULT_NUM_DESCS;
> >> >> xsk_cfg.tx_size =3D XSK_RING_PROD__DEFAULT_NUM_DESCS;
> >> >> xsk_cfg.libbpf_flags =3D 0;
> >> >> xsk_cfg.xdp_flags =3D cfg->xdp_flags;
> >> >> xsk_cfg.bind_flags =3D cfg->xsk_bind_flags;
> >> >> ret =3D xsk_socket__create(&xsk_info->xsk, cfg->ifname, cfg->xsk_if=
_queue, umem->umem, &xsk_info->rx, &xsk_info->tx, &xsk_cfg);
> >> >>
> >> >> if (ret) {
> >> >> fprintf(stderr, "FAIL 1\n");
> >> >> goto error_exit;
> >> >> }
> >> >>
> >> >> ret =3D bpf_get_link_xdp_id(cfg->ifindex, &prog_id, cfg->xdp_flags)=
;
> >> >> if (ret) {
> >> >> fprintf(stderr, "FAIL 2\n");
> >> >> goto error_exit;
> >> >> }
> >> >>
> >> >> /* Initialize umem frame allocation */
> >> >> for (i =3D 0; i < NUM_FRAMES; i++)
> >> >> xsk_info->umem_frame_addr[i] =3D i * FRAME_SIZE;
> >> >>
> >> >> xsk_info->umem_frame_free =3D NUM_FRAMES;
> >> >>
> >> >> if(cfg->use_shrd_umem) {
> >> >> return xsk_info;
> >> >> }
> >> >>         ...
> >> >> }
> >> >>
> >> >> Somehow what I am doing doesn't work because my sub-process dies in=
 `xsk_configure_socket`. I am not able to debug it properly with GDB though=
. Another point I don't understand is the statement:
> >> >>
> >> >> However, note that you need to supply the XSK_LIBBPF_FLAGS__INHIBIT=
_PROG_LOAD libbpf_flag with the xsk_socket__create calls and load your own =
XDP program as there is no built in one in libbpf that will route the traff=
ic for you.
> >> >>
> >> >> from   https://www.kernel.org/doc/html/latest/networking/af_xdp.htm=
l#xdp-shared-umem-bind-flag
> >> >>
> >> >> I didn't know that libbpf loads a XDP-program? Why would it do that=
? I am using my own af-xdp program which filters for udp-packets. If I set =
`xsk_cfg.libbpf_flags =3D XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD;` in `xsk_con=
figure_socket`, the af-xdp-socket fd  is  not put into the kernel `xsks-map=
` which basically means that I don't receive any packets.
> >> >>
> >> >> As you probably already noticed, I am overstrained with the concept=
 of Shared Umem and I have to say, there is no documentation about it besid=
es the two sentences in   https://www.kernel.org/doc/html/latest/networking=
/af_xdp.html#xdp-shared-umem-bind-flag and a mail in a linux mailbox from N=
ov. 2019 stating that this feature is now implemented.
> >> >>
> >> >> Can you please help?
> >> >>
> >> >
> >> > XDP sockets always use an XDP program, it just that a default one is
> >> > provided if the use doesn't explicitly add one. Have a look at
> >> > tools/lib/bpf/xsk.c:xsk_load_xdp_prog. So, for shared umem you need =
to
> >> > explicitly have a program that muxes over the sockets. A na=C3=AFve =
variant
> >> > can be found in samples/bpf/xdpsock_kern.c
> >> >
> >> >
> >> > Cheers,
> >> > Bj=C3=B6rn
> >> >
> >> >> Best regards
> >> >>
> >> >> Max
> >>
