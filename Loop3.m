function [TeamProgram] = Loop3(Rerun)
%[TeamProgram] = Loop3(Rerun)
%   This will help to run the team analysis again
if Driver_Team_Analysis == 2

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

     Team1_Points = cell2mat(Team1(:,2));
     Team2_Points = cell2mat(Team2(:,2));

     
    Total_Team1_Points2022 = Team1_Points;
    Total_Team2_Points2022 = Team2_Points;

     fprintf('\n%s''s total points for the 2022 season was %d.\n',First_Team,Total_Team1_Points2022)
     fprintf('%s''s total points for the 2022 season was %d.\n\n',Second_Team,Total_Team2_Points2022)


      fprintf('The variability factor determines the percentage increase or decrease in team performance for the 2023 season.\n')
    fprintf('This is basically a what-if scenario based on the selected teams''s performance potential increase or decrease in construction and strategic skills before the next season.\n')
    fprintf('For example: if you enter 0.2 that means a 20%% increase in driver performance while -0.2 means a 20%% decrease in team performance.\n')
    fprintf('You have the choice of picking one team to tweak performance and compare it to the performance of the second team''s performance in 2022 or you can tweak both teams performance variability for 2023 and compare both\n')
    
    Analysis_Choice = input('\nWould you like to analyse both teams or just one?(1 for 1 team or 2 for both teams): ');

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
    bar(2, Data_points(2), 'FaceColor', TeamAnlayse_Colour); 

    [Unchangedteam_Colour] = Bargraph3_Colours(Unchanged_Team); 
    bar(3, Unchanged_Team_Points, 'FaceColor', Unchangedteam_Colour);
    title(sprintf('Comparison of Team Points for %s vs %s', First_Team, Second_Team));
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