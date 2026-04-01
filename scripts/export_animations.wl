(* export_animations.wl — Export animations from a .nb file as GIFs.
   Evaluates the notebook, finds Table[...]+ListAnimate patterns,
   and exports the frame lists as animated GIFs.

   Usage: wolframscript -file export_animations.wl <input.nb> <output-dir>
*)

args = $ScriptCommandLine;

If[Length[args] < 3,
  Print["Usage: wolframscript -file export_animations.wl <input.nb> <output-dir>"];
  Exit[1]
];

nbFile = args[[2]];
outDir = args[[3]];

Print["Exporting animations: ", nbFile];
Print["Output: ", outDir];

If[!DirectoryQ[outDir], CreateDirectory[outDir]];

UsingFrontEnd[
  nb = NotebookOpen[nbFile, Visible -> False];
  If[nb === $Failed,
    Print["ERROR: Could not open notebook"];
    Exit[1]
  ];

  (* Evaluate all cells to populate outputs *)
  Print["Evaluating notebook..."];
  NotebookEvaluate[nb, InsertResults -> True];
  Print["Evaluation complete."];

  (* Find Output cells with animations *)
  outputCells = Cells[nb, CellStyle -> "Output"];
  Print["Output cells: ", Length[outputCells]];

  animIdx = 0;
  graphicsIdx = 0;

  Do[
    cellExpr = NotebookRead[outputCells[[i]]];

    If[!FreeQ[cellExpr, DynamicModuleBox],
      animIdx++;

      (* Find the Input cell immediately before this Output cell group *)
      (* The animation output is typically the result of Table[...]; ListAnimate[%] *)
      (* We look at the previous cell in the CellGroup *)

      (* Try to extract the list of graphics from the DynamicModuleBox *)
      (* The typical structure has a list stored in a DynamicModule variable *)

      (* Most reliable: look at all In[] results stored in the kernel *)
      (* The Out[n] for the Table call contains the list of frames *)

      fname = FileNameJoin[{outDir,
        "anim_" <> IntegerString[animIdx, 10, 3] <> ".gif"}];

      (* Extract cell label to find the Out[] number *)
      cellLabel = Cases[cellExpr, (CellLabel -> lab_) :> lab, Infinity];
      Print["  Animation ", animIdx, " (cell ", i, "): label=", cellLabel];

      (* Since we evaluated, try getting the previous Out (the Table result) *)
      (* The ListAnimate is typically Out[n], and the Table is Out[n-1] *)
      outNum = If[Length[cellLabel] > 0,
        ToExpression[StringReplace[First[cellLabel], {"Out[" -> "", "]=" -> ""}]],
        Null
      ];

      If[IntegerQ[outNum] && outNum > 1,
        (* The Table result is typically one output before *)
        tableResult = Out[outNum - 1];
        If[ListQ[tableResult] && Length[tableResult] > 0 &&
           (Head[First[tableResult]] === Graphics || Head[First[tableResult]] === Legended),
          Print["  Found ", Length[tableResult], " frames from Out[", outNum - 1, "]"];
          Export[fname, tableResult, "GIF",
            "DisplayDurations" -> 0.3,
            "AnimationRepetitions" -> Infinity,
            ImageResolution -> 120
          ];
          Print["  Exported: ", fname];,
          (* Fallback: rasterize individual frame *)
          Print["  Out[", outNum - 1, "] not a graphics list, rasterizing single frame"];
          img = Rasterize[cellExpr, ImageResolution -> 120];
          Export[fname, img];
          Print["  Exported (static): ", fname];
        ];,
        (* No label found, just rasterize *)
        Print["  No label found, rasterizing"];
        img = Rasterize[cellExpr, ImageResolution -> 120];
        Export[fname, img];
        Print["  Exported (static): ", fname];
      ];
    ];,
    {i, Length[outputCells]}
  ];

  NotebookClose[nb];
];

Print["Done: ", animIdx, " animation(s)"];
