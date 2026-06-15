function [TeamAnlayse_Colour] = Bargraph2_Colours(Chosen_Team)
% [TeamAnlayse_Colour] = Bargraph2_Colours(Chosen_Team)
%   This code helps to detremine the colour of the bargrapf depending on
%   the team
if strcmpi(Chosen_Team, 'Mercedes')
       
    TeamAnlayse_Colour = 'k'; 

elseif strcmpi(Chosen_Team, 'Red Bull')

    TeamAnlayse_Colour = 'b'; 

elseif strcmpi(Chosen_Team, 'Ferrari')

    TeamAnlayse_Colour = 'r'; 

elseif strcmpi(Chosen_Team, 'McLaren')

    TeamAnlayse_Colour = [1, 0.5, 0]; 

elseif strcmpi(Chosen_Team, 'Aston Martin')

    TeamAnlayse_Colour = 'g';

elseif strcmpi(Chosen_Team, 'Alpine')

    TeamAnlayse_Colour = [1, 0, 1];

elseif strcmpi(Chosen_Team, 'Williams')

    TeamAnlayse_Colour = [0.678, 0.847, 0.902];

elseif strcmpi(Chosen_Team, 'Haas')

    TeamAnlayse_Colour = [0.8, 0.8, 0.8];

elseif strcmpi(Chosen_Team, 'AlphaTauri')

    TeamAnlayse_Colour = [0.1, 0.2, 0.5];

elseif strcmpi(Chosen_Team, 'Alfa Romeo')

    TeamAnlayse_Colour = [0.6, 0, 0];
 end
end
