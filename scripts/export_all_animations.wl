(* ============================================================
   Export all animations from MAM2046 notebooks as GIFs.

   RUN THIS FROM WITHIN THE WOLFRAM GUI:
   1. Open Wolfram application
   2. File → Open → select this file
   3. Evaluate → Evaluate Notebook (or Shift+Enter each cell)

   OR from terminal (if no GUI is running):
   wolframscript -file export_all_animations.wl
   ============================================================ *)

nbDir = "/Users/jonathanshock/Cursor folders/MAM2046";
outDir = "/Users/jonathanshock/Cursor folders/MAM2046-site/static/images";

(* ── Helper: export a Table of frames as GIF ── *)
exportGIF[frames_List, fname_String] := (
  Export[fname, frames, "GIF",
    "DisplayDurations" -> 0.3,
    "AnimationRepetitions" -> Infinity,
    ImageResolution -> 120];
  Print["  Exported: ", fname, " (", Length[frames], " frames)"];
);

(* ============================================================
   PART 31: Saddle-node bifurcation (2 animations)
   ============================================================ *)
Print["=== Part 31 ==="];

(* Animation 1: Null-clines + fixed points + vector field, a varies *)
frames31a = Table[Show[
  Plot[{a x, x^2/(1 + x^2)}, {x, 0, 2},
    PlotStyle -> {Red, Blue}, PlotRange -> {-0.1, 1},
    AxesLabel -> {Style["x", 20], Style["y", 20]}],
  Graphics[{Black, Disk[{0, 0}, {0.04, 0.02}]}],
  If[1 - 4 a^2 > 0,
    {Graphics[{Black, Disk[{(1 + Sqrt[1 - 4 a^2])/(2 a),
        a (1 + Sqrt[1 - 4 a^2])/(2 a)}, {0.04, 0.02}]}],
     Graphics[{Black, Circle[{(1 - Sqrt[1 - 4 a^2])/(2 a),
        a (1 - Sqrt[1 - 4 a^2])/(2 a)}, {0.04, 0.02}]}]},
    Graphics[{Black, Disk[{a, a}, 0.0001]}]],
  VectorPlot[{-a x + y, x^2/(1 + x^2) - y}, {x, 0, 2}, {y, 0, 1}],
  ImageSize -> 700, AspectRatio -> 1
], {a, 0.45, 0.55, 0.005}];
exportGIF[frames31a, FileNameJoin[{outDir, "part31", "anim_saddle_node.gif"}]];

(* Animation 2: StreamPlot + VectorPlot, a varies *)
frames31b = Table[Show[
  StreamPlot[{-a x + y, x^2/(1 + x^2) - y}, {x, 0, 2}, {y, 0, 1}],
  VectorPlot[{-a x + y, x^2/(1 + x^2) - y}, {x, 0, 2}, {y, 0, 1}],
  ImageSize -> 700, AspectRatio -> 1
], {a, 0.45, 0.55, 0.005}];
exportGIF[frames31b, FileNameJoin[{outDir, "part31", "anim_streamplot.gif"}]];

Print["Part 31 done."];

(* ============================================================
   PART 14-2: Conservative systems (3 animations)
   We need to open the notebook and extract the animation code.
   These are typically phase portraits with energy contours.
   ============================================================ *)
Print["=== Part 14-2 ==="];

UsingFrontEnd[
  nb = NotebookOpen[FileNameJoin[{nbDir, "MAM20462NDpart14-2.nb"}], Visible -> False];

  (* Find Input cells containing Table + ListAnimate *)
  inputCells = Cells[nb, CellStyle -> "Input"];
  outputCells = Cells[nb, CellStyle -> "Output"];

  (* Find which Output cells have animations *)
  animOutputs = {};
  Do[
    cellExpr = NotebookRead[outputCells[[i]]];
    If[!FreeQ[cellExpr, DynamicModuleBox],
      AppendTo[animOutputs, i];
    ];,
    {i, Length[outputCells]}
  ];
  Print["  Found ", Length[animOutputs], " animation outputs at positions: ", animOutputs];

  (* For each animation Output, rasterize a single representative frame *)
  Do[
    idx = animOutputs[[j]];
    cellExpr = NotebookRead[outputCells[[idx]]];
    img = Rasterize[cellExpr, ImageResolution -> 120];
    fname = FileNameJoin[{outDir, "part14-2",
      "anim_" <> IntegerString[j, 10, 3] <> ".png"}];
    Export[fname, img];
    Print["  Exported static frame: ", fname];,
    {j, Length[animOutputs]}
  ];

  NotebookClose[nb];
];

Print["Part 14-2 done (static frames — full animation needs manual code extraction)."];

(* ============================================================
   ALL OTHER NOTEBOOKS: Export animation Output cells as static frames
   (The animation code varies per notebook and needs manual extraction
   for proper GIF export. This captures representative frames.)
   ============================================================ *)

animNotebooks = {
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
    Print["=== ", partDir, " ==="];

    nb = NotebookOpen[FileNameJoin[{nbDir, nbName}], Visible -> False];
    If[nb === $Failed, Print["  SKIP: could not open"]; Continue[]];

    outputCells = Cells[nb, CellStyle -> "Output"];

    animIdx = 0;
    Do[
      cellExpr = NotebookRead[outputCells[[i]]];
      If[!FreeQ[cellExpr, DynamicModuleBox],
        animIdx++;
        img = Rasterize[cellExpr, ImageResolution -> 120];
        fname = FileNameJoin[{outDir, partDir,
          "anim_" <> IntegerString[animIdx, 10, 3] <> ".png"}];
        Export[fname, img];
        Print["  Animation ", animIdx, " → ", fname,
          " (", ImageDimensions[img][[1]], "x", ImageDimensions[img][[2]], ")"];
      ];,
      {i, Length[outputCells]}
    ];

    NotebookClose[nb];
    Print["  Done: ", animIdx, " animation(s)"];,
    {spec, animNotebooks}
  ];
];

Print["\n=== ALL DONE ==="];
Print["Part 31: Full GIF animations exported"];
Print["Other parts: Static representative frames exported"];
Print["For full GIF animations of other parts, the Table code"];
Print["needs to be extracted from each notebook individually."];
