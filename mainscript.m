%Name: Ibishomi Barakkah
%Class: EGR-115
%Project Description: This code uses different techniques such as array
%manipulation, slicing,dimunition,filtering,sorting,augmenting to make a
%predictive analysis of Formula 1 race drivers and teams for the 2023 season from the 2022 season and it can also give a visual representation of the team or driver stats if needed
%REFERENCE:CHATGPT - LINE 285-300,335-336 & 157-165 these code lines helped me with
%formatting my grap accordingly because I had problem getting the graph to
%be spaced out and to change colour depending on the teams
clc
clear
close all

RaceResults = readcell('NewRaceResults.xlsx'); % this is for the actual stats calculation
Drivers = readcell('NewDriverSheet.xlsx'); %this is for stats visualization and driver name slicing
Teams = readcell('NewTeamPoints.xlsx');
%remember to load constructor's data for team analysis

%SCORE MARKERS:
%<SM:BOP:IBISHOMI>- line 44
%<SM:WHILE:IBISHOMI> - line 44 %<SM:AUG:IBISHOMI >-Line 75
%<SM:FOR:IBISHOMI> - line 71
%<SM:FILTER:IBISHOMI> - line 73
%<SM:UDF:IBISHOMI > - line 65
%<SM:IF:IBISHOMI> - Line 50
%<SM:SLICE:IBISHOMI> - Line 52
%<SM:SORT:IBISHOMI> - Line 52
%<SM:PLOT:IBISHOMI > - Line 297
%<SM:STRING:IBISHOMI > - Line 301 
%<SM:ROP:IBISHOMI > - Line 104
%<SM:BUILT-FUNC:IBISHOMI > - Line 71 & 217

Rerun = 1;
while Rerun == 1

fprintf('\nWelcome F1 Fans, you can use this programme to tweak and analyse the performance level of the teams and drivers in anticipation for the next racing season.\n')

disp('1. Driver Analysis');

disp('2. Team Analysis');


Driver_Team_Analysis = input('Would you like to get an analysis for a Driver or a Team (Pick from their corresponding numbers above)? ');

while isempty(Driver_Team_Analysis) == 1 ||  Driver_Team_Analysis < 1 ||  Driver_Team_Analysis > 2 || mod( Driver_Team_Analysis,1) ~= 0   %<SM:BOP:IBISHOMI> %<SM:WHILE:IBISHOMI>

    Driver_Team_Analysis = input('Error. Please enter a value of 1 or 2 as displayed above: ');

end

if Driver_Team_Analysis == 1 %<SM:IF:IBISHOMI>

    Slice_Driver_Name = Drivers(2:end,1);%<SM:SLICE:IBISHOMI> %<SM:SORT:IBISHOMI >

    %Since all the driver names are strings, after slicing, use string
    %function to let Matlab know because using curly brackets to extract
    %content of cells directly leads to error
    String_Conversion = string(Slice_Driver_Name);
    
    T = table(String_Conversion);
    
    disp(T)
   
    Driver_name = input('Enter the name of the driver you would like to analyse from the above table. ','s');

    [Driver_name] = Errorcheck_Driver(Driver_name,String_Conversion); %<SM:UDF:IBISHOMI >

    %Filtering to find rows that contains drivers name
    %Initializing array to store rows that are matching
    Get_Row = [];

    for i = 2:1:size(RaceResults,1)%<SM:FOR:IBISHOMI> %<SM:BUILT-FUNC:IBISHOMI >

        if strcmpi(RaceResults{i,2},Driver_name) %<SM:FILTER:IBISHOMI

            Get_Row = [Get_Row;RaceResults(i,:)]; %<SM:AUG:IBISHOMI >
 
        end

    end

        %changing the format of the contents of Get_Row so matlab can read
        %it and perform arithmetic operations
     Race_Points =cell2mat(Get_Row(:,5));
     
    Total_Points2022 = 0; 

    for i = 1:length(Race_Points)

    Total_Points2022 = Total_Points2022 + Race_Points(i);

    end

     fprintf('\n%s''s total points for the 2022 season was %d.\n\n',Driver_name,Total_Points2022)


   

    fprintf('The variability factor determines the percentage increase or decrease in driver performance for the 2023 season.\n')
    fprintf('This is basically a what-if scenario based on the selected driver''s performance potential increase or decrease in driving skills before the next season.\n')
    fprintf('For example: if you enter 0.2 that means a 20%% increase in driver performance while -0.2 means a 20%% decrease in driver performance.\n ')

    Variability_Factor = input('Enter a variability factor between -1 and 1: ');

    while isempty(Variability_Factor) == 1 || Variability_Factor < -1 || Variability_Factor > 1 %<SM:ROP:IBISHOMI > 

    Variability_Factor = input('Invalid input. Please enter a value between -1 and 1 (e.g., 0.1, -0.4): ');

    end


    Predicted_Driver_Performance2023 = Total_Points2022 * (1 + Variability_Factor);

    fprintf('\nThe predicted total points for %s for the 2023 season according to your chosen variability factor of %0.2f is %0.2f\n',Driver_name,Variability_Factor,Predicted_Driver_Performance2023)


     Graph = input(sprintf('Would you like to see a graphical representation of the %s''s points gotten across each track for the 2022 season? (1 is Yes, 0 is No): ',Driver_name));

     while isempty(Graph) == 1 || Graph < 0 || Graph > 1

    Graph = input('Invalid input. Please enter a value between 0 and 1: ');

    end

        if Graph == 1

            All_Tracks = RaceResults(2:end, 1);

            Track_Name = {};

            Points_Per_Track = [];

            for j = 2:size(RaceResults, 1)

                if strcmpi(RaceResults{j, 2}, Driver_name) 

                    Track_Name = [Track_Name; RaceResults{j, 1}];

             Points_Per_Track = [Points_Per_Track; cell2mat(RaceResults(j, 5))];%this helps to get the drivers points earned at each track, it appends them and then converts it from a cell variable to a matrix e.g abu dhabi - 1 

                end

            end

%barchart changes colour depending on what team the driver drove for to reflect the teams color            

    for b = 2:size(RaceResults, 1) 

          if strcmpi(RaceResults{b, 2}, Driver_name) 

                Driver_Team = RaceResults{b, 3};
  
         end
    end

[Team_Colour] = Bargraph_Colours(Driver_Team);

    bar(1:length(Points_Per_Track), Points_Per_Track, 'FaceColor', Team_Colour);
    ylim([0 max(Points_Per_Track) + 10]);
    set(gca, 'XTick', 1:length(Points_Per_Track)); % assigns each track name to each point from the track
    set(gca,  'XTickLabel', Track_Name)
    set(gcf, 'Position', [100, 100, 1000, 500]);
    xtickangle(90)
    xlabel('Race Locations');
    ylabel('Points at Location');
    title(sprintf('Points Scored at Each Track Location for %s', Driver_name));
           
        end

% Continue process for team contrtuctor's standing too and include visual
% elements if user wants to get a visual representation of the predicted
% data to the actual 2022 data. May also include a comparison between
% drivers or teams. calculations can be turned into pdf in final code.

    elseif Driver_Team_Analysis == 2

        Slice_Team_Name = Teams(2:end,1);

        Team_String_Conversion = string(Slice_Team_Name);
    
    S = table(Team_String_Conversion);
    
    disp(S)
   
    First_Team = input('Enter the name of the first team you would like to compare from the above table. ','s');

    while isempty(First_Team) == 1 || isnan(str2double(First_Team)) == 0 || sum(strcmpi(First_Team,Team_String_Conversion)) == 0 %<SM:WHILE:IBISHOMI>
    
        First_Team = input('Error. Enter a name from the table above. ','s');
    
    end

    Second_Team = input('Enter the name of the second team you would like to compare from the above table. ','s');

    while isempty(Second_Team) == 1 || isnan(str2double(Second_Team)) == 0 || sum(strcmpi(Second_Team,Team_String_Conversion)) == 0 %<SM:WHILE:IBISHOMI>
    
        Second_Team = input('Error. Enter a name from the table above. ','s');
    
    end

     Team1 = [];
     Team2 = [];

    for i = 2:size(Teams,1)%<SM:FOR:IBISHOMI> 

        if strcmpi(Teams{i,1},First_Team) %<SM:FILTER:IBISHOMI

            Team1 = [Team1;Teams(i,:)]; %<SM:AUG:IBISHOMI >

        elseif strcmpi(Teams{i,1},Second_Team)

            Team2 = [Team2;Teams(i,:)];
 
        end

    end

     Team1_Points = cell2mat(Team1(:,2));%<SM:BUILT-FUNC:IBISHOMI >
     Team2_Points = cell2mat(Team2(:,2));

     
    Total_Team1_Points2022 = Team1_Points;
    Total_Team2_Points2022 = Team2_Points;

     fprintf('\n%s''s total points for the 2022 season was %d.\n',First_Team,Total_Team1_Points2022)
     fprintf('%s''s total points for the 2022 season was %d.\n\n',Second_Team,Total_Team2_Points2022)


      fprintf('The variability factor determines the percentage increase or decrease in team performance for the 2023 season.\n')
    fprintf('This is basically a what-if scenario based on the selected teams''s performance potential increase or decrease in construction and strategic skills before the next season.\n')
    fprintf('For example: if you enter 0.2 that means a 20%% increase in driver performance while -0.2 means a 20%% decrease in team performance.\n')
    fprintf('You have the choice of picking one team to tweak performance and compare it to the performance of the second team''s performance in 2022 or you can tweak both teams performance variability for 2023 and compare both\n')
    
    Analysis_Choice = input('\nWould you like to analyse both teams or just one?(1 for 1 team or 2 for both teams): '); %<SM:BUILT-FUNC:IBISHOMI >

    while isempty(Analysis_Choice) == 1 || Analysis_Choice < 1 || Analysis_Choice > 2 || mod(Analysis_Choice,1) ~= 0

    Analysis_Choice = input('Invalid input. Please enter a value between 1 and 2: ');

    end

    if Analysis_Choice == 1

    Team_Choice = input(sprintf('Which team would you like to tweak the team performance for? Enter 1 for %s or 2 for %s: ', First_Team, Second_Team));

    while isempty(Team_Choice) == 1 || Team_Choice < 1 || Team_Choice > 2 || mod(Team_Choice, 1) ~= 0

    Team_Choice = input(sprintf('Invalid input. Enter 1 for %s or 2 for %s: ', First_Team, Second_Team));

    end

    if Team_Choice == 1

        Unchanged_Team = Second_Team;

        Unchanged_Team_Points = Total_Team2_Points2022;%For graphing

        Chosen_Team = First_Team;

        Chosen_Team_Points = Total_Team1_Points2022;
       
    else
        Unchanged_Team = First_Team;

        Unchanged_Team_Points = Total_Team1_Points2022;%For graphing
    
        Chosen_Team = Second_Team;
        
        Chosen_Team_Points = Total_Team2_Points2022;
        
    end

    Team_Variability_Factor = input('Enter a variability factor between -1 and 1: ');

    while isempty(Team_Variability_Factor) == 1 || Team_Variability_Factor < -1 || Team_Variability_Factor > 1

    Team_Variability_Factor = input('Invalid input. Please enter a value between -1 and 1 (e.g., 0.1, -0.4): ');

    end


    Predicted_Team_Performance2023 = Chosen_Team_Points * (1 + Team_Variability_Factor);

    fprintf('The predicted total points for %s for the 2023 season according to your chosen variability factor of %0.2f is %0.2f',Chosen_Team,Team_Variability_Factor,Predicted_Team_Performance2023)

    
        
 

    Chosen_Teamstring = string(Chosen_Team);  
    Unchanged_Teamstring = string(Unchanged_Team);

    Data_points = [Predicted_Team_Performance2023;Chosen_Team_Points];

   [TeamAnlayse_Colour] = Bargraph2_Colours(Chosen_Team); 
    bar(1, Data_points(1), 'FaceColor', [.7 .7 .7]); %gray to indicate calculated value on garph
    hold on; 
    bar(2, Data_points(2), 'FaceColor', TeamAnlayse_Colour); %<SM:PLOT:IBISHOMI >

    [Unchangedteam_Colour] = Bargraph3_Colours(Unchanged_Team); 
    bar(3, Unchanged_Team_Points, 'FaceColor', Unchangedteam_Colour);
    title(sprintf('Comparison of Team Points for %s vs %s', First_Team, Second_Team));%<SM:STRING:IBISHOMI > 
    xticks([1,2,3])
    xticklabels({sprintf('%s (Predicted)', Chosen_Teamstring),sprintf('%s (Original Points)',Chosen_Teamstring), sprintf('%s (Unchanged)', Unchanged_Teamstring)});
    xtickangle(75);
    xlabel('Teams');
    ylabel('Total Points');
    hold off;


    
 elseif Analysis_Choice == 2

   Team1_Variability_Factor = input(sprintf('Enter a variability factor between -1 and 1 for %s: ', First_Team));
        
        while isempty(Team1_Variability_Factor) == 1 || Team1_Variability_Factor < -1 || Team1_Variability_Factor > 1
            
            Team1_Variability_Factor = input('Invalid input. Please enter a value between -1 and 1 (e.g., 0.1, -0.4): ');
        
        end

    Team2_Variability_Factor = input(sprintf('Enter a variability factor between -1 and 1 for %s: ', Second_Team));
        
        while isempty(Team2_Variability_Factor) == 1 || Team2_Variability_Factor < -1 || Team2_Variability_Factor > 1
            
            Team2_Variability_Factor = input('Invalid input. Please enter a value between -1 and 1 (e.g., 0.1, -0.4): ');
        
        end

        Predicted_Team1_Performance2023 = Total_Team1_Points2022 * (1 + Team1_Variability_Factor);
        
        Predicted_Team2_Performance2023 = Total_Team2_Points2022 * (1 + Team2_Variability_Factor);

        fprintf('\nThe predicted total points for %s for the 2023 season according to your chosen variability factor of %0.2f is %0.2f\n', First_Team,Team1_Variability_Factor, Predicted_Team1_Performance2023);
        fprintf('The predicted total points for %s for the 2023 season according to your chosen variability factor of %0.2f is %0.2f.\n', Second_Team, Team2_Variability_Factor,Predicted_Team2_Performance2023);
    
       if sum(strcmpi(First_Team,Team_String_Conversion)) == 1
        teamdriver_colour = First_Team;
        elseif sum(strcmpi(Second_Team,Team_String_Conversion)) == 1
        teamdriver_colour = Second_Team;
       end
        
       colour1 = Bargraph4(First_Team);
       colour2 = Bargraph4(Second_Team);

    
       bar(Predicted_Team1_Performance2023,'FaceColor',colour1);
       hold on;
       bar(2,Predicted_Team2_Performance2023,'FaceColor',colour2);
       title(sprintf('Comparison of Team Points for %s vs %s', First_Team, Second_Team));
       xticks([1,2])
       xticklabels({sprintf('%s ', First_Team), sprintf('%s ', Second_Team)});
       xtickangle(75);
       xlabel('Teams');
       ylabel('Predicted Points');
       hold off;
    end

end

Rerun = input('Would you like to run the program again? (Input 1 for yes,2 for no):');
    while isempty(Rerun) == 1 || Rerun < 1 || Rerun > 2 || mod(Rerun,1) ~= 0
    Rerun = input('Error. Would you like to run this program again? (Input 1 or 2)');
    end

    if Rerun == 2

        fprintf('Thank you for using the program!')

   
    end

end
