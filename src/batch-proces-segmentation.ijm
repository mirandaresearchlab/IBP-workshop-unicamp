// ===============================
// AUTHOR : Gisele Miranda 
// CREATE DATE : 2025 - 07 - 17
// PURPOSE : Data Analysis Strategies for Single-Cell Image-Based Profiling Workshop 
// 			 @University of Campinas, Brazil
// ===============================

// Batch nuclei segmentation with ImageJ
// Processing pipeline: Median filter -> Otsu threshold -> Fill Holes -> Watershed

dir = getDirectory("Choose a folder with DAPI images");
output = dir + "segmentation_with_thresholding/";

// Create output folder if it doesn't exist
File.makeDirectory(output);

list = getFileList(dir);

for (i = 0; i < list.length; i++) { 
    if (endsWith(list[i], ".tif")) {
        open(dir + list[i]);
        run("8-bit");
        run("Median...", "radius=2");
        setAutoThreshold("Otsu");
        setOption("BlackBackground", true);
        run("Convert to Mask");
        run("Invert");
        run("Fill Holes");
        run("Watershed");
        saveAs("Tiff", output + "mask_" + list[i]);
        close();
    }
}
