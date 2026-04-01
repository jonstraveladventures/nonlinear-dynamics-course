(* export_animations_v2.wl — Export ALL animations from ALL notebooks as GIFs.

   Approach: For each notebook, evaluate Input cells in order.
   When a cell contains Table[...]; ListAnimate[%], strip the
   ListAnimate and semicolon, evaluate the Table, export as GIF.

   Usage: wolframscript -file export_animations_v2.wl
*)

nbDir = "/Users/jonathanshock/Cursor folders/MAM2046";
outBase = "/Users/jonathanshock/Cursor folders/MAM2046-site/static/images";

notebooks = {
  {"MAM20462NDpart14-2.nb", "part14-2"},
  {"MAM20462NDpart16.nb", "part16"},
  {"MAM20462NDpart23.nb", "part23"},
  {"MAM20462NDpart24.nb", "part24"},
  {"MAM20462NDpart25.nb", "part25"},
  {"MAM20462NDpart32.nb", "part32"},
  {"MAM20462NDpart33.nb", "part33"},
  {"MAM20462NDpart34.nb", "part34"},
  {"MAM20462NDpart35.nb", "part35"},
  {"MAM20462NDpart41.nb", "part41"}
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
      inner = boxData[[1]]; (* Inner content *)
      str = ToString[inner, InputForm];

      If[StringContainsQ[str, "ListAnimate"],
        (* This cell has a ListAnimate — find and evaluate the Table *)
        Print["  Cell ", i, ": has ListAnimate"];

        (* inner is either a List of expressions or a single RowBox *)
        exprs = If[Head[inner] === List, inner, {inner}];

        (* Evaluate all non-ListAnimate, non-newline expressions *)
        tableResult = Null;
        Do[
          exprStr = ToString[exprs[[j]], InputForm];
          If[StringQ[exprs[[j]]] || StringContainsQ[exprStr, "ListAnimate"],
            Continue[]
          ];

          (* Strip trailing semicolon *)
          expr = exprs[[j]];
          If[MatchQ[expr, RowBox[{_, ";"}]],
            expr = expr[[1, 1]];
          ];

          result = Quiet[Check[ToExpression[BoxData[expr]], $Failed]];
          If[ListQ[result] && Length[result] > 2 &&
             !FreeQ[result, Graphics | Graphics3D | Legended],
            tableResult = result;
          ];,
          {j, Length[exprs]}
        ];

        If[ListQ[tableResult],
          animIdx++;
          fname = FileNameJoin[{outDir, "anim_" <> IntegerString[animIdx, 10, 3] <> ".gif"}];
          Export[fname, tableResult, "GIF",
            "DisplayDurations" -> 0.3,
            "AnimationRepetitions" -> Infinity,
            ImageResolution -> 120];
          Print["    -> ", fname, " (", Length[tableResult], " frames)"];,
          Print["    Could not extract frames"];
        ];,

        (* Not a ListAnimate cell — just evaluate it (builds up definitions) *)
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
