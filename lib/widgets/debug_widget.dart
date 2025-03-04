import 'package:aurora_navigator/misc/polyline_decoder.dart';
import 'package:flutter/material.dart';

class DebugWidget extends StatelessWidget {
  const DebugWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {
              final polylineStr = "ydqliBeqcrfA_KyO_AyA{EsHv^aeA~FkPl[g_Ad[q~@nO}d@bt@stBtM}_@`CiHvUmr@zAsF\\yEBcEKyDg@sDgAcDgKyPaBsA_Bc@iBEuBj@oBjBoDhFuOhf@mWlu@kCzH}d@`tA}f@fxAwTlo@mk@`bBuU|q@sKh[uCnIcAtCoGlTwTzu@aDlJm}@xoC{Ujq@{Off@iNza@yGpUuFxQoHv]wGz]mGj_@qFr^mHrf@o^nyBiLzr@}SdkAeO`z@{BhMgK`p@wG`i@ka@pmC{QphAec@tlDoGfe@mFt^c`@r`C_I|e@aUfuAsJjl@wGn`@qDbSgDfPsCxLsEjPmDnKmFvNmBvFQj@eIjPcGjLyFnJiEvGeE~FeEjFiFvFwFhFaEjDiEbDmZbTyCdCyHnFc`@bYmkDdlCag@x_@WRalBxxA}n@vf@qlCzoBcBhAic@b\\{eD|dCao@fd@qj@b^}b@p[snAp~@u|@dq@}jAjbAs`@j^ii@pc@kGhFmmAv`A{a@n[uq@`j@mv@|k@}a@n[e`@`Zab@x[aMxJyaAzv@{`BfnAwu@pj@arC~mBqbAdr@{fBtiAoFjDad@rYak@t^aQxKsy@vf@{e@|Xwo@l`@gnA|v@oo@f`@ak@`]iz@ng@aZbRuk@r^}cBzcAup@|`@sf@hZs^xTkiAls@m_Avj@ie@xXyRtLcQlK_h@h[yLnHcTzMkv@xc@}nAhu@mm@f_@kAt@{WdQ_[tRa@T_h@p[qNjIcBbAehAhp@wh@v[mV|Ncu@lc@oj@t]_YvPsVbO{VfOcADkHVcs@dPsRlEs\\~F}GnBoFlCmFlDiJ|Jyq@rw@xBrMjDxN`FrOdShm@jAdC`CnBfCl@~CKdOoFrHsF~HsGhIaJ~C{DhKsJtH{KhGyOhTar@z@oCbFkSlCuHnE}IjAy@jNmJzu@ke@xlAiv@tT~@rEQlAdARPxCtCvC|KrA~JvAlAzLmHf@kDmB}N@_FsAyJWmBlOuJh]ySpJ_GdGwDqByOh\\_SbLyG`Hq@`ET`Dd@xCx@pnAn\\dCfA|@x@d@Fx@Kv@u@t@qBb@{CPoDAgEUeDg@{Ci@_C_AaCc@YuAgFcAaIcEyb@}Eme@oNowAk@ePF{H~@{DlCgGnC_DtC{@bCMxCn@|GjFlDtJxFnOz@hCnCzGfJjW|BxGXpCLdC?rCK|C_@lCaBnF}B`DkAt@{WdQ_[tRa@T_h@p[qNjIcBbAehAhp@wh@v[mV|Ncu@lc@oj@t]_YvPsVbO{VfOyI~EcWhOaOjJ}`@j[aKtKk\\|]aW`]kVd_@gGhJyo@ddAsdCrwDw[jj@idApzA{|@rkAgZj_@_ApAsvAzdB}^~c@qi@pq@}pArbBy@fA_n@vx@qFdHy@dAmzA`rB_I`LoUj[GH_TnYwb@ll@yp@|_Agc@rl@_e@xo@qb@pl@y_@bi@wPlTmh@hs@_UrYsi@hs@mThZkaAxrAst@bbActBhqCaJxLssAveBczAprByw@|dA{z@ziAqc@rj@{m@t{@ucAhvAiBbCq^`f@}^fh@kYdc@yNrUsaAxdBeFjI}JzQqOfX}n@fhAyyA~jCu`BluC}o@hfAegAjeBqZ`e@kd@tr@iq@rfAgz@xrAmnCllEiTd]}b@bq@_mBtyCus@`gAsZ~OyS|K{KvFaf@pVyM|G}IzBaG~@sHFcHa@}HqAmIyCqIaEmUmNuRqJkc@oWcQgLo[yRu@e@{n@g`@k@_@_vD{_CsnDa|B}WsPahHqpEaBcAegHcpE_i@e\\g`HokEiViOmsBopA{}@_k@sn@oa@uVcM{LqFoEoByQeHwSuGw_@{JwSqCsTiB_U_A}V_@meAj@iv@v@_UTeNNmi@Mcm@h@}e@nBgi@@i|@KaQ]{Nc@{Km@uJu@kMoAef@kH}AMoL{@kD?gDLkEr@oDdBiDjCoDxDqCtEaCtFaCfI}AjIoAxKy@vMkLhsCk@nP]bOIfOV|OVrG`@vGnCfYpCx]nCd]bGfu@nFdq@nAtO";
              final points = PolylineDecoder.run(polylineStr);

              for (final point in points) {
                print("point: {$point}");
              }
            },
            child: const Text('Decode'),
          ),
        ],
      ),
    );
  }
}