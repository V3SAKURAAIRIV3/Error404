#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 03:06:30 PM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | 0y:F9:rN:hK:UJ:K6:3p:mr:eZ:H6:6a:2B:pl:Gb:Vr:US:tf:OJ:g4:Bj:Bt:3T:9a:Um:QL:R5:2H:eW:3R:UL:4Y:XN:k9:l2:NX:iF:3e:GK:Xr:pv:5M:E6:DF:cN:ug:ZV:PT:Xd:P2:2i:ff:XE:Wm:0F:3A:Ye:qE:6O:yv:Am:VB:gR:0h:fx:5M:jt:RR:by:C9:OB:mQ:JS:co:Jo:nD:tZ:Ey:T8:tv:YR:MH:nC:Uk:jt:7y:F0:WA:yG:BG:Cd:12:DR:4r:kD:aM:GS:9s:f8:8R:qX:dc:PI:MZ:5a:ey:w1:Wa:rM:05:db:xA:vX:WL:bs:Ae:Zr:Km:im:Wc:uz:VP:g3:nP:6Q:PI:zW:Sn:AU:vn:7L:Sz:ja:c4:wV:pi:BI:UK:1a:b6:S2:lf:8g:Dh:W3:Sm:Q8:Fj:9Z:Gp:2D:vp:sW:L8:3s:Xh:ad:9g:qw:iV:HF:sy:Bs:0y:kl:Ph:Xc:YH:G3:d1:PO:lY:Sj:T2:Gs:6L:LF:9P:qD:RO:vw:2m:G4:MB:dF:gg:Gc:ru:V9:p9:xA:dd:oI:jc:Rk:AF:9U:Bm:uT:Ps:lH:EE:8y:GE:5r:F3:I3:rz:pu:Ij:M6:eA:lu:cE:rK:uq:Xw:Ys:r3:Y9:B4:q8:Q0:9d:rL:zP:Ov:B4:yL:lP:PZ:uY:QI:XD:Gv:Oc:Bd:Bj:ib:OG:H3:j1:hl:uf:9f:Ju:x0:g1:JG:Js:e0:4Y:DD:nu:oJ:1c:Py:ad:Vw:rp:Tr:uX:5I:I3:Eh:o7:4O:ce:nF:Rs:wy:mC:4z:IX:2k:vG:c9:Ut:FN:ox:Ec:Vg:sE:z1:R0:WR:jL:n8:pg:te:yW:kR:Zr:tA:ce:j2:bV:u2:co:JQ:U5:NU:2z:YU:fI:Of:cy:x9:N5:rr:PY:00:sN:ZG:ca:XP:pE:5o:ou:Av:nC:n8:8s:qB:oL:JT:fz:Ho:Sn:1i:9s:ky:yv:3P:Os:Sn:0d:Wp:GN:ri:w7:4u:Qt:VS:YQ:S6:WZ:5g:q0:z5:B5:J7:FB:hd:ea:ha:gZ:JL:4j:6m:6V:zo:qA:4K:Yf:N5:Ag:ix:tP:Ng:xS:Oj:3s:Yo:Ts:YK:x1:kE:cx:Z6:rc:oy:Pt:I8:XQ:W2:rL:EG:yS:hr:XU:XO:3y:YL:Ts:f0:sk:Bw:BT:rm:pE:dm:ta:hR:xz:GL:ol:sI:iT:ij:lS:mx:JO:Pg:AN:wI:G6:CL:NL:Qr:Y2:7z:HD:Zl:8J:Jq:no:UC:Hb:Dl:tX:F9:Dq:Ny:Bq:MD:oG:XQ:Lj:Ov:wO:eM:Ih:iv:XL:2J:H7:gT:mm:KS:s5:6W:AN:n6:t6:zg:6J:Sr:bL:Li:b8:5T:VB:40:Vf:Tq:zn:Gs:F8:KR:p8:ng:nn:TC:wG:51:sN:xv:De:rq:Z1:Fc:1c:bz:5J:ZZ:mu:lD:Xo:gT:gR:7z:Dk:xJ:s7:7G:A8 | github | 0y:F9:rN:hK:UJ:K6:3p:mr:eZ:H6:6a:2B:pl:Gb:Vr:US:tf:OJ:g4:Bj:Bt:3T:9a:Um:QL:R5:2H:eW:3R:UL:4Y:XN:k9:l2:NX:iF:3e:GK:Xr:pv:5M:E6:DF:cN:ug:ZV:PT:Xd:P2:2i:ff:XE:Wm:0F:3A:Ye:qE:6O:yv:Am:VB:gR:0h:fx:5M:jt:RR:by:C9:OB:mQ:JS:co:Jo:nD:tZ:Ey:T8:tv:YR:MH:nC:Uk:jt:7y:F0:WA:yG:BG:Cd:12:DR:4r:kD:aM:GS:9s:f8:8R:qX:dc:PI:MZ:5a:ey:w1:Wa:rM:05:db:xA:vX:WL:bs:Ae:Zr:Km:im:Wc:uz:VP:g3:nP:6Q:PI:zW:Sn:AU:vn:7L:Sz:ja:c4:wV:pi:BI:UK:1a:b6:S2:lf:8g:Dh:W3:Sm:Q8:Fj:9Z:Gp:2D:vp:sW:L8:3s:Xh:ad:9g:qw:iV:HF:sy:Bs:0y:kl:Ph:Xc:YH:G3:d1:PO:lY:Sj:T2:Gs:6L:LF:9P:qD:RO:vw:2m:G4:MB:dF:gg:Gc:ru:V9:p9:xA:dd:oI:jc:Rk:AF:9U:Bm:uT:Ps:lH:EE:8y:GE:5r:F3:I3:rz:pu:Ij:M6:eA:lu:cE:rK:uq:Xw:Ys:r3:Y9:B4:q8:Q0:9d:rL:zP:Ov:B4:yL:lP:PZ:uY:QI:XD:Gv:Oc:Bd:Bj:ib:OG:H3:j1:hl:uf:9f:Ju:x0:g1:JG:Js:e0:4Y:DD:nu:oJ:1c:Py:ad:Vw:rp:Tr:uX:5I:I3:Eh:o7:4O:ce:nF:Rs:wy:mC:4z:IX:2k:vG:c9:Ut:FN:ox:Ec:Vg:sE:z1:R0:WR:jL:n8:pg:te:yW:kR:Zr:tA:ce:j2:bV:u2:co:JQ:U5:NU:2z:YU:fI:Of:cy:x9:N5:rr:PY:00:sN:ZG:ca:XP:pE:5o:ou:Av:nC:n8:8s:qB:oL:JT:fz:Ho:Sn:1i:9s:ky:yv:3P:Os:Sn:0d:Wp:GN:ri:w7:4u:Qt:VS:YQ:S6:WZ:5g:q0:z5:B5:J7:FB:hd:ea:ha:gZ:JL:4j:6m:6V:zo:qA:4K:Yf:N5:Ag:ix:tP:Ng:xS:Oj:3s:Yo:Ts:YK:x1:kE:cx:Z6:rc:oy:Pt:I8:XQ:W2:rL:EG:yS:hr:XU:XO:3y:YL:Ts:f0:sk:Bw:BT:rm:pE:dm:ta:hR:xz:GL:ol:sI:iT:ij:lS:mx:JO:Pg:AN:wI:G6:CL:NL:Qr:Y2:7z:HD:Zl:8J:Jq:no:UC:Hb:Dl:tX:F9:Dq:Ny:Bq:MD:oG:XQ:Lj:Ov:wO:eM:Ih:iv:XL:2J:H7:gT:mm:KS:s5:6W:AN:n6:t6:zg:6J:Sr:bL:Li:b8:5T:VB:40:Vf:Tq:zn:Gs:F8:KR:p8:ng:nn:TC:wG:51:sN:xv:De:rq:Z1:Fc:1c:bz:5J:ZZ:mu:lD:Xo:gT:gR:7z:Dk:xJ:s7:7G:A8 | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	T�Z�������mB!�-/�����}�(51^YK�9*3����U��SR�^9�X��([|�Tc�fbW�;�����?^���|�A��	z��������\�{9虰�-脠Y�z�r�䦥�wR|3�a=؄!����b)~��$q�`�6kc=�r�,c^���.�܃B���k"2�y�2��gB-���1���3��E_���"�6���� O����p`@@�)���^��э��I:+y�*�HbC96�}��
����gT9��~��������/��%X3�{�$����Ԥz�|yփd���;���[u �ݧ9��&V��R-!��NB)f��3���O��v/�@����O�cL/�x�+��_��٬�s��3vtIZ��8�>����ጃT�.x���\A.a�rC��&������@��0%�:��V"ٟ[�S(MTe�b0��N�Ĝ���E���j
� �K�:Py]'�wR���[/�6q[�6]J���8Б�_
qn�l�
�Pz���*�0y6��f�v���c�e������'����э��<K��F��%��_Gi������J��_���>�|	v�{��¿'d���XcJYO�OI���6nj}�S���ӡ{p��n�t�����nݏ,��b�*��uF�����m��e��U�Ck5�+�"�0TI��_���|=�Q����V"���d7ϟ�ޏ��\m�E
9Ĝ�W����7eR����Γ�Q�AQ�r���sy@�O�c����Ԓ�(����g�^��	��n�򾠭h����dB��r��L���2){U�1�!l@��Z�SM`1���ƴ�]'�#ӱTF����K=r�&��}�Df�t�����������̋j5��	"���u)���_ؔ�vѣ������}g�Q��=t鸓����p���-j�Q>�����K+��mt�J��&v�I'���Fze Ғx�ȝ�`ji>�yV!�K5��N)_�0Y��!��r�}H����=�����=G	�8:���7	Ҳ�s�u`k/�ȭ7fڝ�'�NV���뀁jЩ;��3�V$4��b���h2������R���k,=Y�06��"(/B�i����=��]����ɧ?�����s�NX�Ď��*u;Us��F;�� �@�lh�DW�1C��r��id�S*�x듺�U�[�ϙ�=`�y�d�V�]CO9'i93��8���	K�	��J�^8Ͽ����e��Y���+�-ƥ�/U��ERz�������w�/������]Zuʑ0�b�"����K�#�q$�ƿҙ����R!3�E��6LA9.�N�����1���(�5D�6,41-	U qX̣����������&�ַ�[����G��A����1�2��ˋ�"%��*��B�Q%!����{8����[��]��@���]���!�o�:O3����(�x�`f��y�	�[+c��1/���Cn����k#��/�������	��<�8�f�qZ7:�����\Nr����qk����
,籀�'�Q���:�]l���� LZ�͘���|���"h�=��ۘc�}�U��Ĩ�����W�Ӆ"���a�R S�"���$���7m�BG ���%am��#l��p�[��!\*7����p���R�{^����k�m0���π�F���|�o��B5s�VE���A7$ܠ���1Y{���c����p��,�/���Y���;N
c����C���M+%Xٵ�29X��p��ꇇ�{����`K��U'(A�z��d�0���ĢtR���Dt���"���B�{v
�#����L9N��W*2@mȋ[��K�W��XI��Qſ�G�d3B��o�Q=��1�2çE	��>��̢�kpT��*��[p��-��p;��y�Jv�p�2b]����Áo�c���Ӓ��!>@��@��U��K>Z>�������͚�|��s�5c�.�}|� ��������6�M$�z������]r\	;U�L����C:*9tM����?����l��3�l�
N��IC�]����4�S嫍�3��,VX���c��z%o���tVp�xa�Yz㞼q\ �v����R�]́#M�6�bߪr"_tB��� ���{���8B��?K�Q����S����a{��PD��)��\4�&��	א.��.:�["+-o�>+�L��Rפ�r]��6i��˦a��`��.�PC�?����M���y�x8D��Z�������V�oJp\h�x���_LL4}Ȕ��/�qS�����f�u�����
�8B��!�Ph~�gyq�x+�
�Yi�y������@���	[�9z�O��t�˫�2�qgftg�"W؍�XmX"��(��&�;��J�T7E�MW�p��Z��p���5��\t&%;d����d�I|G�[֙��5�F�[�#-��M�T|��0�ĉ��?�O�Z�xx�U��aw��ݫ(�4�7���+����4Q��"d}�Έ~���I(K�Kv�u2�,��@B���j��k�m��I�
��8<Ŗ�q!R{T��)�ވ:�'ZJ5�}�	�εs���Q{�u2	�U����`��
b!р舷Pu�_GK�P[A{Ii%X:p���s���s�}�I����_W<��Y��q@��!��1�,ul��<u-��է3��2�oNw�A��Sj
�~*�����t0����v��F����`��ġ��j�:^c�n�Jz'ߜ/����tbڒ���d�$�_�߇�`<m>����i;-��'9}R5I�=�!Ѐz��cW���3VJ�,1h3f��� ��wU����>P�v�[