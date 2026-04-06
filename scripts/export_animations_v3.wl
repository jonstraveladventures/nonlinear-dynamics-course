(* export_animations_v3.wl — Export animations with doubled frame count.
   Evaluates notebook Input cells, finds Table+ListAnimate patterns,
   halves the step size to double the number of frames.

   Usage: wolframscript -file export_animations_v3.wl
*)

nbDir = "/Users/jonathanshock/Cursor folders/MAM2046";
outBase = "/Users/jonathanshock/Cursor folders/MAM2046-site/static/images";

notebooks = {
  {"MAM20462NDpart14-2.nb", "part14-2"},
  {"MAM20462NDpart16.nb", "part16"},
  {"MAM20462NDpart23.nb", "part23"},
  {"MAM20462NDpart32.nb", "part32"},
  {"MAM20462NDpart33.nb", "part33"},
  {"MAM20462NDpart34.nb", "part34"}
};

(* Helper: modify a Table iterator to halve the step size *)
doubleFrames[expr_] := expr /. {
  Table[body_, {var_, min_, max_, step_}] :>
    Table[body, {var, min, max, step/2}]
};

UsingFrontEnd[
  Do[
    {nbName, partDir} = spec;
    outDir = FileNameJoin[{outBase, partDir}];
    Print["\n=== ", partDir, " ==="];

    nb = NotebookOpen[FileNameJoin[{nbDir, nbName}], Visible -> False];
    If[nb === $Failed, Print["  SKIP: could not open"]; Continue[]];

    inputCells = Cells[nb, CellStyle -> "Input"];
    Print["  ", Length[inputCells], " Input cells"];

    animIdx = 0;

    Do[
      cellExpr = NotebookRead[inputCells[[i]]];
      If[Head[cellExpr] =!= Cell, Continue[]];

      boxData = cellExpr[[1]];
      inner = boxData[[1]];
      str = ToString[inner, InputForm];

      If[StringContainsQ[str, "ListAnimate"],
        exprs = If[Head[inner] === List, inner, {inner}];

        Do[
          exprStr = ToString[exprs[[j]], InputForm];
          If[StringQ[exprs[[j]]] || StringContainsQ[exprStr, "ListAnimate"], Continue[]];

          expr = exprs[[j]];
          If[MatchQ[expr, RowBox[{_, ";"}]], expr = expr[[1, 1]]];

          (* Convert BoxData to expression, then double the frames *)
          rawExpr = Quiet[Check[ToExpression[BoxData[expr], StandardForm, Hold], $Failed]];
          If[rawExpr === $Failed, Continue[]];

          modifiedExpr = doubleFrames[ReleaseHold[rawExpr]];
          result = Quiet[Check[modifiedExpr, $Failed]];

          If[ListQ[result] && Length[result] > 2 && !FreeQ[result, Graphics | Graphics3D | Legended],
            animIdx++;
            fname = FileNameJoin[{outDir, "anim_" <> IntegerString[animIdx, 10, 3] <> ".gif"}];
            Export[fname, result, "GIF",
              "DisplayDurations" -> 0.1,
              "AnimationRepetitions" -> Infinity,
              ImageResolution -> 120];
            Print["    anim_", IntegerString[animIdx, 10, 3], ": ", Length[result], " frames"];
          ];,
          {j, Length[exprs]}
        ];,

        Quiet[Check[ToExpression[boxData], $Failed]];
      ];,
      {i, Length[inputCells]}
    ];

    NotebookClose[nb];
    Print["  Done: ", animIdx, " GIF(s)"];,
    {spec, notebooks}
  ];
];

Print["\n=== ALL DONE ==="];
