// ===============================
// AUTHOR : Gisele Miranda 
// CREATE DATE : 2025 - 07 - 17
// PURPOSE : Data Analysis Strategies for Single-Cell Image-Based Profiling Workshop 
// 			 @University of Campinas, Brazil
// ===============================

// user input
baseDir = getDirectory("Choose the 'Orig' folder");
targetName = getString("Enter image base name (e.g., CP1-SC1-08_P06_T0001)", "CP1-SC1-08_P06_T0001");

folders = newArray("DNA", "Mito", "RNA", "ER", "AGP");
channels = newArray("C01", "C02", "C03", "C04", "C05");
nChannels = folders.length;

// check if file exists
function fileExists(path) {
    return File.exists(path);
}

// search for matching files
filenames = newArray(nChannels);
found = true;

for (ch = 0; ch < nChannels; ch++) {
    folder = folders[ch];
    expectedChannel = channels[ch];

    // Scan the folder for a file starting with targetName and ending with C0x.tif
    fileList = getFileList(baseDir + folder);
    matched = false;

    for (i = 0; i < fileList.length; i++) {
        fname = fileList[i];
        if (startsWith(fname, targetName) && endsWith(fname, expectedChannel + ".tif")) {
            filenames[ch] = baseDir + folder + "/" + fname;
            matched = true;
            break;
        }
    }

    if (!matched) {
        showMessage("Missing Channel", "Could not find file for channel " + expectedChannel + " in folder " + folder);
        found = false;
        break;
    }
}

// load and merge
if (found) {
    imageList = newArray(nChannels);

    for (ch = 0; ch < nChannels; ch++) {
        open(filenames[ch]);
        rename("Channel" + (ch+1));
        run("8-bit");
        imageList[ch] = "Channel" + (ch+1);
    }

    run("Merge Channels...",
        "c1=[" + imageList[0] + "] " +
        "c2=[" + imageList[1] + "] " +
        "c3=[" + imageList[2] + "] " +
        "c4=[" + imageList[3] + "] " +
        "c5=[" + imageList[4] + "] create");

    run("Make Composite");

    // close individual channels
    for (ch = 0; ch < nChannels; ch++) {
        imageTitle = "Channel" + (ch+1);
        if (isOpen(imageTitle)) {
            selectWindow(imageTitle);
            close();
        }
    }
}

// check if a window is open
function isOpen(title) {
    list = getList("window.titles");
    for (i = 0; i < list.length; i++) {
        if (list[i] == title) return true;
    }
    return false;
}
