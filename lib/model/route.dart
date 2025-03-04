import 'package:aurora_navigator/misc/polyline_decoder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapRoute {
  static Polyline getTestRoute() {
    final _polylineStr =
        "qwj}hBokirfAyKfIcBgKaByJg\\pUaBjAyEfDm`@vXeIzFsAaLeCyS}VauBaAcIuBwQcAwIsNspAaD{UkCqN}Dy[{A{LiGec@cBoLuViwAsOam@mI_UmOwa@sEcL{Ou\\eJ_R_L{Ns]md@{IyKsCuDsYsV}d@yWwSgIccAsZqRcGgAYcp@uSanAi_@gLmDqs@oTiRyFqo@aS}_@mLyc@qT__@aSiMeHaV}OuUmPeFqDiDuBkC_BaHgE{HyEoLmHmb@c[{DaDsRuIqLkCyL_CqGuBgLkGaTuMgb@oWcDqBsI{F}LoH{MoIgWcPwfC{~AkX}P_zDecCyh@m]om@{`@_HqEyGuEoH}FkLkJgO{Lia@gc@g_@{f@{Q}Xkh@ww@qg@{s@}}@usAyt@mgAyr@gbAep@s_AyFcFkD_BmFe@cE`@kDbBoDfFoBpGsAvL]jLf@rKxEd_@|Jpw@jDdXj@lK?vHOzHiAvSyDj^y[lwBoO|cAuXbjBmaFxp\\kh@vkDyPjiAq@nEmsCzjRgLpv@_DxS}Ipl@kHdf@{_@lhC_\\dxB_n@dcEqS|tAo}AviKiR~iAySneA_WfjA{Hn[yJ|`@uYfcAoXn}@oA`EmAnDyGvRqHxS_Znw@}Tbi@cOp[_FnKqGdNcV~g@{Wze@{Vzc@wDbGg[zf@qd@no@ue@fm@_nDxjE{mCneD{cB~tBkx@dbAy]`c@kxAbfBuOlRgr@vz@uoBfbCsvBfjCihAhtAqp@tx@cx@xaAiy@vbAqaBxrBsQzTgI|JqeKdhMgi@r^ip@no@oIdJa`@bg@id@hl@i@|@wOvWar@bz@sVlZ{b@ph@_KzLslCbcDgbCdwCyIfG{LvBqJ`A_M_AmgC_b@}H}B}FsDyIoHcFqFg@uAoh@_wAeMc]w_@geA}Sai@sz@{vBeF_NaOu`@_@eAsLs\\sc@_nAsZmz@_Nm_@cLk[{`@mhAyMi_@cd@ooA{Osc@uJaY_[wz@ocAcsCwMaScC_DaEwDyFwDwEiBoDy@aEk@yEKiFF{D^_F|@eEfA{EhBeFxCsEzDeZ~ZyEjEgE`DqFfDo`@`S{LxGkHjC__@xEaI~@}FZcOx@kPG{ZeAqKiBax@wM{QwD{OaD}sAmXmA[aa@yJaqCwq@aEmAkF}A{r@qRs\\cNsN}Fya@cOmMeFmJwDcXmLkZaO}DqBwAq@{YmNwDqBiMuGuTuKiN_IyGuD_FgDsGwEuUsPiN_OgVg[c^wo@oM_Z{Ms^uNcf@aMof@sD}N_Kka@wLkh@gJs]uBuH{_@irAeb@gnAsUei@_Qw`@kZar@cBoDiBkDaUug@mU{g@qFuLogAcbCgk@_oAkEaKyBqEuEqJc@_AoNuZcKmT{AaDyMqYuAwC}Yqn@";
    final _points = PolylineDecoder.run(_polylineStr);

    return Polyline(
      points: _points,
      strokeWidth: 5,
      color: Colors.green,
      borderStrokeWidth: 1,
      borderColor: Colors.greenAccent,
      // pattern: const StrokePattern.dotted(
      //   spacingFactor: 1,
      // ),
    );
  }
}
