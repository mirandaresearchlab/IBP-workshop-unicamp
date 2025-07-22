# IBP-workshop-unicamp

Welcome to the Workshop on **Data Analysis Strategies for Single-Cell Image-Based Profiling**, a hands-on training designed to equip researchers with essential skills for image-based single-cell data processing and analysis. Across three days, participants will learn foundational principles, segmentation and feature extraction techniques, and downstream single-cell data analysis. We will use Fiji, ImageJ Macro script language, Python and Jupyter Notebooks.

## 📅 Workshop Agenda

### **Day 1 – Introduction to BioImage Analysis**
- Basics of digital images  
- File formats and metadata  
- Fundamentals of image processing (filtering, denoising, contrast)  
- Assessing image quality and reproducibility  
- *Hands-on session using* **Fiji**

### **Day 2 – Cell Segmentation and Feature Extraction**
- Overview of segmentation techniques  
- Machine and deep learning-based segmentation 
- Feature extraction using `regionprops`  
- Exporting single-cell data for analysis  
- *Hands-on session using* **Python notebooks**

### **Day 3 – Single-Cell Data Analysis**
- 🧬 Overview of high-content data structure  
- 📉 Dimensionality reduction: **PCA**, **LDA**, **t-SNE**, **UMAP**  
- 📊 Clustering techniques: **K-Means**, **GMM**  
- 📈 Visualization and interpretation of data  
- 🧪 *Hands-on session with real single-cell datasets*

## 🕘 Daily Schedule

| Time            | Activity              |
|-----------------|-----------------------|
| 09:00 – 10:20   | First Session         |
| 10:20 – 10:40   | Break ☕              |
| 10:40 – 12:00   | Second Session        |
| 12:00 – 13:30   | Lunch Break 🍽️       |
| 13:30 – 14:30   | Third Session         |
| 14:30 – 14:45   | Break ☕              |
| 14:45 – 16:00   | Fourth Session        |

## Repository Structure

- `notebooks/` – All hands-on notebooks
- `src/` – All ImageJ macros
- `data/` – All sample image datasets

## Instructions for installing Miniconda and running Jupyter Notebook

### Installation

Install the [conda](https://conda.io) package, dependency and environment manager.

Download this github repository

Then create the `IBP-workshop-env` conda environment:

    cd <path to your git repository directory>
    conda env create -f environment.yml

This will install all necessary project dependencies.

### Reinstalling the Environment

If the environment already exists and you want to reinstall it (e.g., after editing `environment.yml`), first remove the old environment:

    conda env remove -n image_analysis_env

Then you can just recreate it using the steps above.

## Usage

Copy all project data to the [data](data) directory.

Then run [Jupyter Lab](https://jupyter.org) from within the `image_analysis_env` conda environment:

    cd <path to your git repository directory>
    conda activate image_analysis_env
    jupyter-lab

All analysis notebooks can be found in the [notebooks](notebooks) directory.


