(* export_graphics.wl — Export static graphics from a .nb file as PNGs.
   Usage: wolframscript -file export_graphics.wl <input.nb> <output-dir>

   Exports:
   - Output cells with graphics → PNG (output_001.png, output_002.png, ...)
   - ListAnimate / Animate → GIF (anim_001.gif, ...)
   - Manipulate → frame-swapping PNGs (manip_001/frame_000.png, ...)
*)

args = $ScriptCommandLine;

If[Length[args] < 3,
  Print["Usage: wolframscript -file export_graphics.wl <input.nb> <output-dir>"];
  Exit[1]
];

nbFile  = args[[2]];
outDir  = args[[3]];

Print["Opening: ", nbFile];
nb = Get[nbFile];

If[Head[nb] =!= Notebook,
  Print["ERROR: Could not parse notebook"];
  Exit[1]
];

(* Ensure output directory exists *)
If[!DirectoryQ[outDir], CreateDirectory[outDir]];

(* ── Counters ── *)
outputCount   = 0;
animCount     = 0;
manipCount    = 0;

(* ── Helpers ── *)

isGraphicsQ[expr_] := MatchQ[expr,
  _Graphics | _Graphics3D | _Graph | _Image |
  _GeoGraphics | _ContourPlot | _DensityPlot |
  _StreamPlot | _VectorPlot | _ParametricPlot |
  _ParametricPlot3D | _Plot | _Plot3D | _LogPlot |
  _ListPlot | _ListLinePlot | _ListPlot3D |
  _RegionPlot | _RegionPlot3D
];

isAnimationQ[expr_] := MatchQ[expr,
  _ListAnimate | _Animate | _Dynamic |
  ListAnimate[___] | Animate[___]
];

isManipulateQ[expr_] := MatchQ[expr, _Manipulate | Manipulate[___]];

exportPNG[expr_, path_] := Module[{},
  Print["  PNG → ", path];
  Export[path, expr, "PNG", ImageResolution -> 150]
];

exportGIF[frames_, path_, opts___] := Module[{},
  Print["  GIF → ", path];
  Export[path, frames, "GIF",
    "DisplayDurations" -> 0.08,
    "AnimationRepetitions" -> Infinity,
    opts
  ]
];

(* ── Walk notebook cells ── *)

processCell[cell_Cell] := Module[{ctype, content},
  ctype = cell[[1, 2]] /. (s_String -> s) /. _ -> "";

  (* Skip Input cells *)
  If[MemberQ[{"Input", "Code"}, ctype], Return[]];

  (* Output cells *)
  If[ctype === "Output",
    content = cell[[1, 1]];

    Which[
      (* Direct graphics *)
      isGraphicsQ[content],
        outputCount++;
        exportPNG[content,
          FileNameJoin[{outDir, StringTemplate["output_`1`.png"][StringPadLeft[ToString[outputCount], 3, "0"]]}]],

      (* ListAnimate / Animate *)
      isAnimationQ[content],
        animCount++;
        With[{frames = First[content]},
          exportGIF[frames,
            FileNameJoin[{outDir, StringTemplate["anim_`1`.gif"][StringPadLeft[ToString[animCount], 3, "0"]]}]]
        ],

      (* Manipulate *)
      isManipulateQ[content],
        manipCount++;
        With[{
          mDir = FileNameJoin[{outDir,
                   StringTemplate["manip_`1`"][StringPadLeft[ToString[manipCount], 3, "0"]]}]
        },
          If[!DirectoryQ[mDir], CreateDirectory[mDir]];
          (* Sample 20 frames across the first parameter range *)
          Module[{body, param, pmin, pmax, steps = 20, k = 0},
            body  = content[[1]];
            param = content[[2]];
            If[MatchQ[param, {_, _, _}],
              {pvar, pmin, pmax} = param;
              Do[
                With[{val = pmin + i*(pmax - pmin)/steps,
                      fname = FileNameJoin[{mDir,
                               StringTemplate["frame_`1`.png"][StringPadLeft[ToString[i], 3, "0"]]}]},
                  exportPNG[body /. pvar -> val, fname]
                ],
                {i, 0, steps}
              ]
            ]
          ]
        ]
    ];
    Return[]
  ];

  (* CellGroupData — recurse *)
  If[MatchQ[cell, Cell[CellGroupData[{___}, ___], ___]],
    Map[processCell, cell[[1, 1]]];
    Return[]
  ];
];

processCell[other_] := Null;

(* Run *)
Print["Processing cells..."];
Map[processCell, nb[[1]]];

Print["Done. Output: ", outDir];
Print["  Static graphics: ", outputCount];
Print["  Animations:      ", animCount];
Print["  Manipulate:      ", manipCount];
