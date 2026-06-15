# Formula 1 Race Prediction — MATLAB
A MATLAB programme that analyses historical 2022 Formula 1 race data to generate predicted performance outcomes for the 2023 season. Users can explore driver and team statistics, apply a custom variability factor to simulate performance changes, and view colour-coded bar chart visualisations of the results.

## Overview
This project was built as a final project for EGR 115 — Introduction to Engineering, Fall 2024 at Embry-Riddle Aeronautical University. It applies core MATLAB programming concepts — array manipulation, filtering, sorting, augmentation, user-defined functions, and data visualisation — to real Formula 1 data sourced from the [Formula 1 World Championship (1950–2024) dataset on Kaggle](https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020).

## How It Works
Run `mainscript.m` to launch the programme. You will be prompted to choose between two analysis modes:

1. Driver Analysis
- Select a driver from the 2022 season roster
- The programme displays their total 2022 championship points
- Enter a variability factor between -1 and 1 to simulate a performance increase or decrease (e.g. `0.2` = 20% improvement, `-0.3` = 30% decline)
- The programme outputs a predicted 2023 points total based on your input
- Optionally view a bar chart of points scored at each race circuit, colour-coded by the driver's team

2. Team Analysis
- Select two constructor teams to compare
- Choose to apply a variability factor to one or both teams
- The programme outputs predicted 2023 points and displays a comparison bar chart

At the end of each run, you can choose to restart and analyse a different driver or team.

## Features
- Interactive command-line interface with input validation
- Driver and team performance extraction from Excel datasets
- Custom variability factor for what-if performance projection
- Bar chart visualisations colour-coded by F1 team colours
- User-defined function for driver name error checking (`Errorcheck_Driver.m`)
- Rerun loop allowing multiple analyses in a single session

## Project Structure
```
MATLAB-F1-Prediction/
├── main/
│   └── mainscript.m          # Main execution script
├── src/
│   ├── Loop2.m               # Data processing module
│   ├── Loop3.m               # Data processing module
│   └── Errorcheck_Driver.m   # Driver name validation function
├── visualization/
│   ├── Bargraph_Colours.m    # Team colour mapping for driver chart
│   ├── Bargraph2_Colours.m   # Team colour mapping (single team analysis)
│   ├── Bargraph3_Colours.m   # Team colour mapping (unchanged team)
│   └── Bargraph4.m           # Team colour mapping (dual team analysis)
├── data/
│   ├── NewRaceResults.xlsx   # 2022 race-by-race results per driver
│   ├── NewDriverSheet.xlsx   # Driver name reference sheet
│   └── NewTeamPoints.xlsx    # 2022 constructor championship points
└── README.md
```

## How to Run
1. Clone or download this repository
2. Open MATLAB and set the working directory to the repository root
3. Run the following in the MATLAB command window:

```matlab
run('main/mainscript.m')
```

4. Follow the prompts in the command window

> Note: All three Excel data files in `/data` must be present for the programme to run correctly.

## Data Source
Race results, driver points, and constructor standings are sourced from historical 2022 Formula 1 season data. Data was manually curated from the [Formula 1 World Championship dataset on Kaggle](https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020).

## Tools Used
- MATLAB R2024a
- Microsoft Excel (dataset organisation)

## Author
Barakkah Ibishomi
Aerospace Engineering, Embry-Riddle Aeronautical University  
Developed as a final project for EGR 115 — Introduction to Engineering, Fall 2024
