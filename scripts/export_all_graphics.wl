(* export_all_graphics.wl — Export Output cell graphics from a .nb file as PNGs.
   Uses UsingFrontEnd + Rasterize for reliable rendering.

   Usage: wolframscript -file export_all_graphics.wl <input.nb> <output-dir>
*)

args = $ScriptCommandLine;

If[Length[args] < 3,
  Print["Usage: wolframscript -file export_all_graphics.wl <input.nb> <output-dir>"];
  Exit[1]
];

nbFile = args[[2]];
outDir = args[[3]];

Print["Exporting: ", nbFile];
Print["Output:    ", outDir];

UsingFrontEnd[
  (* Open notebook invisibly *)
  nb = NotebookOpen[nbFile, Visible -> False];
  If[nb === $Failed,
    Print["ERROR: Could not open notebook"];
    Exit[1]
  ];

  (* Ensure output directory exists *)
  If[!DirectoryQ[outDir], CreateDirectory[outDir]];

  (* Find all Output cells *)
  cells = Cells[nb, CellStyle -> "Output"];
  Print["Found ", Length[cells], " Output cell(s)"];

  (* Export only Output cells that contain graphics *)
  count = 0;
  skipped = 0;
  Do[
    Module[{cellExpr, img, fname, hasGraphics},
      cellExpr = NotebookRead[cells[[i]]];

      (* Skip empty or non-Cell outputs *)
      If[cellExpr === {} || cellExpr === "" || Head[cellExpr] =!= Cell,
        skipped++;
        Continue[]
      ];

      (* Check if cell contains graphics (GraphicsBox, Graphics3DBox, etc.) *)
      hasGraphics = !FreeQ[cellExpr,
        GraphicsBox | Graphics3DBox | RasterBox | DynamicModuleBox];

      If[!hasGraphics,
        skipped++;
        Print["  skip[", i, "] non-graphics output"];
        Continue[]
      ];

      count++;
      fname = FileNameJoin[{outDir,
        "output_" <> IntegerString[count, 10, 3] <> ".png"}];

      img = Rasterize[cellExpr, ImageResolution -> 150];
      Export[fname, img];
      Print["  [", count, "] ", fname,
        "  (", ImageDimensions[img][[1]], "x", ImageDimensions[img][[2]], ")"];
    ],
    {i, Length[cells]}
  ];

  Print["Skipped ", skipped, " non-graphics output(s)"];

  NotebookClose[nb];
];

Print["Done: ", count, " image(s) exported to ", outDir];
