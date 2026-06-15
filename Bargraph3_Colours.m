function [Unchangedteam_Colour] = Bargraph3_Colours(Unchanged_Team)
% [Unchangedteam_Colour] = Bargraph3_Colours(Unchanged_Team)
%   This code helps to detremine the colour of the bargrapf depending on
%   the team
if strcmpi(Unchanged_Team, 'Mercedes')
       
    Unchangedteam_Colour = 'k'; 

elseif strcmpi(Unchanged_Team, 'Red Bull')

    Unchangedteam_Colour = 'b'; 

elseif strcmpi(Unchanged_Team, 'Ferrari')

    Unchangedteam_Colour = 'r'; 

elseif strcmpi(Unchanged_Team, 'McLaren')

    Unchangedteam_Colour = [1, 0.5, 0]; 

elseif strcmpi(Unchanged_Team, 'Aston Martin')

    Unchangedteam_Colour = 'g';

elseif strcmpi(Unchanged_Team, 'Alpine')

    Unchangedteam_Colour = [1, 0, 1];

elseif strcmpi(Unchanged_Team, 'Williams')

    Unchangedteam_Colour = [0.678, 0.847, 0.902];

elseif strcmpi(Unchanged_Team, 'Haas')

    Unchangedteam_Colour = [0.8, 0.8, 0.8];

elseif strcmpi(Unchanged_Team, 'AlphaTauri')

    Unchangedteam_Colour = [0.1, 0.2, 0.5];

elseif strcmpi(Unchanged_Team, 'Alfa Romeo')

    Unchangedteam_Colour = [0.6, 0, 0];
 end
end