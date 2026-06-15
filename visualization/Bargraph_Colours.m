function [Team_Colour] = Bargraph_Colours(Driver_Team)
% [Team_Colour] = Bargraph_Colours(Driver_Team)
%   This code helps to detremine the colour of the bargrapf depending on
%   the team
if strcmpi(Driver_Team, 'Mercedes')
       
    Team_Colour = 'k'; 

elseif strcmpi(Driver_Team, 'Red Bull')

    Team_Colour = 'b'; 

elseif strcmpi(Driver_Team, 'Ferrari')

    Team_Colour = 'r'; 

elseif strcmpi(Driver_Team, 'McLaren')

    Team_Colour = [1, 0.5, 0]; 

elseif strcmpi(Driver_Team, 'Aston Martin')

    Team_Colour = 'g';

elseif strcmpi(Driver_Team, 'Alpine')

    Team_Colour = [1, 0, 1];

elseif strcmpi(Driver_Team, 'Williams')

    Team_Colour = [0.678, 0.847, 0.902];

elseif strcmpi(Driver_Team, 'Haas')

    Team_Colour = [0.8, 0.8, 0.8];

elseif strcmpi(Driver_Team, 'AlphaTauri')

    Team_Colour = [0.1, 0.2, 0.5];

 elseif strcmpi(Driver_Team, 'Alfa Romeo')

    Team_Colour = [0.6, 0, 0];
 end
end
