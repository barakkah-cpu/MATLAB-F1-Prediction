function [DriverProgram] = Loop2(Rerun)
%[DriverProgram] = Loop2(Rerun)
%   This function is meant to help with running the program again
if Driver_Team_Analysis == 1 %<SM:IF:IBISHOMI>

    Slice_Driver_Name = Drivers(2:end,1);%<SM:SLICE:IBISHOMI> %<SM:SORT:IBISHOMI >

    %Since all the driver names are strings, after slicing, use string
    %function to let Matlab know because using curly brackets to extract
    %content of cells directly leads to error
    String_Conversion = string(Slice_Driver_Name);
    
    T = table(String_Conversion);
    
    disp(T)
   
    Driver_name = input('Enter the name of the driver you would like to analyse from the above table. ','s');

    [Driver_name] = Errorcheck_Driver(Driver_name,String_Conversion); %<SM:BUILT-IN-FUNCTION:IBISHOMI >

    %Filtering to find rows that contains drivers name
    %Initializing array to store rows that are matching
    Get_Row = [];

    for i = 2:1:size(RaceResults,1)%<SM:FOR:IBISHOMI> 

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

    while isempty(Variability_Factor) == 1 || Variability_Factor < -1 || Variability_Factor > 1

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
end