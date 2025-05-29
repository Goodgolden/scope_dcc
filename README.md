# SCOPE DCC: A Visual Tool to Support Statistical Analysis Plan Development in Palliative Care Trials

This Quarto book is part of the **2025 SCOPE DCC Project**:  
**"A Visual Tool to Help Develop a Statistical Analysis Plan for Randomized Trials in Palliative Care."**

## Overview

Collaboration with statisticians can be greatly enhanced by understanding how they conceptualize the design and analysis of clinical trials. This project introduces a visual framework—centered around a directed acyclic graph (DAG)—to represent the statistician’s mental model when constructing a Statistical Analysis Plan (SAP). By making this model explicit, we aim to foster clearer communication and co-development of SAPs between palliative care researchers and statistical collaborators.

This book provides a structured template and content outline for creating an SAP tailored to randomized trials in palliative care, especially trials of pain coping interventions. It includes administrative elements, causal modeling, variable definitions, analysis plans, and mock table shells.

## Quarto Book Structure

All Quarto source files (`.qmd`) are organized in a sequential structure reflecting key components of a full SAP. Below is a summary of content sections:

### Administrative and Project Setup
- `00_activity_log.qmd`, `00_sap_revisions.qmd`, `00_template.qmd`
- `10_administrative_information.qmd` to `16_signatures.qmd`

### Study Design and Background
- `20_study_overview.qmd` to `29_stopping.qmd`

### Methodology
- `30_study_design.qmd` to `39_provisions_safety.qmd`

### Statistical Analysis
- `40_statistical_analysis.qmd` to `47_simulations.qmd`

### Output and Reporting
- `50_tables_shells.qmd` to `53_examples.qmd`

### Supplementary Materials
- `60_additional_information.qmd` to `70_references.qmd`
- `index.qmd`: Main entry point of the Quarto book

## Supporting Documents

Located in the `Documents/` folder:
- `analytic_plan_aim[1-5].doc`: SAPs organized by study aim
- `analytic_plan_template_20240925.doc`: A Word version of the SAP template
- `klc_protocol_track_changes_20240226.doc`: Project protocol with revisions
- `project_timeline.xlsx`: Timeline and milestone tracker
- `samsa_colborn_2023.pdf`: Supporting reference literature

## Data and Code

- **Raw Data Script**:  
  `data-raw.R` — Script for loading and formatting raw data for illustrations or simulations.

- **Utility and Plotting Code**:  
  - `00_utils.R`: Project utilities and helper functions  
  - `01_plot_theme.R`: Custom ggplot2 theme for visual consistency

## Usage

To compile this Quarto book:

1. Install [Quarto](https://quarto.org/docs/get-started/).

2. Clone or download this repository.

3. Open the project directory and run:

```bash
   quarto render
```



